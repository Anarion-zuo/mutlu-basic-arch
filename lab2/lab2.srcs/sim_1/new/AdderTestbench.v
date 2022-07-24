`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/23 16:23:10
// Design Name: 
// Module Name: FullAdderTestbench
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


module FullAdderTestbench(
    output co,
    output s
    );

    // 1-bit full adder

    reg[3:0] oneBitInput;
    wire[1:0] oneBitOutput;
    
    FullAdder fullAdder(
        .a(oneBitInput[0]),
        .b(oneBitInput[1]),
        .ci(oneBitInput[2]),
        .co(oneBitOutput[1]),
        .s(oneBitOutput[0])
    );

    initial begin
        $display("1-bit adder test begins");
        for (oneBitInput = 0; oneBitInput < 4'b1000; oneBitInput = oneBitInput + 1) begin 
            if (oneBitOutput != oneBitInput[0] + oneBitInput[1] + oneBitInput[2]) begin
                $display("error at input a %b b %b ci %b", oneBitInput[0], oneBitInput[1], oneBitInput[2]);
            end
        end
        $display("1-bit adder test ends");
    end

    // 4-bit full adder
    reg[4:0] x, y;
    wire[4:0] adderOut;
    FourBitAdder fourBitAdder(
        .a(x[3:0]),
        .b(y[3:0]),
        .s(adderOut[4:0])
    );

    initial begin
        $display("4-bit adder test begins");
        for (x = 0; x < 5'b10000; x = x + 1) begin
            for (y = 0; y < 5'b10000; y = y + 1) begin
                #10;
                if (adderOut != x + y) begin
                    $display("error at x %d y %d adderOut %d real sum %d", x, y, adderOut, x + y);
                end
            end;
        end
        $display("4-bit adder test ends");
    end
    

endmodule
