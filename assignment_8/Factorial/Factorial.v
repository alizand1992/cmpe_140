`timescale 1ns / 1ps

module Factorial #(parameter width = 32)(
input clk, rst, go,
input [3:0] n,
output done, err,
output [width-1:0] out
    );
    
wire sel, ld_cnt, en, ld_reg, oe, gt;

Factorial_CU CU (clk, rst, go, gt, err, sel, ld_cnt, en, ld_reg, oe);
Factorial_DP #(32) DP (sel, ld_cnt, en, ld_reg, oe, clk, rst, n, gt, done, err, out);
endmodule
