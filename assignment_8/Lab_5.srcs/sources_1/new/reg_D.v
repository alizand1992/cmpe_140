`timescale 1ns / 1ps

module reg_D(
     input  wire        clk,
     input  wire        flushE,
     input  wire        we_dmD,
     input  wire        we_regD,
     input  wire        m_muxD,
     input  wire        m_weD,
     input  wire        m_raD,
     input  wire        alu_srcD,
     input  wire [1:0]  dm2regD,
     input  wire [1:0]  reg_dstD,
     input  wire [2:0]  alu_ctrlD,
     input  wire [4:0]  rtD,
     input  wire [4:0]  rsD,
     input  wire [4:0]  rdD,
     input  wire [4:0]  shamtD,
     input  wire [31:0] alu_paD,
     input  wire [31:0] wd_dmD,
     input  wire [31:0] sext_immD,
     
     output reg         we_dmE,
     output reg         we_regE,
     output reg         alu_srcE,
     output reg         m_muxE,
     output reg         m_weE,
     output reg         m_raE,
     output reg [1:0]   dm2regE,
     output reg [1:0]   reg_dstE,
     output reg [2:0]   alu_ctrlE,
     output reg [4:0]   rdE,
     output reg [4:0]   rsE,
     output reg [4:0]   rtE,
     output reg [4:0]   shamtE,
     output reg [31:0]  sext_immE,
     output reg [31:0]  wd_dmE,
     output reg [31:0]  alu_paE
    );
    
    initial begin
          we_dmE = 0;
		  alu_srcE = 0;
		  m_muxE = 0;
		  m_weE = 0;
		  m_raE = 0;
		  dm2regE = 0;
		  reg_dstE = 0;
		  alu_ctrlE = 0;
		  rdE = 0;
		  rsE = 0;
		  rtE = 0;
		  sext_immE = 0;
		  wd_dmE = 0;
		  alu_paE = 0;
		  shamtE = 0;
		  we_regE = 0;
    end
    
    always @ (posedge clk) begin
        if (~flushE) begin
		  we_dmE <= we_dmD;
		  alu_srcE <= alu_srcD;
		  m_muxE <= m_muxD;
		  m_weE <= m_weD;
		  m_raE <= m_raD;
		  dm2regE <= dm2regD;
		  reg_dstE <= reg_dstD;
		  alu_ctrlE <= alu_ctrlD;
		  rdE <= rdD;
		  rsE <= rsD;
		  rtE <= rtD;
		  sext_immE <= sext_immD;
		  wd_dmE <= wd_dmD;
		  alu_paE <= alu_paD;
		  shamtE <= shamtD;
		  we_regE <= we_regD;
		end
		else begin
		  we_dmE <= 0;
		  alu_srcE <= 0;
		  m_muxE <= 0;
		  m_weE <= 0;
		  m_raE <= 0;
		  dm2regE <= 0;
		  reg_dstE <= 0;
		  alu_ctrlE <= 0;
		  rdE <= 0;
		  rsE <= 0;
		  rtE <= 0;
		  sext_immE <= 0;
		  wd_dmE <= 0;
		  alu_paE <= 0;
		  shamtE <= 0;
		  we_regE <= 0;
		end
    end
endmodule
