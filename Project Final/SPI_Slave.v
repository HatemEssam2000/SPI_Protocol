/*
Created by Eng/ Hatem Essam
date : 6/8/2026
//----------------------------------------------------------------
The Project description / SPI Slave
//----------------------------------------------------------------
-------------------------  Description ---------------------------
Built as Moore FSM 
Parameters :
No puplic parameters 

    input wire MOSI,        //Master Out Slave In // first bit 0 for write, 1 for read & SS_n is 0
    input wire SS_n,        //Slave Slect         // Enable signal to start work
    input wire clk,         //Clock
    input wire rst,         //Active low synchronus reset

    output reg MISO,        //Master In Slave Out
    //RAM Control Signal 

    input wire  [9:0] tx_data,     
    input wire        tx_valid,

    output reg  [7:0] rx_data,
    output reg        rx_valid



//FSM States
localparam IDEL
localparam CHK_CMD
localparam WRITE
localparam READ_ADD
localparam READ_DATA


--------------------  --------------------  --------------------
*/



module SPI_Slave(
    input wire MOSI,        //Master Out Slave In
    input wire SS_n,        //Slave Slect
    input wire clk,         //Clock
    input wire rst,         //Active low synchronus reset

    output reg MISO,        //Master In Slave Out
    //RAM Control Signal 

    input wire  [7:0] tx_data,     
    input wire        tx_valid,

    output reg  [9:0] rx_data,
    output reg        rx_valid
);
//FSM States 
// 1'b101 , 1'b110 and 1'b111 are not used 
localparam IDEL       = 3'b000;
localparam CHK_CMD    = 3'b001;
localparam WRITE      = 3'b010;
localparam READ_ADD   = 3'b011;
localparam READ_DATA  = 3'b100;

// Internal Registers to control the states 
reg [2:0] current_state; 
reg [2:0] next_state; 
reg       rd_received_addr; // if HIGH then 
// register for the counter
reg [3:0] counter;
reg [9:0] temp_reg;
reg       dout_loaded; // NEW: latches once tx_data has been captured into
                        // temp_reg for the current READ_DATA transaction,
                        // so it isn't re-captured every cycle while tx_valid
                        // stays high (fix for bug: rx_valid/tx_valid held
                        // high for the whole MISO shift-out phase).

//----------------------------------------------------------------------
// 1.Next State Logic always block
//----------------------------------------------------------------------
always @(*) begin
if (SS_n) begin
    next_state = IDEL;
end else begin
    case (current_state)
        IDEL: begin
          if (SS_n) begin
          next_state = IDEL;
          end
          else begin
          next_state = CHK_CMD;
          end
        end
        CHK_CMD: begin
          if (SS_n) begin
          next_state = IDEL;
          end 
          else
            if (MOSI) begin
                if (rd_received_addr) begin
                    next_state = READ_DATA;
                end else begin
                    next_state = READ_ADD;
                end
                end else begin
                    next_state = WRITE;
                end
        end
        WRITE: begin
          if (SS_n || rx_valid) begin
          next_state = IDEL;
          end
          else begin
          next_state = WRITE;
          end
        end
        READ_ADD: begin
          if (SS_n || rx_valid) begin
          next_state = IDEL;
          end
          else begin
          next_state = READ_ADD;
          end
        end
        READ_DATA: begin
          if (SS_n) begin
          next_state = IDEL;
          end
          else begin
          next_state = READ_DATA;
          end
        end
        default: begin
          next_state = IDEL;
        end
    endcase

end


end



//----------------------------------------------------------------------
// 2.State Memory always block
//----------------------------------------------------------------------
    always @(posedge clk) begin 
            if (!rst) begin 
                current_state <= IDEL; 
            end else begin 
                current_state <= next_state; 
            end 
    end 

//----------------------------------------------------------------------
// 3.Output Logic always block with posedge clk
//   Moore Output Logic (Purely dependent on current_state) 
//----------------------------------------------------------------------

    always @(posedge clk) begin 
        if (!rst) begin
            rx_data          <= 10'b0000000000;
            rx_valid         <= 1'b0;
            MISO             <= 1'b0;
            rd_received_addr <= 1'b0;
            counter          <= 4'b0000;
            temp_reg         <= 10'b0000000000;
            dout_loaded      <= 1'b0;
        end 

        else if (SS_n) begin
            // Master has ended (or not yet started) a transaction. Force
            // safe idle outputs and do NOT run any state-specific
            // shifting/counting here -- current_state won't actually
            // flip to IDEL until the next edge, so without this guard
            // this block would otherwise execute one extra, spurious
            // cycle of whatever state it was last in (using leftover/
            // don't-care MOSI), corrupting rx_data/counter.
            MISO     <= 1'b0;
            rx_valid <= 1'b0;
        end

        else begin
            case (current_state) 
            IDEL: begin
                MISO    <= 1'b0;
                rx_valid <= 1'b0;
            end 
            CHK_CMD: begin
                MISO    <= 1'b0;
                rx_valid <= 1'b0;
                // The bit sampled here is the FIRST bit of the 10-bit
                // frame (it doubles as the write/read control bit), so it
                // must be captured into the shift register, not dropped.
                rx_data     <= {rx_data[8:0], MOSI};
                counter     <= 4'b0001; // one bit already captured
                dout_loaded <= 1'b0;    // fresh frame starting
            end 
            WRITE: begin 


                        rx_data <= {rx_data[8:0],MOSI};
                        rd_received_addr <= 1'b0; // a WRITE invalidates any
                                                   // previously-latched read
                                                   // address state
                        if (counter == 4'b1001) begin
                            counter <= 1'b0;
                            rx_valid <= 1'b1;
                        end
                        else begin
                        counter <= counter + 4'b0001;
                        rx_valid <= 1'b0;
                        end 
                    


            end
            READ_ADD: begin

                        rx_data <= {rx_data[8:0],MOSI};
                        if (counter == 4'b1001) begin
                            counter <= 1'b0;
                            rx_valid <= 1'b1;
                            rd_received_addr <= 1'b1;

                        end
                        else begin
                        counter <= counter + 4'b0001;
                        rx_valid <= 1'b0;
                        end 
                    

            end
            READ_DATA: begin

                        if (!dout_loaded && counter < 4'b1001) begin
                            // RX phase: still receiving the 10-bit
                            // READ_OPR command frame (cmd bits + dummy
                            // payload bits).
                            rx_data          <= {rx_data[8:0],MOSI};
                            counter          <= counter + 4'b0001;
                            rx_valid         <= 1'b0;
                            rd_received_addr <= 1'b0;
                        end
                        else if (!dout_loaded && counter == 4'b1001) begin
                            // 10th and final bit: capture it too (this was
                            // previously skipped, silently dropping the
                            // last bit of every frame), THEN pulse
                            // rx_valid for exactly one cycle to trigger
                            // the RAM read. Push counter outside the RX
                            // range (0..9) so it can't be mistaken for
                            // "still receiving" once it's reset below.
                            rx_data  <= {rx_data[8:0],MOSI};
                            counter  <= 4'b1111;
                            rx_valid <= 1'b1;
                        end
                        else if (!dout_loaded) begin
                            // Waiting one (or more) cycles for the RAM's
                            // tx_valid to come back after the rx_valid
                            // pulse above.
                            rx_valid <= 1'b0;
                            if (tx_valid) begin
                                temp_reg    <= tx_data;
                                dout_loaded <= 1'b1;
                                counter     <= 4'b1000; // 8 bits to shift out
                            end
                        end
                        else begin
                            // TX phase: shift MSB-first onto MISO.
                            if (counter > 4'b0000) begin
                                MISO    <= temp_reg[counter - 1];
                                counter <= counter - 4'b0001;
                            end
                        end

            end
            default: begin 
                MISO    <= 1'b0;
            end 
        endcase 
        end

    end
    
endmodule




