module alu (
    output zero,
    input [1:0] shift_op,
    input [4:0] shift,
    input [2:0]  op,
    input [31:0] a, [31:0] b,
    output reg  [31:0] y,
    output reg  [63:0] mult_out
);

    assign zero = (y == 0);
    always @ (shift_op, op, a, b) begin
        casex (shift_op)
            2'b0x: case (op)
                3'b000: y = a & b;
                3'b001: y = a | b;
                3'b010: y = a + b;
                3'b110: y = a - b;
                3'b011: mult_out = a * b;
                3'b111: y = (a < b) ? 1 : 0;
            endcase
            
            2'b10: y = a << shift;
            2'b11: y = a >> shift;
        endcase  
    end

endmodule