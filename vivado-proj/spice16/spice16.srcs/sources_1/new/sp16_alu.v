`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2026 01:28:17 PM
// Design Name: 
// Module Name: sp16_alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sp16_alu(
    input  wire clk,
    input  wire rst,
    output wire rdy,
    
    input  wire [7:0] bus_l,
    input  wire [7:0] bus_h,
    input  wire [7:0] bus_i,
    
    input  wire [7:0] rd_rsp_dat,
    input  wire [7:0] rd_rsp_vld,
    output wire [7:0] rd_rsp_rdy,
    
    input  wire [3:0] flags,
    input  wire [3:0] flags_det,
    
    input  wire [3:0] op,
    input  wire op_vld,
    output wire op_rdy,
    
    output wire [7:0] outval,
    output wire       outval_vld,
    input  wire       outval_rdy,

    output wire [3:0] outflags,
    output wire [3:0] outflags_vld
    );
endmodule
