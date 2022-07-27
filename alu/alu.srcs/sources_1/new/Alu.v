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

    wire[31:0] addSubRes, sltRes, andRes, orRes, xorRes, norRes;

    // add & sub & slt
    wire[31:0] BInput;
    Adder commonAdder(
        .A(A), .B(BInput), .Result(addSubRes)
    );
    wire[31:0] negatedB;
    AluNegator negator(
        .B(B), .Result(negatedB)
    );
    // sub & slt use the subtractor
    assign BInput = (aluOp[1] == 1 | aluOp[3] == 1) ? negatedB : B;
    // slt processes a bit more than sub
    assign sltRes = addSubRes[31] == 1'b1 ? 32'b1 : 32'b0;

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
            addSubRes
        )
    );
endmodule
