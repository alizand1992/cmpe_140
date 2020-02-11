`timescale 1ns / 1ps

module dp_tb;

    reg load_cnt, en_cnt, clk;
    reg [3:0] d;
    wire [3:0] cnt_out;
    
    DP DUT (.load_cnt(load_cnt), .en_cnt(en_cnt), .clk(clk), .n(d), .cnt_out(cnt_out));
    
    initial begin
        clk = 0;
        en_cnt = 0;
        load_cnt = 0;
        d = 4;
        
        #2;
        load_cnt = 1'b1;
        #2;
            
    end
    
    always clk = #1 !clk;
endmodule
