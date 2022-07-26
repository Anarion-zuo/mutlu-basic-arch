`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/26 18:19:22
// Design Name: 
// Module Name: TestAlu
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


module TestAlu(

    );

    wire[31:0] aluOut;
    reg[32:0] x, y, res;
    reg[3:0] aluOp = 4'b0000;
    Alu aluAdd(
        .aluOp(aluOp),
        .A(x[31:0]),
        .B(y[31:0]),
        .Result(aluOut)
    );
    always @(aluOut) begin
        res[31:0] = aluOut;
    end
    
    initial begin
        $display("alu test begins");
        for (x = 0; x <= 'b1111111111; x = x + 1) begin
            for (y = 0; y <= 'b1111111111; y = y + 1) begin 
                aluOp = 4'b0000;
                if (x + y != res) begin
                    $display("alu wrong add %d at x %d y %d correct %d", res, x, y, x + y);
                end
                aluOp = 4'b0010;
                if (x - y != res) begin
                    $display("alu wrong sub %d at x %d y %d correct %d", res, x, y, x - y);
                end

            end
        end
        $display("alu test ends");
    end
endmodule
