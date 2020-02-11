`timescale 1ns / 1ps
module cmp_tb;

    reg [31:0] a, b;
    wire gt;
    
    CMP DUT(.a(a), .b(b), .gt(gt));
    
    initial begin
        a = 1;
        b = 2;
        
        #2;
        
        a = 5;
        b = 1;
        
        #2;
        $finish;
    end
    
endmodule
