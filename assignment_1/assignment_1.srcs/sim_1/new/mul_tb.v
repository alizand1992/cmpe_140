`timescale 1ns / 1ps
module mul_tb;

    reg [31:0] a, b;
    wire [31:0] z;
    
    MUL DUT(.a(a), .b(b), .z(z));
    
    initial begin
        a = 3;
        b = 5;
        #2;
        $finish;
    end
endmodule
