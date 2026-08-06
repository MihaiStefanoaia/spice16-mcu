// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Fri Jul 24 03:29:16 2026
// Host        : DESKTOP-PJFE687 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/vivado-proj/spice16/spice16.sim/sim_1/synth/func/xsim/reg_file_tb_func_synth.v
// Design      : sp16_bus_selector
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module sp16_bus_selector
   (clk,
    rst,
    rdy,
    addr_vld,
    addr_in,
    p0_addr,
    p0_data,
    p1_addr,
    p1_data,
    data_out);
  input clk;
  input rst;
  output rdy;
  input addr_vld;
  input [0:3]addr_in;
  output [0:2]p0_addr;
  input [0:7]p0_data;
  output [0:2]p1_addr;
  input [0:7]p1_data;
  output [0:7]data_out;

  wire [0:3]addr_in;
  wire [0:3]addr_in_IBUF;
  wire \addr_reg[0]_i_1_n_0 ;
  wire \addr_reg[0]_i_2_n_0 ;
  wire \addr_reg[1]_i_1_n_0 ;
  wire \addr_reg[2]_i_1_n_0 ;
  wire \addr_reg[3]_i_1_n_0 ;
  wire \addr_reg_n_0_[3] ;
  wire addr_vld;
  wire addr_vld_IBUF;
  wire [0:7]data_out;
  wire [0:7]data_out_OBUF;
  wire [0:2]p0_addr;
  wire [0:2]p0_addr_OBUF;
  wire [0:7]p0_data;
  wire [0:7]p0_data_IBUF;
  wire [0:2]p1_addr;
  wire [2:2]p1_addr_OBUF;
  wire [0:7]p1_data;
  wire [0:7]p1_data_IBUF;
  wire p_0_in;
  wire rdy;
  wire rdy_OBUF;
  wire rst;
  wire rst_IBUF;

  IBUF \addr_in_IBUF[0]_inst 
       (.I(addr_in[0]),
        .O(addr_in_IBUF[0]));
  IBUF \addr_in_IBUF[1]_inst 
       (.I(addr_in[1]),
        .O(addr_in_IBUF[1]));
  IBUF \addr_in_IBUF[2]_inst 
       (.I(addr_in[2]),
        .O(addr_in_IBUF[2]));
  IBUF \addr_in_IBUF[3]_inst 
       (.I(addr_in[3]),
        .O(addr_in_IBUF[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \addr_reg[0] 
       (.CLR(1'b0),
        .D(\addr_reg[0]_i_1_n_0 ),
        .G(\addr_reg[0]_i_2_n_0 ),
        .GE(1'b1),
        .Q(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_reg[0]_i_1 
       (.I0(addr_in_IBUF[0]),
        .I1(rst_IBUF),
        .O(\addr_reg[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \addr_reg[0]_i_2 
       (.I0(addr_vld_IBUF),
        .I1(rst_IBUF),
        .O(\addr_reg[0]_i_2_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \addr_reg[1] 
       (.CLR(1'b0),
        .D(\addr_reg[1]_i_1_n_0 ),
        .G(\addr_reg[0]_i_2_n_0 ),
        .GE(1'b1),
        .Q(p0_addr_OBUF[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_reg[1]_i_1 
       (.I0(addr_in_IBUF[1]),
        .I1(rst_IBUF),
        .O(\addr_reg[1]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \addr_reg[2] 
       (.CLR(1'b0),
        .D(\addr_reg[2]_i_1_n_0 ),
        .G(\addr_reg[0]_i_2_n_0 ),
        .GE(1'b1),
        .Q(p0_addr_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_reg[2]_i_1 
       (.I0(addr_in_IBUF[2]),
        .I1(rst_IBUF),
        .O(\addr_reg[2]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \addr_reg[3] 
       (.CLR(1'b0),
        .D(\addr_reg[3]_i_1_n_0 ),
        .G(\addr_reg[0]_i_2_n_0 ),
        .GE(1'b1),
        .Q(\addr_reg_n_0_[3] ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_reg[3]_i_1 
       (.I0(addr_in_IBUF[3]),
        .I1(rst_IBUF),
        .O(\addr_reg[3]_i_1_n_0 ));
  IBUF addr_vld_IBUF_inst
       (.I(addr_vld),
        .O(addr_vld_IBUF));
  OBUF \data_out_OBUF[0]_inst 
       (.I(data_out_OBUF[0]),
        .O(data_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h00E4)) 
    \data_out_OBUF[0]_inst_i_1 
       (.I0(p_0_in),
        .I1(p0_data_IBUF[0]),
        .I2(p1_data_IBUF[0]),
        .I3(rst_IBUF),
        .O(data_out_OBUF[0]));
  OBUF \data_out_OBUF[1]_inst 
       (.I(data_out_OBUF[1]),
        .O(data_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h00E4)) 
    \data_out_OBUF[1]_inst_i_1 
       (.I0(p_0_in),
        .I1(p0_data_IBUF[1]),
        .I2(p1_data_IBUF[1]),
        .I3(rst_IBUF),
        .O(data_out_OBUF[1]));
  OBUF \data_out_OBUF[2]_inst 
       (.I(data_out_OBUF[2]),
        .O(data_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h00E4)) 
    \data_out_OBUF[2]_inst_i_1 
       (.I0(p_0_in),
        .I1(p0_data_IBUF[2]),
        .I2(p1_data_IBUF[2]),
        .I3(rst_IBUF),
        .O(data_out_OBUF[2]));
  OBUF \data_out_OBUF[3]_inst 
       (.I(data_out_OBUF[3]),
        .O(data_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h00E4)) 
    \data_out_OBUF[3]_inst_i_1 
       (.I0(p_0_in),
        .I1(p0_data_IBUF[3]),
        .I2(p1_data_IBUF[3]),
        .I3(rst_IBUF),
        .O(data_out_OBUF[3]));
  OBUF \data_out_OBUF[4]_inst 
       (.I(data_out_OBUF[4]),
        .O(data_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h00E4)) 
    \data_out_OBUF[4]_inst_i_1 
       (.I0(p_0_in),
        .I1(p0_data_IBUF[4]),
        .I2(p1_data_IBUF[4]),
        .I3(rst_IBUF),
        .O(data_out_OBUF[4]));
  OBUF \data_out_OBUF[5]_inst 
       (.I(data_out_OBUF[5]),
        .O(data_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h00E4)) 
    \data_out_OBUF[5]_inst_i_1 
       (.I0(p_0_in),
        .I1(p0_data_IBUF[5]),
        .I2(p1_data_IBUF[5]),
        .I3(rst_IBUF),
        .O(data_out_OBUF[5]));
  OBUF \data_out_OBUF[6]_inst 
       (.I(data_out_OBUF[6]),
        .O(data_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h00E4)) 
    \data_out_OBUF[6]_inst_i_1 
       (.I0(p_0_in),
        .I1(p0_data_IBUF[6]),
        .I2(p1_data_IBUF[6]),
        .I3(rst_IBUF),
        .O(data_out_OBUF[6]));
  OBUF \data_out_OBUF[7]_inst 
       (.I(data_out_OBUF[7]),
        .O(data_out[7]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h00E4)) 
    \data_out_OBUF[7]_inst_i_1 
       (.I0(p_0_in),
        .I1(p0_data_IBUF[7]),
        .I2(p1_data_IBUF[7]),
        .I3(rst_IBUF),
        .O(data_out_OBUF[7]));
  OBUF \p0_addr_OBUF[0]_inst 
       (.I(p0_addr_OBUF[0]),
        .O(p0_addr[0]));
  OBUF \p0_addr_OBUF[1]_inst 
       (.I(p0_addr_OBUF[1]),
        .O(p0_addr[1]));
  OBUF \p0_addr_OBUF[2]_inst 
       (.I(p0_addr_OBUF[2]),
        .O(p0_addr[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \p0_addr_OBUF[2]_inst_i_1 
       (.I0(\addr_reg_n_0_[3] ),
        .I1(p_0_in),
        .O(p0_addr_OBUF[2]));
  IBUF \p0_data_IBUF[0]_inst 
       (.I(p0_data[0]),
        .O(p0_data_IBUF[0]));
  IBUF \p0_data_IBUF[1]_inst 
       (.I(p0_data[1]),
        .O(p0_data_IBUF[1]));
  IBUF \p0_data_IBUF[2]_inst 
       (.I(p0_data[2]),
        .O(p0_data_IBUF[2]));
  IBUF \p0_data_IBUF[3]_inst 
       (.I(p0_data[3]),
        .O(p0_data_IBUF[3]));
  IBUF \p0_data_IBUF[4]_inst 
       (.I(p0_data[4]),
        .O(p0_data_IBUF[4]));
  IBUF \p0_data_IBUF[5]_inst 
       (.I(p0_data[5]),
        .O(p0_data_IBUF[5]));
  IBUF \p0_data_IBUF[6]_inst 
       (.I(p0_data[6]),
        .O(p0_data_IBUF[6]));
  IBUF \p0_data_IBUF[7]_inst 
       (.I(p0_data[7]),
        .O(p0_data_IBUF[7]));
  OBUF \p1_addr_OBUF[0]_inst 
       (.I(1'b0),
        .O(p1_addr[0]));
  OBUF \p1_addr_OBUF[1]_inst 
       (.I(1'b0),
        .O(p1_addr[1]));
  OBUF \p1_addr_OBUF[2]_inst 
       (.I(p1_addr_OBUF),
        .O(p1_addr[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \p1_addr_OBUF[2]_inst_i_1 
       (.I0(\addr_reg_n_0_[3] ),
        .I1(p_0_in),
        .O(p1_addr_OBUF));
  IBUF \p1_data_IBUF[0]_inst 
       (.I(p1_data[0]),
        .O(p1_data_IBUF[0]));
  IBUF \p1_data_IBUF[1]_inst 
       (.I(p1_data[1]),
        .O(p1_data_IBUF[1]));
  IBUF \p1_data_IBUF[2]_inst 
       (.I(p1_data[2]),
        .O(p1_data_IBUF[2]));
  IBUF \p1_data_IBUF[3]_inst 
       (.I(p1_data[3]),
        .O(p1_data_IBUF[3]));
  IBUF \p1_data_IBUF[4]_inst 
       (.I(p1_data[4]),
        .O(p1_data_IBUF[4]));
  IBUF \p1_data_IBUF[5]_inst 
       (.I(p1_data[5]),
        .O(p1_data_IBUF[5]));
  IBUF \p1_data_IBUF[6]_inst 
       (.I(p1_data[6]),
        .O(p1_data_IBUF[6]));
  IBUF \p1_data_IBUF[7]_inst 
       (.I(p1_data[7]),
        .O(p1_data_IBUF[7]));
  OBUF rdy_OBUF_inst
       (.I(rdy_OBUF),
        .O(rdy));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT1 #(
    .INIT(2'h1)) 
    rdy_OBUF_inst_i_1
       (.I0(rst_IBUF),
        .O(rdy_OBUF));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
