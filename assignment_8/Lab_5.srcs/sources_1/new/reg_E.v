`timescale 1ns / 1ps

module reg_E(
     input  wire        clk,
     input  wire        we_dmE,
     input  wire        we_regE,
     input  wire        m_muxE,
     input  wire        m_weE,
     input  wire        m_raE,
     input  wire [4:0]  rf_waE,
     input  wire [1:0]  dm2regE,
     input  wire [31:0] wd_dmE2,
     input  wire [63:0] alu_outE,
     
     output reg         we_dmM,
     output reg         m_muxM,
     output reg         we_regM,
     output reg [4:0]   rf_waM,
     output reg [31:0]  wd_dmM,
     output reg [31:0]  alu_outM,
     output wire [31:0] prod_reg_rd,
     output reg [1:0]   dm2regM
    );
    
    reg [31:0] rf[1:0]; // 2 x31 Bit Array
    integer n;
    
    initial begin
        we_dmM = 0;
        m_muxM = 0;
        rf_waM = 0;
        wd_dmM = 0;
        dm2regM = 0;
        we_regM = 0;
        alu_outM = 0;
        for (n = 0; n < 2; n = n + 1) 
        rf[n] = 32'h0;
    end
    
    always @ (posedge clk) begin
        we_dmM <= we_dmE;
        m_muxM <= m_muxE;
        rf_waM <= rf_waE;
        wd_dmM <= wd_dmE2;
        we_regM <= we_regE;
        dm2regM <= dm2regE;
        alu_outM <= alu_outE[31:0];
        if (m_weE) begin
		  rf[0] <= alu_outE[31:0];
		  rf[1] <= alu_outE[63:32];
		end
    end
    
    assign prod_reg_rd = rf[m_raE];
    
endmodule
