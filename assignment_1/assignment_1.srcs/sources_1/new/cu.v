module CU (
	input go, clk, lt1, gt12,

	output load_cnt, en_cnt, load_reg, oe, sel, done, error
);

	reg [1:0] cs, ns;
	reg [3:0] controls;

	assign { load_cnt, en_cnt, load_reg, sel, oe, error, done } = controls;

	always @ (posedge clk) begin
		case (cs)
			2'b00: begin
				if (go) begin
					if (gt12) begin
						controls = 7'b1_0_0_0_0_1_0;
						ns = 2'b00;
					end
					else begin
						controls = 7'b1_0_0_0_0_0_0;
						ns = 2'b01;
					end
				end
				else begin
					controls = 7'b1_0_0_0_0_0_0;
					ns = 2'b00;
				end
			end

			2'b01: begin
				if (lt1) begin
					controls = 7'b0_0_1_0_0_0_1;
				end	
				else begin
					controls = 7'b1_0_1_0_1_0_0;
				end
				ns = 2;
			end

			2'b10: begin
				if (lt1) begin
					controls = 7'b0_1_1_1_0_0_1;					
				end
				else begin
					controls = 7'b0_1_1_1_0_0_0;			
				end
			end

			default: begin
				cs = 0;
				ns = 0;
			end		
		endcase
	end
endmodule
