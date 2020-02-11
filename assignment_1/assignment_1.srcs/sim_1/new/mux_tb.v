`timescale 1ns / 1ps
module mux_tb;

    reg [31:0] a, b;
    reg sel;
    
    wire [31:0] z;
    
    MUX DUT(.a(a), .b(b), .sel(sel), .z(z));
    
    initial begin 
        a = 3;
        b = 21;
        sel = 1'b0;
        #2;
        sel = 1'b1;
        #2;
        $finish;
    end

endmodule
