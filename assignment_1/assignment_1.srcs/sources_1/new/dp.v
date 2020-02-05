module DP (
	input [3:0] n,
	input clk, load_cnt, en_cnt, load_reg, sel, oe,

	output gt12, lt1,
	output [31:0] out
);
	
	wire [3:0] cnt_out;
	wire lt1, gt12;
	wire [31:0] mul_out, reg_out, mux_out;

	CNT cnt (.load_cnt(load_cnt), .en(en_cnt), .clk(clk), .d(n), .q(cnt_out));

	CMP cmp_lt1 (.a(cnt_out), .b(1), .gt(lt1));

	MUL mul (.a(cnt_out), .b(reg_out), .z(mul_out));

	MUX mux (.a(mul_out), .b(1), .sel(sel), .z(mux_out));

	REG reg_1 (.d(mux_out), .load_reg(load_reg), .clk(clk), .q(reg_out));

	MUX output_mux (.a(0), .b(reg_out), .sel(oe), .z(out));

	CMP cmp_gt12 (.a(n), .b(12), .gt(gt12));

endmodule