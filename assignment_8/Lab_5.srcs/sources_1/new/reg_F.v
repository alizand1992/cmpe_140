`timescale 1ns / 1ps

module reg_F(
     input  wire        clk,
     input  wire        stallD,
     input  wire [31:0] instrF,
     input  wire [31:0] pc_plus4F,
     output reg [31:0] instrD,
     output reg [31:0] pc_plus4D
    );
    
    initial begin
       instrD = 32'b0;
       pc_plus4D = 32'b0;
    end
    
    always @ (posedge clk) begin
        if (!stallD) begin
		  instrD <= instrF;
		  pc_plus4D <= pc_plus4F;
		end
    end
    
endmodule
