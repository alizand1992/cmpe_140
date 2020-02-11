`timescale 1ns / 1ps
module reg_tb;

    reg [31:0] d;
    reg load_reg, clk;
    
    wire[31:0] q;
    
    REG DUT(.d(d), .load_reg(load_reg), .clk(clk), .q(q));
    
    initial begin
        clk = 0;
        d = 128;
        load_reg = 1;
        #2;
        load_reg = 0;
        #2;
        $finish;
    end
    
    always clk = #1 !clk;
    
endmodule
