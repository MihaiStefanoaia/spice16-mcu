`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2026 02:29:57 AM
// Design Name: 
// Module Name: bus_sel_top
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


module bus_sel_top(

    );
    
    wire clk;
    reg val;

    reg [31:0] cycle;
    clock clk_mod(.clk(clk));
    always @(posedge clk) begin
        cycle <= cycle + 1;
    end
    task wait_cycles(input integer c);
        repeat(c) begin
            @(negedge clk);
            val = 0;
        end
    endtask
    
    reg [0:3] addr;
    
    task drive_addr(input[0:3] addr_dr);
    begin
        @(negedge clk);
        addr = addr_dr;
        val = 1;
    end
    endtask
    reg rst;
    wire rdy;
    
    wire [2:0] p0_addr;
    reg  [7:0] p0_data;
    wire [2:0] p1_addr;
    reg  [7:0] p1_data;
    
    wire [7:0] data_out;
    
    sp16_bus_selector dut(
        .clk(clk),
        .rst(rst),
        .rdy(rdy),
        .addr_vld(val),
        .addr_in(addr),
        
        .p0_addr(p0_addr),
        .p0_data(p0_data),
        
        .p1_addr(p1_addr),
        .p1_data(p1_data),
        
        .data_out(data_out)
    );
    initial begin
        rst = 0;
        cycle = 0;
        p0_data = 'h66;
        p1_data = 'h42;
        wait_cycles(5);
        drive_addr('hF);
        drive_addr('h2);
        rst=1;
        wait_cycles(6);
        drive_addr('h6);
        rst=0;
        drive_addr('h4);
        drive_addr('h1);
        wait_cycles(10);
        $finish;
    end

endmodule
