`timescale 1ns / 1ps

module Factorial_CU(
input clk , rst, go, gt, err,
output sel, ld_cnt, en, ld_reg, oe);
    
reg [2:0] cs, ns;
parameter s0 = 3'd0, s1 = 3'd1, s2 = 3'd2;

reg [4:0] Control;
assign {sel,ld_cnt,en,ld_reg,oe} = Control;

//clk
always@(posedge clk, posedge rst)begin
    if(rst) cs <= s0;
    else cs <= ns;
end

//ns logit
always@(cs,gt,err,go)
    case(cs)
        s0:begin
            if(!err&&go) ns = s1;
            else ns = cs;
        end
        s1:begin
            ns = s2;
        end
        s2:begin
            if(gt) ns = s2;
            else ns = s0;
        end
    endcase
//out logic
always@(cs,gt,err,go)
    case(cs)
        s0: Control = 5'b00000;
        s1: Control = 5'b11110;
        s2:begin
            if(gt) Control = 5'b00110;
            else Control = 5'b00001;
        end
    endcase
endmodule
