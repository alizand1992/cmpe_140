module CMP (
	input [31:0] a, b,

	output gt
);

	assign gt = a > b ? 1'b1 : 1'b0;

endmodule