// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Sun Aug  9 15:03:14 2026
// Host        : DESKTOP-7G623KG running 64-bit major release  (build 9200)
// Command     : write_verilog {D:/Digital_Design/Projects/Project_2/Project Final/project_netlist.v}
// Design      : SPI_Slave_Single_Port_RAM
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a35ticpg236-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module SPI_Slave
   (MISO_OBUF,
    Q,
    ram_reg,
    \rd_addr_reg[7] ,
    \rx_data_reg[8]_0 ,
    tx_valid_reg,
    WEA,
    ram_reg_0,
    E,
    clk_IBUF_BUFG,
    MOSI_IBUF,
    ram_reg_1,
    ram_reg_2,
    tx_valid_from_RAM_to_Slave,
    SS_N_IBUF,
    rst_IBUF,
    SR);
  output MISO_OBUF;
  output [1:0]Q;
  output ram_reg;
  output [0:0]\rd_addr_reg[7] ;
  output [7:0]\rx_data_reg[8]_0 ;
  output tx_valid_reg;
  output [0:0]WEA;
  output ram_reg_0;
  output [0:0]E;
  input clk_IBUF_BUFG;
  input MOSI_IBUF;
  input ram_reg_1;
  input ram_reg_2;
  input tx_valid_from_RAM_to_Slave;
  input SS_N_IBUF;
  input rst_IBUF;
  input [0:0]SR;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:0]E;
  wire \FSM_sequential_current_state[2]_i_1_n_0 ;
  wire MISO_OBUF;
  wire MISO_i_1_n_0;
  wire MISO_i_2_n_0;
  wire MISO_i_3_n_0;
  wire MISO_i_5_n_0;
  wire MISO_i_6_n_0;
  wire MOSI_IBUF;
  wire [1:0]Q;
  wire [0:0]SR;
  wire SS_N_IBUF;
  wire [0:0]WEA;
  wire clk_IBUF_BUFG;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[0]_i_2_n_0 ;
  wire \counter[1]_i_1_n_0 ;
  wire \counter[1]_i_2_n_0 ;
  wire \counter[1]_i_3_n_0 ;
  wire \counter[1]_i_4_n_0 ;
  wire \counter[2]_i_1_n_0 ;
  wire \counter[2]_i_2_n_0 ;
  wire \counter[2]_i_3_n_0 ;
  wire \counter[3]_i_1_n_0 ;
  wire \counter[3]_i_2_n_0 ;
  wire \counter[3]_i_3_n_0 ;
  wire \counter[3]_i_4_n_0 ;
  wire \counter[3]_i_5_n_0 ;
  wire \counter[3]_i_6_n_0 ;
  wire \counter_reg_n_0_[2] ;
  wire \counter_reg_n_0_[3] ;
  (* RTL_KEEP = "yes" *) wire [2:0]current_state;
  wire dout_loaded_i_1_n_0;
  wire dout_loaded_i_2_n_0;
  wire dout_loaded_i_3_n_0;
  wire dout_loaded_i_4_n_0;
  wire dout_loaded_reg_n_0;
  wire [2:0]next_state;
  wire ram_reg;
  wire ram_reg_0;
  wire ram_reg_1;
  wire ram_reg_2;
  wire ram_reg_i_5_n_0;
  wire ram_reg_i_6_n_0;
  wire [0:0]\rd_addr_reg[7] ;
  wire rd_received_addr_i_1_n_0;
  wire rd_received_addr_i_2_n_0;
  wire rd_received_addr_i_4_n_0;
  wire rd_received_addr_i_5_n_0;
  wire rd_received_addr_i_6_n_0;
  wire rd_received_addr_reg_i_3_n_0;
  wire rd_received_addr_reg_n_0;
  wire rst_IBUF;
  wire \rx_data[9]_i_1_n_0 ;
  wire [7:0]\rx_data_reg[8]_0 ;
  wire [9:8]rx_data_to_din;
  wire rx_valid_from_Slave_to_RAM;
  wire rx_valid_i_1_n_0;
  wire tx_valid_from_RAM_to_Slave;
  wire tx_valid_reg;

  LUT6 #(
    .INIT(64'h0000000044443F33)) 
    \FSM_sequential_current_state[0]_i_1 
       (.I0(rx_valid_from_Slave_to_RAM),
        .I1(current_state[0]),
        .I2(rd_received_addr_reg_n_0),
        .I3(MOSI_IBUF),
        .I4(current_state[1]),
        .I5(current_state[2]),
        .O(next_state[0]));
  LUT5 #(
    .INIT(32'h003F00A0)) 
    \FSM_sequential_current_state[1]_i_1 
       (.I0(MOSI_IBUF),
        .I1(rx_valid_from_Slave_to_RAM),
        .I2(current_state[0]),
        .I3(current_state[2]),
        .I4(current_state[1]),
        .O(next_state[1]));
  LUT2 #(
    .INIT(4'hB)) 
    \FSM_sequential_current_state[2]_i_1 
       (.I0(SS_N_IBUF),
        .I1(rst_IBUF),
        .O(\FSM_sequential_current_state[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0010001C)) 
    \FSM_sequential_current_state[2]_i_2 
       (.I0(rx_valid_from_Slave_to_RAM),
        .I1(current_state[0]),
        .I2(current_state[2]),
        .I3(current_state[1]),
        .I4(MOSI_IBUF),
        .O(next_state[2]));
  (* FSM_ENCODED_STATES = "CHK_CMD:001,READ_DATA:010,WRITE:100,READ_ADD:011,IDEL:000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_current_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(next_state[0]),
        .Q(current_state[0]),
        .R(\FSM_sequential_current_state[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "CHK_CMD:001,READ_DATA:010,WRITE:100,READ_ADD:011,IDEL:000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_current_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(next_state[1]),
        .Q(current_state[1]),
        .R(\FSM_sequential_current_state[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "CHK_CMD:001,READ_DATA:010,WRITE:100,READ_ADD:011,IDEL:000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_current_state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(next_state[2]),
        .Q(current_state[2]),
        .R(\FSM_sequential_current_state[2]_i_1_n_0 ));
  GND GND
       (.G(\<const0> ));
  LUT5 #(
    .INIT(32'h000055D5)) 
    MISO_i_1
       (.I0(current_state[1]),
        .I1(dout_loaded_reg_n_0),
        .I2(MISO_i_3_n_0),
        .I3(current_state[0]),
        .I4(current_state[2]),
        .O(MISO_i_1_n_0));
  LUT6 #(
    .INIT(64'h0023300200200002)) 
    MISO_i_2
       (.I0(ram_reg_1),
        .I1(MISO_i_5_n_0),
        .I2(MISO_i_6_n_0),
        .I3(\counter_reg_n_0_[3] ),
        .I4(\counter_reg_n_0_[2] ),
        .I5(ram_reg_2),
        .O(MISO_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    MISO_i_3
       (.I0(\counter_reg_n_0_[2] ),
        .I1(\counter_reg_n_0_[3] ),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(MISO_i_3_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    MISO_i_5
       (.I0(current_state[2]),
        .I1(current_state[1]),
        .O(MISO_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h1)) 
    MISO_i_6
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(MISO_i_6_n_0));
  FDRE #(
    .INIT(1'b0)) 
    MISO_reg
       (.C(clk_IBUF_BUFG),
        .CE(MISO_i_1_n_0),
        .D(MISO_i_2_n_0),
        .Q(MISO_OBUF),
        .R(\FSM_sequential_current_state[2]_i_1_n_0 ));
  VCC VCC
       (.P(\<const1> ));
  LUT6 #(
    .INIT(64'h1111111337373537)) 
    \counter[0]_i_1 
       (.I0(current_state[1]),
        .I1(current_state[2]),
        .I2(current_state[0]),
        .I3(\counter[3]_i_5_n_0 ),
        .I4(\counter[0]_i_2_n_0 ),
        .I5(Q[0]),
        .O(\counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hAAABFFFF)) 
    \counter[0]_i_2 
       (.I0(dout_loaded_reg_n_0),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(\counter_reg_n_0_[2] ),
        .I4(\counter_reg_n_0_[3] ),
        .O(\counter[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA0FFA2A288888888)) 
    \counter[1]_i_1 
       (.I0(ram_reg_i_5_n_0),
        .I1(dout_loaded_reg_n_0),
        .I2(\counter[1]_i_2_n_0 ),
        .I3(\counter[1]_i_3_n_0 ),
        .I4(\counter[3]_i_5_n_0 ),
        .I5(\counter[1]_i_4_n_0 ),
        .O(\counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00015555)) 
    \counter[1]_i_2 
       (.I0(dout_loaded_reg_n_0),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(\counter_reg_n_0_[2] ),
        .I4(\counter_reg_n_0_[3] ),
        .O(\counter[1]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hBC)) 
    \counter[1]_i_3 
       (.I0(current_state[2]),
        .I1(current_state[0]),
        .I2(current_state[1]),
        .O(\counter[1]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \counter[1]_i_4 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\counter[1]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h03050037)) 
    \counter[2]_i_1 
       (.I0(\counter[2]_i_2_n_0 ),
        .I1(\counter[2]_i_3_n_0 ),
        .I2(current_state[2]),
        .I3(current_state[0]),
        .I4(current_state[1]),
        .O(\counter[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h56EF5695)) 
    \counter[2]_i_2 
       (.I0(\counter_reg_n_0_[2] ),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(dout_loaded_reg_n_0),
        .I4(\counter_reg_n_0_[3] ),
        .O(\counter[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h95)) 
    \counter[2]_i_3 
       (.I0(\counter_reg_n_0_[2] ),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(\counter[2]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00550540)) 
    \counter[3]_i_1 
       (.I0(SS_N_IBUF),
        .I1(\counter[3]_i_3_n_0 ),
        .I2(current_state[1]),
        .I3(current_state[2]),
        .I4(current_state[0]),
        .O(\counter[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h03C7000500050005)) 
    \counter[3]_i_2 
       (.I0(\counter[3]_i_4_n_0 ),
        .I1(current_state[1]),
        .I2(current_state[0]),
        .I3(current_state[2]),
        .I4(\counter[3]_i_5_n_0 ),
        .I5(\counter[3]_i_6_n_0 ),
        .O(\counter[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFFFFFFE3737)) 
    \counter[3]_i_3 
       (.I0(\counter_reg_n_0_[2] ),
        .I1(\counter_reg_n_0_[3] ),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(dout_loaded_reg_n_0),
        .I5(tx_valid_from_RAM_to_Slave),
        .O(\counter[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h01FE007F)) 
    \counter[3]_i_4 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(\counter_reg_n_0_[2] ),
        .I3(\counter_reg_n_0_[3] ),
        .I4(dout_loaded_reg_n_0),
        .O(\counter[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFDFF)) 
    \counter[3]_i_5 
       (.I0(\counter_reg_n_0_[3] ),
        .I1(\counter_reg_n_0_[2] ),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(\counter[3]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \counter[3]_i_6 
       (.I0(\counter_reg_n_0_[3] ),
        .I1(\counter_reg_n_0_[2] ),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(\counter[3]_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[3]_i_1_n_0 ),
        .D(\counter[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[3]_i_1_n_0 ),
        .D(\counter[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[3]_i_1_n_0 ),
        .D(\counter[2]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[3]_i_1_n_0 ),
        .D(\counter[3]_i_2_n_0 ),
        .Q(\counter_reg_n_0_[3] ),
        .R(SR));
  LUT6 #(
    .INIT(64'hEEFE220200000000)) 
    dout_loaded_i_1
       (.I0(dout_loaded_reg_n_0),
        .I1(dout_loaded_i_2_n_0),
        .I2(dout_loaded_i_3_n_0),
        .I3(ram_reg_i_6_n_0),
        .I4(dout_loaded_i_4_n_0),
        .I5(rst_IBUF),
        .O(dout_loaded_i_1_n_0));
  LUT4 #(
    .INIT(16'h0100)) 
    dout_loaded_i_2
       (.I0(SS_N_IBUF),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .I3(current_state[0]),
        .O(dout_loaded_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000010000000000)) 
    dout_loaded_i_3
       (.I0(current_state[2]),
        .I1(current_state[0]),
        .I2(SS_N_IBUF),
        .I3(current_state[1]),
        .I4(dout_loaded_reg_n_0),
        .I5(tx_valid_from_RAM_to_Slave),
        .O(dout_loaded_i_3_n_0));
  LUT3 #(
    .INIT(8'h08)) 
    dout_loaded_i_4
       (.I0(tx_valid_from_RAM_to_Slave),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(dout_loaded_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    dout_loaded_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(dout_loaded_i_1_n_0),
        .Q(dout_loaded_reg_n_0),
        .R(\<const0> ));
  LUT4 #(
    .INIT(16'h80FF)) 
    ram_reg_i_1
       (.I0(rx_valid_from_Slave_to_RAM),
        .I1(rx_data_to_din[8]),
        .I2(rx_data_to_din[9]),
        .I3(rst_IBUF),
        .O(ram_reg_0));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    ram_reg_i_2
       (.I0(tx_valid_from_RAM_to_Slave),
        .I1(dout_loaded_reg_n_0),
        .I2(current_state[1]),
        .I3(SS_N_IBUF),
        .I4(ram_reg_i_5_n_0),
        .I5(ram_reg_i_6_n_0),
        .O(ram_reg));
  LUT3 #(
    .INIT(8'h40)) 
    ram_reg_i_4
       (.I0(rx_data_to_din[9]),
        .I1(rx_data_to_din[8]),
        .I2(rx_valid_from_Slave_to_RAM),
        .O(WEA));
  LUT2 #(
    .INIT(4'h1)) 
    ram_reg_i_5
       (.I0(current_state[0]),
        .I1(current_state[2]),
        .O(ram_reg_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0057)) 
    ram_reg_i_6
       (.I0(\counter_reg_n_0_[3] ),
        .I1(\counter_reg_n_0_[2] ),
        .I2(Q[1]),
        .I3(dout_loaded_reg_n_0),
        .O(ram_reg_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \rd_addr[7]_i_1 
       (.I0(rx_data_to_din[9]),
        .I1(rx_valid_from_Slave_to_RAM),
        .I2(rx_data_to_din[8]),
        .O(\rd_addr_reg[7] ));
  LUT6 #(
    .INIT(64'hA8AAABAA00000000)) 
    rd_received_addr_i_1
       (.I0(rd_received_addr_reg_n_0),
        .I1(SS_N_IBUF),
        .I2(rd_received_addr_i_2_n_0),
        .I3(rd_received_addr_reg_i_3_n_0),
        .I4(rd_received_addr_i_4_n_0),
        .I5(rst_IBUF),
        .O(rd_received_addr_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    rd_received_addr_i_2
       (.I0(current_state[1]),
        .I1(current_state[2]),
        .O(rd_received_addr_i_2_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    rd_received_addr_i_4
       (.I0(current_state[2]),
        .I1(current_state[0]),
        .O(rd_received_addr_i_4_n_0));
  LUT6 #(
    .INIT(64'h00005557FFFFFFFF)) 
    rd_received_addr_i_5
       (.I0(\counter_reg_n_0_[3] ),
        .I1(\counter_reg_n_0_[2] ),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(dout_loaded_reg_n_0),
        .I5(current_state[1]),
        .O(rd_received_addr_i_5_n_0));
  LUT5 #(
    .INIT(32'h00080000)) 
    rd_received_addr_i_6
       (.I0(current_state[1]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(\counter_reg_n_0_[2] ),
        .I4(\counter_reg_n_0_[3] ),
        .O(rd_received_addr_i_6_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rd_received_addr_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(rd_received_addr_i_1_n_0),
        .Q(rd_received_addr_reg_n_0),
        .R(\<const0> ));
  MUXF7 rd_received_addr_reg_i_3
       (.I0(rd_received_addr_i_5_n_0),
        .I1(rd_received_addr_i_6_n_0),
        .O(rd_received_addr_reg_i_3_n_0),
        .S(current_state[0]));
  LUT5 #(
    .INIT(32'h00550540)) 
    \rx_data[9]_i_1 
       (.I0(SS_N_IBUF),
        .I1(ram_reg_i_6_n_0),
        .I2(current_state[1]),
        .I3(current_state[2]),
        .I4(current_state[0]),
        .O(\rx_data[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(MOSI_IBUF),
        .Q(\rx_data_reg[8]_0 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(\rx_data_reg[8]_0 [0]),
        .Q(\rx_data_reg[8]_0 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(\rx_data_reg[8]_0 [1]),
        .Q(\rx_data_reg[8]_0 [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(\rx_data_reg[8]_0 [2]),
        .Q(\rx_data_reg[8]_0 [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(\rx_data_reg[8]_0 [3]),
        .Q(\rx_data_reg[8]_0 [4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(\rx_data_reg[8]_0 [4]),
        .Q(\rx_data_reg[8]_0 [5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(\rx_data_reg[8]_0 [5]),
        .Q(\rx_data_reg[8]_0 [6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(\rx_data_reg[8]_0 [6]),
        .Q(\rx_data_reg[8]_0 [7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(\rx_data_reg[8]_0 [7]),
        .Q(rx_data_to_din[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(rx_data_to_din[8]),
        .Q(rx_data_to_din[9]),
        .R(SR));
  LUT6 #(
    .INIT(64'hFD70FD5001400150)) 
    rx_valid_i_1
       (.I0(\counter[3]_i_5_n_0 ),
        .I1(current_state[0]),
        .I2(current_state[1]),
        .I3(current_state[2]),
        .I4(dout_loaded_reg_n_0),
        .I5(rx_valid_from_Slave_to_RAM),
        .O(rx_valid_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rx_valid_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(rx_valid_i_1_n_0),
        .Q(rx_valid_from_Slave_to_RAM),
        .R(\FSM_sequential_current_state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hE2220000)) 
    tx_valid_i_1
       (.I0(tx_valid_from_RAM_to_Slave),
        .I1(rx_valid_from_Slave_to_RAM),
        .I2(rx_data_to_din[8]),
        .I3(rx_data_to_din[9]),
        .I4(rst_IBUF),
        .O(tx_valid_reg));
  LUT3 #(
    .INIT(8'h04)) 
    \wr_addr[7]_i_1 
       (.I0(rx_data_to_din[9]),
        .I1(rx_valid_from_Slave_to_RAM),
        .I2(rx_data_to_din[8]),
        .O(E));
endmodule

(* ADDR_SIZE = "8" *) (* MEM_DEPTH = "256" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module SPI_Slave_Single_Port_RAM
   (clk,
    rst,
    MOSI,
    SS_N,
    MISO);
  input clk;
  input rst;
  input MOSI;
  input SS_N;
  output MISO;

  wire MISO;
  wire MISO_OBUF;
  wire MOSI;
  wire MOSI_IBUF;
  wire RAM_IN1_n_0;
  wire RAM_IN1_n_2;
  wire RAM_IN1_n_3;
  wire SPI_Slave_IN_n_1;
  wire SPI_Slave_IN_n_13;
  wire SPI_Slave_IN_n_14;
  wire SPI_Slave_IN_n_15;
  wire SPI_Slave_IN_n_16;
  wire SPI_Slave_IN_n_2;
  wire SPI_Slave_IN_n_3;
  wire SPI_Slave_IN_n_4;
  wire SS_N;
  wire SS_N_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire rst;
  wire rst_IBUF;
  wire [7:0]rx_data_to_din;
  wire tx_valid_from_RAM_to_Slave;

  OBUF MISO_OBUF_inst
       (.I(MISO_OBUF),
        .O(MISO));
  IBUF MOSI_IBUF_inst
       (.I(MOSI),
        .O(MOSI_IBUF));
  Single_Port_RAM RAM_IN1
       (.E(SPI_Slave_IN_n_16),
        .MISO_reg(RAM_IN1_n_2),
        .MISO_reg_0(RAM_IN1_n_3),
        .Q(rx_data_to_din),
        .SR(RAM_IN1_n_0),
        .WEA(SPI_Slave_IN_n_14),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\counter_reg[1] ({SPI_Slave_IN_n_1,SPI_Slave_IN_n_2}),
        .rst_IBUF(rst_IBUF),
        .\rx_data_reg[9] (SPI_Slave_IN_n_4),
        .rx_valid_reg(SPI_Slave_IN_n_15),
        .tx_valid_from_RAM_to_Slave(tx_valid_from_RAM_to_Slave),
        .tx_valid_reg_0(SPI_Slave_IN_n_3),
        .tx_valid_reg_1(SPI_Slave_IN_n_13));
  SPI_Slave SPI_Slave_IN
       (.E(SPI_Slave_IN_n_16),
        .MISO_OBUF(MISO_OBUF),
        .MOSI_IBUF(MOSI_IBUF),
        .Q({SPI_Slave_IN_n_1,SPI_Slave_IN_n_2}),
        .SR(RAM_IN1_n_0),
        .SS_N_IBUF(SS_N_IBUF),
        .WEA(SPI_Slave_IN_n_14),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .ram_reg(SPI_Slave_IN_n_3),
        .ram_reg_0(SPI_Slave_IN_n_15),
        .ram_reg_1(RAM_IN1_n_2),
        .ram_reg_2(RAM_IN1_n_3),
        .\rd_addr_reg[7] (SPI_Slave_IN_n_4),
        .rst_IBUF(rst_IBUF),
        .\rx_data_reg[8]_0 (rx_data_to_din),
        .tx_valid_from_RAM_to_Slave(tx_valid_from_RAM_to_Slave),
        .tx_valid_reg(SPI_Slave_IN_n_13));
  IBUF SS_N_IBUF_inst
       (.I(SS_N),
        .O(SS_N_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
endmodule

module Single_Port_RAM
   (SR,
    tx_valid_from_RAM_to_Slave,
    MISO_reg,
    MISO_reg_0,
    clk_IBUF_BUFG,
    rst_IBUF,
    rx_valid_reg,
    tx_valid_reg_0,
    Q,
    WEA,
    tx_valid_reg_1,
    \counter_reg[1] ,
    E,
    \rx_data_reg[9] );
  output [0:0]SR;
  output tx_valid_from_RAM_to_Slave;
  output MISO_reg;
  output MISO_reg_0;
  input clk_IBUF_BUFG;
  input rst_IBUF;
  input rx_valid_reg;
  input tx_valid_reg_0;
  input [7:0]Q;
  input [0:0]WEA;
  input tx_valid_reg_1;
  input [1:0]\counter_reg[1] ;
  input [0:0]E;
  input [0:0]\rx_data_reg[9] ;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:0]E;
  wire MISO_reg;
  wire MISO_reg_0;
  wire [7:0]Q;
  wire [0:0]SR;
  wire [0:0]WEA;
  wire clk_IBUF_BUFG;
  wire [1:0]\counter_reg[1] ;
  wire [7:0]dout_to_tx_data;
  wire [7:0]rd_addr;
  wire rst_IBUF;
  wire [0:0]\rx_data_reg[9] ;
  wire rx_valid_reg;
  wire tx_valid_from_RAM_to_Slave;
  wire tx_valid_reg_0;
  wire tx_valid_reg_1;
  wire [7:0]wr_addr;

  GND GND
       (.G(\<const0> ));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    MISO_i_4
       (.I0(dout_to_tx_data[0]),
        .I1(dout_to_tx_data[1]),
        .I2(\counter_reg[1] [0]),
        .I3(\counter_reg[1] [1]),
        .I4(dout_to_tx_data[2]),
        .I5(dout_to_tx_data[3]),
        .O(MISO_reg));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    MISO_i_7
       (.I0(dout_to_tx_data[4]),
        .I1(dout_to_tx_data[5]),
        .I2(\counter_reg[1] [0]),
        .I3(\counter_reg[1] [1]),
        .I4(dout_to_tx_data[6]),
        .I5(dout_to_tx_data[7]),
        .O(MISO_reg_0));
  VCC VCC
       (.P(\<const1> ));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "2048" *) 
  (* RTL_RAM_NAME = "ram" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "1023" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "7" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(1),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    ram_reg
       (.ADDRARDADDR({\<const1> ,\<const1> ,wr_addr,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .ADDRBWRADDR({\<const1> ,\<const1> ,rd_addr,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .CLKARDCLK(clk_IBUF_BUFG),
        .CLKBWRCLK(clk_IBUF_BUFG),
        .DIADI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,Q}),
        .DIBDI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .DIPADIP({\<const0> ,\<const0> }),
        .DIPBDIP({\<const0> ,\<const0> }),
        .DOBDO(dout_to_tx_data),
        .ENARDEN(rst_IBUF),
        .ENBWREN(rx_valid_reg),
        .REGCEAREGCE(\<const0> ),
        .REGCEB(tx_valid_reg_0),
        .RSTRAMARSTRAM(\<const0> ),
        .RSTRAMB(SR),
        .RSTREGARSTREG(\<const0> ),
        .RSTREGB(SR),
        .WEA({WEA,WEA}),
        .WEBWE({\<const0> ,\<const0> ,\<const0> ,\<const0> }));
  LUT1 #(
    .INIT(2'h1)) 
    ram_reg_i_3
       (.I0(rst_IBUF),
        .O(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data_reg[9] ),
        .D(Q[0]),
        .Q(rd_addr[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data_reg[9] ),
        .D(Q[1]),
        .Q(rd_addr[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data_reg[9] ),
        .D(Q[2]),
        .Q(rd_addr[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data_reg[9] ),
        .D(Q[3]),
        .Q(rd_addr[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data_reg[9] ),
        .D(Q[4]),
        .Q(rd_addr[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data_reg[9] ),
        .D(Q[5]),
        .Q(rd_addr[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data_reg[9] ),
        .D(Q[6]),
        .Q(rd_addr[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data_reg[9] ),
        .D(Q[7]),
        .Q(rd_addr[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    tx_valid_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(tx_valid_reg_1),
        .Q(tx_valid_from_RAM_to_Slave),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(Q[0]),
        .Q(wr_addr[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(Q[1]),
        .Q(wr_addr[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(Q[2]),
        .Q(wr_addr[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(Q[3]),
        .Q(wr_addr[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(Q[4]),
        .Q(wr_addr[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(Q[5]),
        .Q(wr_addr[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(Q[6]),
        .Q(wr_addr[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(Q[7]),
        .Q(wr_addr[7]),
        .R(SR));
endmodule
