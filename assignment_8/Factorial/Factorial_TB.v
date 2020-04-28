`timescale 1ns / 1ps

module Factorial_TB;
reg clk = 0, rst = 0, go = 0;
reg [3:0] n;
wire done, err;
wire [31:0] out;
Factorial Fact(clk, rst, go , n, done, err, out);
integer i;
initial begin
    rst <= 1;
    rst <= #1 0;
    go <= 1;
    for(i = 0; i < 16; i = i+1)begin 
        n = i;
        #1;
        if(!err)begin
            while(!done)#10;
        end
        else $display("err %d",i);
        #10;

    end
    $finish;
end

always #5 clk = ~clk;
endmodule
