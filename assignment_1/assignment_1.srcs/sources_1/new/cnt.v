module CNT (
	input load_cnt, en, clk,
	input [3:0] d,

	output [3:0] q	
);
	reg [3:0] n;

	always @(posedge clk) begin
		if (load_cnt) n = d;
		if (en) n = n - 1;
	end

	assign q = n;
endmodule