`timescale 1ns / 1ps

module Factorial_DP #(parameter width = 32)(
    input sel, ld_cnt, en, ld_reg, oe, clk, rst,
    input [3:0] n,
    output gt, done, err,
    output [width-1:0] out
    );
    assign done = oe;
    
    
    
    wire [width-1:0] z, mux_out, reg_Q;
    wire [3:0] cnt_out;
    mux2 #(width) inmux (sel,z[width-1:0],32'd1,mux_out);
    D_Register #(width) regiseter(clk,rst,ld_reg,mux_out,reg_Q);
    cnt count(clk,rst,ld_cnt,en,n,cnt_out,err);
    comparator cmp(cnt_out,4'd1,gt);
    Parallel_Multiplier #(width,width-4) mult (reg_Q,cnt_out,z);
    mux2 #(width) outmux (oe, 32'b0, reg_Q, out);
    
endmodule
