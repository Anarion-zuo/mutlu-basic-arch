`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/24 19:47:35
// Design Name: 
// Module Name: Alu
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


module Alu(
    input[3:0] aluOp,
    input[31:0] A,
    input[31:0] B,
    output wire[31:0] Result
    );

    wire[31:0] addRes, subRes, sltRes, andRes, orRes, xorRes, norRes;

    // add
    AluAdder aluAdder(
        .A(A), .B(B), .Result(addRes)
    );

    // sub
    AluSubtractor aluSubtractor(
        .A(A), .B(B), .Result(subRes)
    );

    // slt
    wire[31:0] diff;
    AluSubtractor aluSubtractorSlt(.A(A), .B(B), .Result(diff));
    assign sltRes = diff[31] == 1'b1 ? 32'b1 : 32'b0;

    // and
    assign andRes = A & B;

    // or
    assign orRes = A | B;

    // xor
    assign xorRes = A ^ B;

    // nand
    assign norRes = ~(A | B);

    assign Result = aluOp[3] == 1 ? sltRes : (
        aluOp[2] == 1 ? (
            // logic
            aluOp[1] == 1 ? (
                aluOp[0] == 1 ? norRes : xorRes
            ) : (
                aluOp[0] == 1 ? orRes : andRes
            )
        ) : (
            // arith
            aluOp[1] == 1 ? subRes : addRes
        )
    );
endmodule
