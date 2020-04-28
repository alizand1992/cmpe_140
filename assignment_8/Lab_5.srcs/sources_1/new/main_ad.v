`timescale 1ns / 1ps

module main_ad(
        input wire [9:0] A,
        input wire      WE,
        output reg      WE1, WE2, WEM,
        output reg [1:0] RdSel
    );
    
    always @(WE) begin
        casex(A)
            10'b0000_xxxx_xx:begin
                WE1 = 1'b0;
                WE2 = 1'b0;
                WEM = WE;
                RdSel = 2'd0;
            end
            10'b1000_xxxx_xx:begin
                WE1 = 1'b01;
                WE2 = 1'b0;
                WEM = 1'b0;
                RdSel = 2'd2;
            end
            10'b1001_xxxx_xx:begin
                WE1 = 1'b0;
                WE2 = 1'b01;
                WEM = 1'b0;
                RdSel = 2'd3;
            end
            default:begin
                WE1 = 1'bx;
                WE2 = 1'bx;
                WEM = 1'bx;
                RdSel = 2'bxx;
            end
        endcase
    end
endmodule
