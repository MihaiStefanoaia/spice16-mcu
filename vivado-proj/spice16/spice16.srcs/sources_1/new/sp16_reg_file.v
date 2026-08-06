`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2026 10:28:08 PM
// Design Name: 
// Module Name: sp16_reg_file
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


module sp16_reg_file(
    input wire clk,
    input wire rst,
    output wire rst_rdy,
    input wire shdw_mode,

    input wire wr0_vld,
    output wire wr0_rdy,
    input wire wr0_swp,
    input wire[2:0] wr0_addr,
    input wire[7:0] wr0_data,
    
    input  wire[2:0] rd0_addr,
    output wire[7:0] rd0_data,
    
    input  wire[2:0] rd1_addr,
    output wire[7:0] rd1_data
    );
    
    reg rst_active;
    
    assign rst_rdy = ~rst_active;
    assign wr0_rdy = ~rst_active;
    
    reg [7:0] reg_file [0:7];
    reg [7:0] rsx_main;
    reg [7:0] rsx_shdw;
    

    assign rd0_data = (wr0_addr == rd0_addr && wr0_vld && !wr0_swp) ? wr0_data : reg_file[rd0_addr];
    assign rd1_data = (wr0_addr == rd1_addr && wr0_vld && !wr0_swp) ? wr0_data : reg_file[rd1_addr];

    
    always @(posedge clk) begin
        if(rst) begin
            rst_active <= 1;
            rsx_shdw <= 8'h0;
            rsx_main <= 8'h0;
        end else begin
            rst_active <= 0;
            if(wr0_vld) begin
                if(wr0_swp) begin
                    if(shdw_mode) begin
                        reg_file[wr0_addr] <= rsx_shdw;
                        rsx_shdw <= reg_file[wr0_addr];
                    end else begin
                        reg_file[wr0_addr] <= rsx_main;
                        rsx_main <= reg_file[wr0_addr];
                    end
                end else begin
                    reg_file[wr0_addr] <= wr0_data;
                end
            end
        end
    end
    endmodule
