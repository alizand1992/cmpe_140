`timescale 1ns / 1ps
module cnt_tb;
    integer errors;

    reg load_cnt, en, clk;
    reg [3:0] d;
    
    wire [3:0] q;
    
    CNT DUT(.load_cnt(load_cnt), .en(en), .clk(clk), .d(d), .q(q));
    
    initial begin
        errors = 0;
        clk = 0;
        d = 4'b1100;
        load_cnt = 1'b1;
        en = 1'b0;
        
        #4;
        en = 1'b1;
        load_cnt = 1'b0;
        
        if (q != d) begin
            errors = errors + 1;
            $display("Error: expected q = d but got q = %d and d = %d", q, d);
        end
        
        #10;
        
        if (errors == 0)
            $display("SUCCESS!");
            
        $finish;    
    end
    
    always
        clk = #1 !clk;

endmodule
