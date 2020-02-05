module MUX (
	input [31:0] a, b,
	input sel,

	output [31:0] z
);

	assign z = sel ? a : b;

endmodule