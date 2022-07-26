`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/26 16:32:19
// Design Name: 
// Module Name: AluAdder
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

module AluAdder(
    input[31:0] A,
    input[31:0] B,
    output[31:0] Result
    );
    Adder adder(
        .A(A),
        .B(B),
        .Result(Result)
    );
endmodule
