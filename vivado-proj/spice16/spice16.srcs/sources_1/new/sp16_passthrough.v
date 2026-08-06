`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2026 03:20:31 PM
// Design Name: 
// Module Name: sp16_passthrough
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


module sp16_passthrough(
    input wire clk,
    input wire rst,
    output wire rdy,
    
    input wire [7:0] bus_l,
    input wire [7:0] bus_h,
    input wire [7:0] bus_i,
    
    input  wire [7:0] rd_rsp_dat,
    input  wire       rd_rsp_vld,
    output wire       rd_rsp_rdy,
    
    input wire [3:0] flags,
    input wire [3:0] flags_det,
    
    input  wire [1:0] op,
    input  wire op_vld,
    output wire op_rdy,
    
    output wire [7:0] outval,
    output wire       outval_vld,
    input  wire       outval_rdy,

    output wire [3:0] outflags,
    output wire [3:0] outflags_vld

    );
    assign rdy = ~rst;
    assign outflags = 'b0;
    assign outflags_vld = 'b0;
    // ^^ this unit does not modify flags at all
    assign op_rdy = ~rst // not in reset 
                    & outval_rdy // can clear the result of the previous op
                    & (
                        0
                        | (&op & rd_rsp_vld) // not waiting for memory
                        | (~&op) // vld/rdy flow is not necessary
                        )
                    & 1;
    assign rd_rsp_rdy = ~rst & outval_rdy & (&op) & op_vld; 
    //assign outval_vld = ~&op | rd_rsp_rdy;
    
    wire [7:0] data_mesh [3:0];
    assign data_mesh[0] = bus_l;
    assign data_mesh[1] = bus_h;
    assign data_mesh[2] = bus_i;
    assign data_mesh[3] = rd_rsp_dat;
    
    wire [3:0] vld_in_mesh;
    assign vld_in_mesh = {rd_rsp_vld, 3'b111};
   
    assign outval = data_mesh[op];
    assign outval_vld = vld_in_mesh[op] & op_vld & ~rst;

endmodule
