module prod_reg (
        input  wire        clk,
        input  wire        we,
        input  wire        ra,
        input  wire [63:0] wd, //check
        output wire [31:0] rd
    );

    reg [31:0] rf[1:0]; // 2 x31 Bit Array //double check
    integer n;
    
    initial begin
        for (n = 0; n < 2; n = n + 1) 
        rf[n] = 32'h0;
    end
    
    //double check
    always @ (posedge clk) begin
        if (we) begin
		  rf[0] <= wd[31:0];
		  rf[1] <= wd[63:32];
		end
    end

    assign rd = rf[ra];

endmodule