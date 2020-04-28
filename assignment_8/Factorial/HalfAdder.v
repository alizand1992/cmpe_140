`timescale 1ns / 0.1ps

module HalfAdder( input wire a, 
                  input wire b,
                  output wire sum,
                  output wire c_out 
    );
    assign sum=a ^ b; //using XOR
    assign c_out = a & b; //Standard and
endmodule
