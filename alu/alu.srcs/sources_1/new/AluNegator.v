`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/27 11:31:37
// Design Name: 
// Module Name: AluNegator
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


module AluNegator(
    input[31:0] B,
    output[31:0] Result
    );

    wire[31:0] BInverse = ~B;

    Adder negatorAdder(
        .A(BInverse),
        .B(1),
        .Result(Result)
    );
endmodule
