`timescale 1ns/1ps
//=============================================================================
// Testbench : tb_SPI_Slave_Single_Port_RAM
// DUT       : SPI_Slave_Single_Port_RAM  (top-level wrapper, file
//             SPI_Slave_Single_Port_RAM.v)
//
// NOTE ON NAMING: the assignment spec (Section 2.3 / diagram) calls this
// module "SPI_Slave_With_Single_Port_RAM", but the file you delivered
// names it "SPI_Slave_Single_Port_RAM" and uses the port name "SS_N"
// (capital N) instead of "SS_n". This testbench instantiates it exactly
// as written in your source so it will actually compile against it.
//
// Covers:
//   1. Reset sequence
//   2. Full write cycle  (WRITE_ADDR -> WRITE_OPR)
//   3. Full read cycle   (READ_ADDR  -> READ_OPR), MSB-first on MISO
//   4. Self-checking: written byte vs. byte read back over MISO
//   5. FSM returns to IDLE (current_state == IDEL) whenever SS_n is
//      deasserted, including a mid-frame abort case
//
// KNOWN ISSUE: SPI_Slave.v encodes its 5 FSM states with 2-bit literals
// (2'b000 .. 2'b100) instead of 3-bit literals, even though the state
// register is 3 bits wide. Icarus Verilog truncates 2'b100 (READ_DATA)
// down to 2 bits, which collides with 2'b000 (IDEL) -> both states
// decode to the same encoding. As a direct consequence, READ_DATA is
// dead code and every read transaction fails. This testbench WILL FAIL
// the read-back checks until that is fixed (see chat for details/fix).
//=============================================================================

module tb_SPI_Slave_Single_Port_RAM;

    // ---------------------------------------------------------------
    // DUT I/O
    // ---------------------------------------------------------------
    reg        clk;
    reg        rst;      // active-low, synchronous
    reg        MOSI;
    reg        SS_N;
    wire       MISO;

    // ---------------------------------------------------------------
    // Scoreboard / bookkeeping
    // ---------------------------------------------------------------
    integer errors;
    integer checks;

    // ---------------------------------------------------------------
    // DUT instantiation (top-level wrapper, exact names from your file)
    // ---------------------------------------------------------------
    SPI_Slave_Single_Port_RAM DUT (
        .clk  (clk),
        .rst  (rst),
        .MOSI (MOSI),
        .SS_N (SS_N),
        .MISO (MISO)
    );

    // ---------------------------------------------------------------
    // Clock: 100 MHz (10 ns period)
    // ---------------------------------------------------------------
    initial clk = 1'b0;
    always #5 clk = ~clk;

    // ---------------------------------------------------------------
    // Convenience: hierarchical references into the DUT so the
    // testbench can check internal FSM state / handshake signals
    // (useful for the "return to IDLE" coverage requirement).
    // ---------------------------------------------------------------
    // current_state encoding in SPI_Slave.v:
    //   IDEL=3'b000, CHK_CMD=3'b001, WRITE=3'b010,
    //   READ_ADD=3'b011, READ_DATA=3'b100  (as INTENDED -- see bug note)
    localparam [2:0] IDEL = 3'b000;

    // ---------------------------------------------------------------
    // Task: apply synchronous reset
    // ---------------------------------------------------------------
    task automatic do_reset;
        begin
            rst  = 1'b0;   // assert reset (active low)
            SS_N = 1'b1;
            MOSI = 1'b0;
            repeat (4) @(negedge clk);
            rst = 1'b1;    // release reset
            @(negedge clk);
        end
    endtask

    // ---------------------------------------------------------------
    // Task: drive one 10-bit SPI frame, MSB first, while SS_n is low.
    // Mirrors the master-side protocol in Section 3.2 of the spec:
    // frame = {cmd[1:0], byte[7:0]}, cmd[1]=0 write /1 read.
    // Deasserts SS_n for one idle cycle after the frame completes.
    // ---------------------------------------------------------------
    task automatic send_frame(input [9:0] frame);
        integer k;
        begin
            SS_N = 1'b0;
            for (k = 9; k >= 0; k = k - 1) begin
                @(negedge clk);
                MOSI = frame[k];
            end
            @(negedge clk);
            SS_N = 1'b1;   // end of frame -> FSM must return to IDLE
            MOSI = 1'b0;
            @(negedge clk); // one idle cycle before the next transaction
        end
    endtask

    // ---------------------------------------------------------------
    // Task: write one byte to RAM address `addr`
    //   Frame 1: cmd=00 (WRITE_ADDR), payload = addr
    //   Frame 2: cmd=01 (WRITE_OPR),  payload = data
    // ---------------------------------------------------------------
    task automatic ram_write(input [7:0] addr, input [7:0] data);
        begin
            send_frame({2'b00, addr});
            send_frame({2'b01, data});
        end
    endtask

    // ---------------------------------------------------------------
    // Task: read one byte from RAM address `addr`, MSB-first off MISO.
    //   Frame 1: cmd=10 (READ_ADDR), payload = addr
    //   Frame 2: cmd=11 (READ_OPR),  payload = don't-care (dummy),
    //            then hold SS_n low while sampling 8 bits of MISO.
    // ---------------------------------------------------------------
    task automatic ram_read(input [7:0] addr, output [7:0] data);
        integer k;
        reg [7:0] shifted;
        begin
            send_frame({2'b10, addr});

            // Drive the READ_OPR command frame (cmd + 8 dummy bits),
            // but keep SS_n low afterwards to receive the 8 MISO bits.
            SS_N = 1'b0;
            for (k = 9; k >= 0; k = k - 1) begin
                @(negedge clk);
                MOSI = 1'b1;   // cmd = 2'b11, dummy payload bits = 1
            end

            // Pipeline latency: after the 10th command bit, the design
            // takes 3 clock cycles before the first valid MISO bit
            // appears (1 cycle to pulse rx_valid to the RAM, 1 cycle
            // for the RAM's registered tx_valid/dout to come back, 1
            // cycle to latch that data into the output shift register).
            repeat (3) @(negedge clk);

            // Sample 8 bits shifted out on MISO, MSB first.
            shifted = 8'h00;
            for (k = 0; k < 8; k = k + 1) begin
                @(negedge clk);
                shifted = {shifted[6:0], MISO};
            end

            @(negedge clk);
            SS_N = 1'b1;
            MOSI = 1'b0;
            @(negedge clk);

            data = shifted;
        end
    endtask

    // ---------------------------------------------------------------
    // Task: self-checking compare
    // ---------------------------------------------------------------
    task automatic check_equal(input [255:0] name, input [31:0] exp, input [31:0] got);
        begin
            checks = checks + 1;
            if (exp !== got) begin
                errors = errors + 1;
                $display("[%0t] FAIL: %0s  expected=0x%0h  got=0x%0h", $time, name, exp, got);
            end else begin
                $display("[%0t] PASS: %0s  = 0x%0h", $time, name, got);
            end
        end
    endtask

    task automatic check_idle(input [255:0] name);
        begin
            checks = checks + 1;
            if (DUT.SPI_Slave_IN.current_state !== IDEL) begin
                errors = errors + 1;
                $display("[%0t] FAIL: %0s -- FSM not in IDLE, current_state=%b",
                          $time, name, DUT.SPI_Slave_IN.current_state);
            end else begin
                $display("[%0t] PASS: %0s -- FSM in IDLE", $time, name);
            end
        end
    endtask

    // ---------------------------------------------------------------
    // Main test sequence
    // ---------------------------------------------------------------
    reg [7:0] rd_byte;

    initial begin
        errors = 0;
        checks = 0;
        MOSI   = 1'b0;
        SS_N   = 1'b1;
        rst    = 1'b1;

        $display("=====================================================");
        $display(" TEST 1: Reset sequence");
        $display("=====================================================");
        do_reset();
        check_idle("FSM state after reset");
        check_equal("rx_valid after reset", 1'b0, DUT.rx_valid_from_Slave_to_RAM);
        check_equal("tx_valid after reset", 1'b0, DUT.tx_valid_from_RAM_to_Slave);
        check_equal("MISO after reset",     1'b0, MISO);

        $display("=====================================================");
        $display(" TEST 2: Full WRITE cycle (addr=0x05, data=0xA5)");
        $display("=====================================================");
        ram_write(8'h05, 8'hA5);
        check_idle("FSM state after write-address frame + write-data frame");

        $display("=====================================================");
        $display(" TEST 3: Full WRITE cycle (addr=0x2A, data=0x3C)");
        $display("=====================================================");
        ram_write(8'h2A, 8'h3C);
        check_idle("FSM state after second write");

        $display("=====================================================");
        $display(" TEST 4: Full READ cycle + self-check vs written data");
        $display("=====================================================");
        ram_read(8'h05, rd_byte);
        check_equal("Read-back RAM[0x05]", 8'hA5, rd_byte);
        check_idle("FSM state after first read");

        ram_read(8'h2A, rd_byte);
        check_equal("Read-back RAM[0x2A]", 8'h3C, rd_byte);
        check_idle("FSM state after second read");

        $display("=====================================================");
        $display(" TEST 5: SS_n deasserted mid-frame (abort) -> must");
        $display("         return to IDLE, not lock up the FSM");
        $display("=====================================================");
        SS_N = 1'b0;
        repeat (4) @(negedge clk) MOSI = $random;   // partial, garbage frame
        SS_N = 1'b1;                                 // abort mid-frame
        MOSI = 1'b0;
        repeat (2) @(negedge clk);
        check_idle("FSM state after mid-frame SS_n abort");

        $display("=====================================================");
        $display(" TEST 6: Design still usable after an abort");
        $display("=====================================================");
        ram_write(8'h10, 8'hFF);
        ram_read(8'h10, rd_byte);
        check_equal("Read-back RAM[0x10] after prior abort", 8'hFF, rd_byte);
        check_idle("FSM state after post-abort write/read");

        $display("=====================================================");
        $display(" SUMMARY: %0d checks run, %0d failed", checks, errors);
        $display("=====================================================");
        if (errors == 0)
            $display(">>> ALL TESTS PASSED <<<");
        else
            $display(">>> %0d TEST(S) FAILED <<<", errors);

        $finish;
    end

    // ---------------------------------------------------------------
    // Safety watchdog: fail the run cleanly if something hangs,
    // rather than letting the simulator spin forever.
    // ---------------------------------------------------------------
    initial begin
        #20000;
        $display("[%0t] FAIL: WATCHDOG TIMEOUT -- simulation did not finish", $time);
        $finish;
    end

    // Optional waveform dump for QuestaSim / GTKWave inspection
    initial begin
        $dumpfile("tb_SPI_Slave_Single_Port_RAM.vcd");
        $dumpvars(0, tb_SPI_Slave_Single_Port_RAM);
    end

endmodule
