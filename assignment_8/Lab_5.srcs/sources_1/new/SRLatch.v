`timescale 1ns / 1ps

module SRLatch(
    input s,r,clk,
    output reg q
    );
    
    reg qnot;
    always@(posedge clk)begin
        q = ~(r | qnot);
        qnot = ~(s | q);
    end
endmodule