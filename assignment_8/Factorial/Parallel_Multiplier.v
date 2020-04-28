`timescale 1ns / 1ps

module Parallel_Multiplier #(parameter width = 32, aWidth = 28)(
        input wire [aWidth-1:0] A,
        input wire [width-aWidth-1:0] b,
        //sould this be an 8 bit out?
        output wire [width-1:0] c
    );
    //these are not used. they are just needed for the cla blocks they are not used
    wire c0 = 0;
    wire c4;
    
    wire [width-1:0] PP0;
    wire [width-1:0] PP1;
    wire [width-1:0] PP2;
    wire [width-1:0] PP3;
    
    wire [width-1:0] p1;
    wire [6:0] p1_carry;
    wire [width-1:0] p2;
    wire [6:0] p2_carry;
    
    wire [width-1:0] result;
    wire [6:0] result_carry;
    
    //partial products
    assign PP0 = {4'b0000 , {A&{aWidth{b[0]}}} };
    assign PP1 = {3'b000 ,{A&{aWidth{b[1]}}}, 1'b0} ;
    assign PP2 = {2'b00 ,{A&{aWidth{b[2]}}}, 2'b00} ;
    assign PP3 = {1'b0 ,{A&{aWidth{b[3]}}}, 3'b000} ;
    
    //p1
    CLA_Adder p1_0(c0,PP1[3:0],PP0[3:0],p1[3:0],p1_carry[0]);
    CLA_Adder p1_1(p1_carry[0],PP1[7:4],PP0[7:4],p1[7:4],p1_carry[1]);
    CLA_Adder p1_2(p1_carry[1],PP1[11:8],PP0[11:8],p1[11:8],p1_carry[2]);
    CLA_Adder p1_3(p1_carry[2],PP1[15:12],PP0[15:12],p1[15:12],p1_carry[3]);
    CLA_Adder p1_4(p1_carry[3],PP1[19:16],PP0[19:16],p1[19:16],p1_carry[4]);
    CLA_Adder p1_5(p1_carry[4],PP1[23:20],PP0[23:20],p1[23:20],p1_carry[5]);
    CLA_Adder p1_6(p1_carry[5],PP1[27:24],PP0[27:24],p1[27:24],p1_carry[6]);
    CLA_Adder p1_7(p1_carry[6],PP1[31:28],PP0[31:28],p1[31:28],c4);
    
    //p2
    CLA_Adder p2_0(c0,PP3[3:0],PP2[3:0],p2[3:0],p2_carry[0]);
    CLA_Adder p2_1(p2_carry[0],PP3[7:4],PP2[7:4],p2[7:4],p2_carry[1]);
    CLA_Adder p2_2(p2_carry[1],PP3[11:8],PP2[11:8],p2[11:8],p2_carry[2]);
    CLA_Adder p2_3(p2_carry[2],PP3[15:12],PP2[15:12],p2[15:12],p2_carry[3]);
    CLA_Adder p2_4(p2_carry[3],PP3[19:16],PP2[19:16],p2[19:16],p2_carry[4]);
    CLA_Adder p2_5(p2_carry[4],PP3[23:20],PP2[23:20],p2[23:20],p2_carry[5]);
    CLA_Adder p2_6(p2_carry[5],PP3[27:24],PP2[27:24],p2[27:24],p2_carry[6]);
    CLA_Adder p2_7(p2_carry[6],PP3[31:28],PP2[31:28],p2[31:28],c4);
    
    //out
    CLA_Adder out_0(c0,p2[3:0],p1[3:0],c[3:0],result_carry[0]);
    CLA_Adder out_1(result_carry[0],p2[7:4],p1[7:4],c[7:4],result_carry[1]);
    CLA_Adder out_2(result_carry[1],p2[11:8],p1[11:8],c[11:8],result_carry[2]);
    CLA_Adder out_3(result_carry[2],p2[15:12],p1[15:12],c[15:12],result_carry[3]);
    CLA_Adder out_4(result_carry[3],p2[19:16],p1[19:16],c[19:16],result_carry[4]);
    CLA_Adder out_5(result_carry[4],p2[23:20],p1[23:20],c[23:20],result_carry[5]);
    CLA_Adder out_6(result_carry[5],p2[27:24],p1[27:24],c[27:24],result_carry[6]);
    CLA_Adder out_7(result_carry[6],p2[31:28],p1[31:28],c[31:28],c4);
    
endmodule
