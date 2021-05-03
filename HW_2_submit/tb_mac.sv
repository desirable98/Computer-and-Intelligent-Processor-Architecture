`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2021 11:54:37 PM
// Design Name: 
// Module Name: tb_mac
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

module tb_mac(

    );
    logic clk,rst;
    
    logic [31:0] in1,in2,out;
    logic [3:0] func;
    
    initial begin
    clk = 0;
    forever #2ns clk = ~clk;
    end
    
    initial begin

    in1 = 32'b00000100000000110000001000000001;
    in2 = 32'd6;
    func = 4'b1000;
    #4ns
    in1 = 32'b11111111000000101111110100000100;
    in2 = 32'b11111111000000100000001100000100;
    func = 4'b0000;  //2 + 4 =6
    #4ns
//    in1 = 32'd2;
    in2 =  32'b11111111000000101111110100000100;
    func = 4'b0001;  //6 + 3 = 9
    #4ns
//    in1 = 32'd3;
    in2 = 32'b00000000000000110000000100000010;
    func = 4'b0010;  //18 + 2 = 20
    #4ns
//    in1 = 32'd5;
    in2 = 32'b00000010000000010000010000000101;
    func = 4'b0111;  //30 + 1 =39
    
    end
    mac mac(
    clk,
    in1,
    in2,
    func,
    out
    );
endmodule
