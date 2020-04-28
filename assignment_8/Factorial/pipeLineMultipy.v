`timescale 1ns / 1ps

module pipeLineMultipy(
        input wire [3:0] A,
        input wire [3:0] b,
        input wire clk,
        input wire reset,
        input wire en,
        output wire [7:0] c
    );

    wire [3:0] a_reg;
    wire [3:0] b_reg;
    //input registers
    D_Register #(4) A_reg(clk,reset,en, A, a_reg);
    D_Register #(4) B_reg(clk,reset,en, b, b_reg);
    
    wire c0 = 0;
    wire c4;
    
    wire [7:0] PP0;
    wire [7:0] PP1;
    wire [7:0] PP2;
    wire [7:0] PP3;
    
    wire [7:0] p1;
    wire p1_carry;
    wire [7:0] p2;
    wire p2_carry;
    
    wire [7:0] result;
    wire result_carry;
    
    //partial products
    assign PP0 = {4'b0000 ,{a_reg[3]&b_reg[0],a_reg[2]&b_reg[0],a_reg[1]&b_reg[0],a_reg[0]&b_reg[0]}} ;
    assign PP1 = {3'b000 ,{a_reg[3]&b_reg[1],a_reg[2]&b_reg[1],a_reg[1]&b_reg[1],a_reg[0]&b_reg[1]}, 1'b0} ;
    assign PP2 = {2'b00 ,{a_reg[3]&b_reg[2],a_reg[2]&b_reg[2],a_reg[1]&b_reg[2],a_reg[0]&b_reg[2]}, 2'b00} ;
    assign PP3 = {1'b0 ,{a_reg[3]&b_reg[3],a_reg[2]&b_reg[3],a_reg[1]&b_reg[3],a_reg[0]&b_reg[3]}, 3'b000} ;


    //p1
    CLA_Adder p1_0(c0,PP1[3],PP0[3],PP1[2],PP0[2],PP1[1],PP0[1],PP1[0],PP0[0],p1[3],p1[2],p1[1],p1[0],p1_carry);
    CLA_Adder p1_1(p1_carry,PP1[7],PP0[7],PP1[6],PP0[6],PP1[5],PP0[5],PP1[4],PP0[4],p1[7],p1[6],p1[5],p1[4],c4);
    
    //p2
    CLA_Adder p2_0(c0,PP3[3],PP2[3],PP3[2],PP2[2],PP3[1],PP2[1],PP3[0],PP2[0],p2[3],p2[2],p2[1],p2[0],p2_carry);
    CLA_Adder p2_1(p2_carry,PP3[7],PP2[7],PP3[6],PP2[6],PP3[5],PP2[5],PP3[4],PP2[4],p2[7],p2[6],p2[5],p2[4],c4);
    
    //stage registers
    D_Register #(8) stage1(clk,reset,en,p1,s1_reg);
    D_Register #(8) stage2(clk,reset,en,p2,s2_reg);
    wire [7:0] s1_reg;
    wire [7:0] s2_reg;
    
    //out
    CLA_Adder out_0(c0,s2_reg[3],s1_reg[3],s2_reg[2],s1_reg[2],s2_reg[1],s1_reg[1],s2_reg[0],s1_reg[0],result[3],result[2],result[1],result[0],result_carry);
    CLA_Adder out_1(result_carry,s2_reg[7],s1_reg[7],s2_reg[6],s1_reg[6],s2_reg[5],s1_reg[5],s2_reg[4],s1_reg[4],result[7],result[6],result[5],result[4],c4);
    
    //output register
    D_Register #(8) out_reg(clk,reset,en,result,c);
    
endmodule