`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/26 16:32:35
// Design Name: 
// Module Name: AluSubtractor
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


module AluSubtractor(
    input[31:0] A,
    input[31:0] B,
    output[31:0] Result
    );
    // A - B
    wire[31:0] BInverse = ~B;
    wire[31:0] NegatedB;
    Adder negator(
        .A(BInverse),
        .B(1),
        .Result(NegatedB)
    );
    Adder adder(
        .A(A),
        .B(NegatedB),
        .Result(Result)
    );
endmodule
