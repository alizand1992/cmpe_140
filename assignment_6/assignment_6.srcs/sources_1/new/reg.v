module reg_32(
    input we, clk,
    input [31:0] D,
    output [31:0] Q
);
    reg [31:0] value;
    
    always @ (posedge clk) begin
        if(we) value = D;
    end

    assign Q = value;
endmodule
