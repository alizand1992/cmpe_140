module CU_DP (
	input [3:0] n,
	input clk, go,

	output done, error, 
	output [31:0] factorial
);

	wire lt1, gt12, load_cnt, en_cnt, load_reg, oe, sel;

	CU cu (
		.go(go), .clk(clk), .lt1(lt1), .gt12(gt12), .load_cnt(load_cnt), 
		.en_cnt(en_cnt), .load_reg(load_reg), .oe(oe), .sel(sel), 
		.done(done), .error(error)
	);

	DP dp (
		.n(n), .clk(clk), .load_cnt(load_cnt), .load_reg(load_reg),
		.sel(sel), .oe(oe), .lt1(lt1), .gt12(gt12), .out(factorial)
	);

endmodule