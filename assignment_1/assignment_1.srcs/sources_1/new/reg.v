module REG (
	input [31:0] d,
	input load_reg, clk,

	output [31:0] q
);

	reg [31:0] mem;

	always @ (clk) begin
		if (load_reg) mem = d;
	end

	assign q = mem;

endmodule