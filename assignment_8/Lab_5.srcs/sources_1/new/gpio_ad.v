`timescale 1ns / 1ps

module gpio_ad(
        input wire [1:0] A,
        input wire      WE,
        output reg      WE1,
        output reg      WE2,
        output wire [1:0] RdSel
    );
    
    always @(*) begin
        case(A)
            2'd0:begin
                WE1 = 1'b0;
                WE2 = 1'b0;
            end
            2'd1:begin
                WE1 = 1'b0;
                WE2 = 1'b0;
            end
            2'd2:begin
                WE1 = WE;
                WE2 = 1'b0;
            end
            2'd3:begin
                WE1 = 1'b0;
                WE2 = WE;
            end
            default:begin
                WE1 = 1'bx;
                WE2 = 1'bx;
            end
        endcase
    end
    
    assign RdSel = A;
endmodule