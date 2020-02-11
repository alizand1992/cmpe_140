`timescale 1ns / 1ps

module tb;
    reg[31:0] exp;
    reg[3:0] n;
    reg go, clk;
    
    wire error, done;
    wire[31:0] out;
    
    CU_DP DUT(.n(n), .clk(clk), .go(go), .done(done), .error(error), .factorial(out));
    
    initial begin
        clk = 0;
        
        go = 1;
        n = 0;
        #6;
        go = 0;
        #10;
          
        go = 1;
        n = 1;
        #6;
        go = 0;
        #10;


        go = 1;
        n = 3;
        #6;
        go = 0;
        #10;
        
        go = 1;
        n = 13;
        #6;
        go = 0;
        #10;

        $finish;
    end
    
    always #1 clk = !clk;
endmodule
