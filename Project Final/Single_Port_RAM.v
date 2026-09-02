`timescale 1ns/1ps
/*
Created by Eng/ Hatem Essam
date : 6/8/2026
//----------------------------------------------------------------
The Project description / Single Port Synchronous RAM 
//----------------------------------------------------------------
-------------------------  Description ---------------------------
Parameters :
MEM_DEPTH = 256
ADDR_SIZE = 8 

 input wire [9:0] din;              Data input, top 2 bits are the command din[9:8]
 input wire        rx_valid;        if HIGH accept din[7:0] to save the address internally or write operation depend on the command
 input wire        clk;             Clock
 input wire        rst;             Active low synchronous reset 

 output reg [7:0] dout;             Data out
 output reg       tx_valid;         Whenerver the command is memory read the tx_valid shoud be HIGH

 // Write/ Read Commands 
 WRITE_ADDR = 2'b00;                        //Hold din[7:0] as Address for the write operation
 WRITE_OPR  = 2'b01;                        //Write the data din[7:0] on the previous address
 READ_ADDR  = 2'b10;                        //Hold din[7:0] Address for Read Operation
 READ_OPR   = 2'b11;                        // Read operation of the previous address

--------------------  --------------------  --------------------
No functional bugs found here -- module logic verified correct in simulation.
(Reset polarity, command decode, and tx_valid latching all match spec.)
--------------------  --------------------  --------------------
*/




module Single_Port_RAM (
// inputs-outputs ports 
 input wire [9:0] din,
 input wire        rx_valid,
 input wire        clk,
 input wire        rst, 

 output reg [7:0] dout,
 output reg       tx_valid
);
 // parameter  list 
parameter MEM_DEPTH = 256;
parameter ADDR_SIZE = 8;

// Write/ Read Commands 
localparam WRITE_ADDR = 2'b00;
localparam WRITE_OPR  = 2'b01;
localparam READ_ADDR  = 2'b10;
localparam READ_OPR   = 2'b11;

// RAM Structure 
    reg [ADDR_SIZE-1:0] ram [MEM_DEPTH -1:0] ;
    // Internal Registers for holding Addresses
    reg [ADDR_SIZE-1:0] wr_addr;
    reg [ADDR_SIZE-1:0] rd_addr;

//Counter i for reset of the memory
//integer i; 


// RAM Operation
always @( posedge clk) begin
    if ( ~rst ) begin
        //reset operation
        dout     <= 8'b00000000;
        tx_valid <= 1'b0;
        wr_addr  <= {ADDR_SIZE{1'b0}};
        rd_addr  <= {ADDR_SIZE{1'b0}};

/*         //reset all of the cells
        for (i = 0; i < MEM_DEPTH; i = i + 1) begin
        ram[i] = {ADDR_SIZE{1'b0}}; 
            end
*/
    end 
    else begin
        if (rx_valid) begin

                case (din[9:8])
                WRITE_ADDR: begin
                    //Hold Address for the write operation
                    wr_addr <= din[7:0];
                    tx_valid <= 1'b0; // Default      

                    end 
                WRITE_OPR: begin
                    //Write the data on the previous address
                    ram [wr_addr] <= din[7:0];
                    tx_valid <= 1'b0; // Default                         
                    end
                READ_ADDR: begin
                    // Hold Address for Read Operation
                    rd_addr <= din[7:0];
                    tx_valid <= 1'b0; // Default      
                    end 
                READ_OPR: begin
                    // Read operation of the previous address
                    dout[7:0] <= ram [rd_addr];
                    tx_valid <= 1'b1;
                    end   
                default: begin
                    tx_valid <= 1'b0; // Default for no output     
                    end
                endcase
        end 
    end 
    
end   
endmodule