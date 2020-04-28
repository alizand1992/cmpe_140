`timescale 1ns / 1ps

module D_Register #(parameter WIDTH = 8)(
    input clk, reset,
    input ld,
    input [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q
    );
    always @ (posedge clk, posedge reset)
        if (reset) q <= 0;
        else if (ld) q <= d;
        else q <= q;
    
endmodule
