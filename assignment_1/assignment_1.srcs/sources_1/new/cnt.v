module CNT (
	input load_cnt, en, clk,
	input [3:0] d,

	output q	
);

	reg [3:0] n;

	always @ (posedge clk) begin
		if (load_cnt) n = d;

		if (en) begin
			n = n - 1;
		end
	end

	assign q = n;

endmodule