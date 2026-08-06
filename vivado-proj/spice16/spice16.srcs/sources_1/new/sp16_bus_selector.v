`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2026 02:11:22 AM
// Design Name: 
// Module Name: sp16_bus_selector
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


module sp16_bus_selector(
    input clk,
    input rst,
    output rdy,
    
    input addr_vld,
    input [3:0] addr_in,
    
    output [2:0] p0_addr,
    input  [7:0] p0_data,

    output [2:0] p1_addr,
    input  [7:0] p1_data,
    
    output [7:0] data_out
    );
    reg [3:0] addr;
    
    assign rdy = ~rst;
    assign data_out = (addr[0] ? p1_data : p0_data) & {8{~rst}};
    assign p0_addr = addr[3:1];
    assign p1_addr = addr[3:1];
    
    always @(posedge clk) begin
        if(addr_vld | rst) begin
            addr <= addr_in & {4{~rst}};
        end
    end
endmodule
