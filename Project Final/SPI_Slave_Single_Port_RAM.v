`timescale 1ns/1ps
/*
Created by Eng/ Hatem Essam
date : 6/8/2026
//----------------------------------------------------------------
The Project description / SPI Slave with Single Port RAM
//----------------------------------------------------------------
-------------------------  Description ---------------------------
Parameters : To control the RAM Size
parameter MEM_DEPTH = 256;
parameter ADDR_SIZE = 8;

// input/output ports 

input wire clk,
input wire rst,
input wire MOSI,
input wire SS_N,

output reg MISO,


--------------------  --------------------  --------------------
*/




module SPI_Slave_Single_Port_RAM (
    input wire clk,
    input wire rst,
    input wire MOSI,
    input wire SS_N,

    output wire MISO
);

localparam MEM_DEPTH = 256;
localparam ADDR_SIZE = 8;


wire [9:0] rx_data_to_din;
wire       rx_valid_from_Slave_to_RAM;
wire [7:0] dout_to_tx_data;
wire       tx_valid_from_RAM_to_Slave;


SPI_Slave SPI_Slave_IN (
    .MOSI(MOSI),
    .SS_n(SS_N),
    .clk(clk),
    .rst(rst),
    .MISO(MISO),
    .tx_data(dout_to_tx_data),
    .tx_valid(tx_valid_from_RAM_to_Slave),
    .rx_data(rx_data_to_din),
    .rx_valid(rx_valid_from_Slave_to_RAM)

);


Single_Port_RAM #(
        .MEM_DEPTH(MEM_DEPTH),
        .ADDR_SIZE(ADDR_SIZE)
    )
    RAM_IN1 (
    .din(rx_data_to_din),
    .rx_valid(rx_valid_from_Slave_to_RAM),
    .clk(clk),
    .rst(rst),
    .dout(dout_to_tx_data),
    .tx_valid(tx_valid_from_RAM_to_Slave)

);
    
endmodule
