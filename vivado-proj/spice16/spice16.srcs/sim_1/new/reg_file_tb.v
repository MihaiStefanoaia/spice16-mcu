`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2026 10:49:06 PM
// Design Name: 
// Module Name: reg_file_tb
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
//`include "sp16_reg_file.v"
//`include "clock.v"


module reg_file_tb();
    wire clk;
    reg [31:0] cycle;
    clock clk_mod(.clk(clk));
    
    reg  rst;
    wire rdy;
    reg shdw;
    
    reg wr0_vld;
    reg wr0_swp;
    wire wr0_rdy;
    reg [2:0] wr0_addr;
    reg [7:0] wr0_data;

    reg [2:0] rd0_addr;
    wire[7:0] rd0_data;

    reg [2:0] rd1_addr;
    wire[7:0] rd1_data;
    
    sp16_reg_file dut(
        .clk(clk),
        .rst_rdy(rdy),
        .shdw_mode(shdw),

        .wr0_swp(wr0_swp),
        .wr0_vld(wr0_vld),
        .wr0_rdy(wr0_rdy),
        .wr0_addr(wr0_addr),
        .wr0_data(wr0_data),

        .rd0_addr(rd0_addr),
        .rd0_data(rd0_data),

        .rd1_addr(rd1_addr),
        .rd1_data(rd1_data)
    );
    
    task drive_wr(input swp, input [0:2] addr, input [0:7]data);
        begin
            @(posedge clk);
            wr0_vld  = 1;
            wr0_swp  = swp;
            wr0_addr = addr;
            wr0_data = data;
        end
    endtask
        
    task wait_cycles(input integer c);
        repeat(c) begin
            @(posedge clk);
            wr0_vld = 0;
            wr0_swp = 0;
        end
    endtask
    
    task read_p0(input [0:3] addr);
        rd0_addr = addr;
    endtask
    
    task read_p1(input [0:3] addr);
        rd1_addr = addr;
    endtask
    
    always @(posedge clk) begin
        cycle <= cycle + 1;
    end

    initial begin
        cycle = 0;
        read_p0('h0);
        read_p1('h0);
        rst = 0;
        shdw = 0;
        wr0_swp = 0;
        wait_cycles(3);
        rst = 1;
        wait_cycles(1);
        rst = 0;
        wait(rdy == 1);
        wait_cycles(1);
        drive_wr(0,'h0,'h67);
        read_p0('h0);
        drive_wr(0,'h2,'hE3);
        drive_wr(0,'h6,'h21);
        read_p1('h4);
        read_p0('h2);
        drive_wr(1,'h6,'h00);
        drive_wr(0,'h3,'h69);
        wait_cycles(5);
        drive_wr(1,'h3,'h67);
        drive_wr(0,'h0,'h02);
        drive_wr(0,'h1,'hFF);
        wait_cycles(10);
        shdw = 1;
        wait_cycles(1);
        drive_wr(0,'h7,'h3B);
        wait_cycles(10);
        drive_wr(0,'h1,'h10);
        drive_wr(1,'h2,'h00);
        drive_wr(1,'h3,'h00);
        drive_wr(1,'h2,'h00);
        wait_cycles(1);
        shdw = 0;
        drive_wr(0,'h7,'h9F);
        drive_wr(0,'h1,'h88);
        wait_cycles(10);
        $finish;
    end
endmodule
