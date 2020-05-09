`timescale 1ns / 1ps

module Factorial_with_wrapper_TB;

reg clk, rst, we;
reg [1:0] a;
reg [3:0] wd;
wire [31:0] rd;
FactorialAccelerator DUT(clk, rst, we, a, wd, rd);

 task tick; 
    begin 
        clk = 1'b0; #5;
        clk = 1'b1; #5;
    end
    endtask
    task reset;
    begin 
        rst = 1'b0; #5;
        rst = 1'b1; #5;
        rst = 1'b0;
    end
    endtask
    
initial begin
        clk = 1'b0;
        rst = 1'b0;
        reset;
        //6
        wd = 4'b0110;
        //sw  $t3,0x0800($0)
        a = 2'b00;
        we = 1'b1;
        tick;
        //sw  $t1,0x0804($0)
        wd = 4'b0001;
        a = 2'b01;
        tick;
        a = 2'b10;
        we = 1'b0;
        tick;
        tick;
        while(rd[0] != 1'b1 && rd[1] != 1'b1) tick;//lw     $t5, 0x0808($0)
        a = 2'b11;
        tick;
        //13
        wd = 4'b1101;
        //sw  $t3,0x0800($0)
        a = 2'b00;
        we = 1'b1;
        tick;
        //sw  $t1,0x0804($0)
        wd = 4'b0001;
        a = 2'b01;
        tick;
        a = 2'b10;
        we = 1'b0;
        tick;
        tick;
        while(rd[0] != 1'b1 && rd[1] != 1'b1) tick;//lw     $t5, 0x0808($0)
        a = 2'b11;
        tick;
        //12
        wd = 4'b1100;
        //sw  $t3,0x0800($0)
        a = 2'b00;
        we = 1'b1;
        tick;
        //sw  $t1,0x0804($0)
        wd = 4'b0001;
        a = 2'b01;
        tick;
        a = 2'b10;
        we = 1'b0;
        tick;
        tick;
        while(rd[0] != 1'b1 && rd[1] != 1'b1) tick;//lw     $t5, 0x0808($0)
        a = 2'b11;
        tick;
        $finish;
    end    

endmodule
