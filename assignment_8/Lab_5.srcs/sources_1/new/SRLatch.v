`timescale 1ns / 1ps

module SRLatch(
    input s,r,clk,
    output reg q
    );
    
    reg qnot;
    
    initial begin
        q = 1'b0;
        qnot = 1'b1;
    end
    
    always@(posedge clk)begin
        q = !(r | qnot);
        qnot = !(s | q);
    end
endmodule