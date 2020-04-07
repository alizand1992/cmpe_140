module left_shift_2(
    input [31:0] in,
    output [31:0] out
);

    assign out = {in[31:2], 2'b0};
    
endmodule
