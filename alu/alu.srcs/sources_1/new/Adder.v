`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/26 16:21:05
// Design Name: 
// Module Name: Adder
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


module Adder(
    input[31:0] A,
    input[31:0] B,
    output wire[31:0] Result
    // omits CF
    );

    wire[31:0] couts;
    FullAdder fulladder0(
            .a(A[0]),
            .b(B[0]),
            .ci(1'b0),
            .co(couts[0]),
            .s(Result[0])
        );
    for (genvar i = 1; i < 32; i = i + 1) begin
        FullAdder fulladder(
            .a(A[i]),
            .b(B[i]),
            .ci(couts[i - 1]),
            .co(couts[i]),
            .s(Result[i])
        );
    end

endmodule
