`timescale 1ns / 1ps

module reg_M(
    input  wire        clk,
    input  wire [31:0] rd_dm,
    input  wire [1:0]  dm2regM,
    input  wire [4:0]  rf_waM,
    input  wire        we_regM,
    input  wire        m_muxM,//
    input  wire [31:0] alu_outM,
    input  wire [31:0] prod_reg_rd,
    
    output reg         we_regW,
    output reg         m_muxW,
    output reg  [1:0]  dm2regW,
    output reg  [4:0]  rf_waW,
    output reg  [31:0] alu_outW,
    output reg  [31:0] prod_reg_rdW,
    output reg  [31:0] rd_dmW
    );
    
    initial begin
        we_regW = 0;
        dm2regW = 0;
        rf_waW = 0;
        rd_dmW = 0;
        alu_outW = 0;
        prod_reg_rdW = 0;
        m_muxW = 0;
    end
    
    always @ (posedge clk) begin
        we_regW <= we_regM;
        dm2regW <= dm2regM;
        rf_waW <= rf_waM;
        alu_outW <= alu_outM;
        prod_reg_rdW <= prod_reg_rd;
        rd_dmW <= rd_dm;
        m_muxW <= m_muxM;
    end
    
endmodule
