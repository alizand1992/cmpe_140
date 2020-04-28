`timescale 1ns / 1ps

module Gate #(parameter width = 32)(
        input clk, en,
        input [width-1:0] i,
        output reg [width-1:0] o
    );
    always@(posedge clk)begin
    if(en) o <= i;
    else o <= 0;
    end
endmodule
