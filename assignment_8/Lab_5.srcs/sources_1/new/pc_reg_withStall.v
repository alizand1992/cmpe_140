`timescale 1ns / 1ps

module pc_reg_withStall # (parameter WIDTH = 32)(
    input  wire             clk,
    input  wire             stallF,
    input  wire [WIDTH-1:0] d,
    output reg  [WIDTH-1:0] q
    );
    
    initial begin
        q = 0;
    end
    
    always @ (posedge clk) begin
        if (~stallF) q <= d;
    end
endmodule
