`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/23 16:02:04
// Design Name: 
// Module Name: FourBitAdder
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


module FourBitAdder(
    input [3:0] a,
    input [3:0] b,
    output [4:0] s
    );

    FullAdder adder0(
        .a(a[0]),
        .b(b[0]),
        .ci(0),
        .co(cout0),
        .s(s[0])
    );
    FullAdder adder1(
        .a(a[1]),
        .b(b[1]),
        .ci(cout0),
        .co(cout1),
        .s(s[1])
    );
    FullAdder adder2(
        .a(a[2]),
        .b(b[2]),
        .ci(cout1),
        .co(cout2),
        .s(s[2])
    );
    FullAdder adder3(
        .a(a[3]),
        .b(b[3]),
        .ci(cout2),
        .co(cout3),
        .s(s[3])
    );
    assign s[4] = cout3;

endmodule
