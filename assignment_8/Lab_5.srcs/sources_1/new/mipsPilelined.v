`timescale 1ns / 1ps

module mipsPilelined(
        input  wire        clk,
        input  wire        rst,
        input  wire [4:0]  ra3,
        input  wire [31:0] instr,
        input  wire [31:0] rd_dm,
        output wire        we_dm,//from mem stage of dp
        output wire [31:0] pc_current,
        output wire [31:0] alu_out,
        output wire [31:0] wd_dm,
        output wire [31:0] rd3
    );
    //cu
    wire       branch;
    wire       jump;
    wire [1:0] reg_dst;
    wire       we_reg;
    wire       alu_src;
    wire [1:0] dm2reg;
    wire [2:0] alu_ctrl;
    wire       jr_mux;
    wire       m_mux;
    wire       m_we;
    wire       m_ra;
    wire       we_dmD;
    
    //hu
    wire         forwardAD;
    wire         forwardBD;
    wire  [1:0]  forwardAE;
    wire  [1:0]  forwardBE;
    wire         stallD;
    wire         flushE;
    wire         stallF;
    wire [4:0]  rtE;
    wire [4:0]  rtD;
    wire [4:0]  rsD;
    wire [4:0]  rsE;
    wire        dm2regE_HU;
    wire        dm2regM_HU;
    wire        we_regM;
    wire        we_regE;
    wire        we_regW;
    wire [4:0]  rf_waM;
    wire [4:0]  rf_waE;
    wire [4:0]  rf_waW;

    controlunit cu (
            .opcode         (instr[31:26]),
            .funct          (instr[5:0]),
            .branch         (branch),
            .jump           (jump),
            .reg_dst        (reg_dst),
            .we_reg         (we_reg),
            .alu_src        (alu_src),
            .we_dm          (we_dmD),
            .dm2reg         (dm2reg),
            .alu_ctrl       (alu_ctrl),
            .jr_mux         (jr_mux),
            .m_mux          (m_mux),
            .m_we           (m_we),
            .m_ra           (m_ra)
        );
        
    pipelined_DP dp (
            .clk            (clk),
            .rst            (rst),
            .branchD        (branch),
            .jump           (jump),
            .reg_dstD       (reg_dst),
            .we_regD        (we_reg),
            .we_dmD         (we_dmD),
            .alu_srcD       (alu_src),
            .dm2regD        (dm2reg),
            .alu_ctrlD      (alu_ctrl),
            .ra3            (ra3),
            .instr          (instr),
            .rd_dm          (rd_dm),
            .pc_current     (pc_current),
            .alu_outM       (alu_out),
            .wd_dmM         (wd_dm),
            .we_dmM         (we_dm),
            .rd3            (rd3),
            .jr_mux         (jr_mux),
            .m_muxD         (m_mux),
            .m_weD          (m_we),
            .m_raD          (m_ra),
            
            .forwardAD      (forwardAD),
            .forwardBD      (forwardBD),
            .forwardAE      (forwardAE),
            .forwardBE      (forwardBE),
            .stallD         (stallD),
            .flushE         (flushE),
            .stallF         (stallF),
            .rtE            (rtE),
            .rtD            (rtD),
            .rsD            (rsD),
            .rsE            (rsE),
            .dm2regE_HU     (dm2regE_HU),
            .dm2regM_HU     (dm2regM_HU),
            .we_regE        (we_regE),
            .we_regM        (we_regM),
            .we_regW        (we_regW),
            .rf_waM         (rf_waM),
            .rf_waE         (rf_waE),
            .rf_waW         (rf_waW)
        );
        
    Hazard_CU hu(
        .forwardAD      (forwardAD),
        .forwardBD      (forwardBD),
        .forwardAE      (forwardAE),
        .forwardBE      (forwardBE),
        .stallD         (stallD),
        .flushE         (flushE),
        .stallF         (stallF),
        .rtE            (rtE),
        .rtD            (rtD),
        .rsD            (rsD),
        .rsE            (rsE),
        .dm2regE        (dm2regE_HU),
        .dm2regM        (dm2regM_HU),
        .we_regE        (we_regE),
        .we_regM        (we_regM),
        .we_regW        (we_regW),
        .rf_waM         (rf_waM),
        .rf_waE         (rf_waE),
        .branchD        (branch),
        .rf_waW         (rf_waW)
    );
endmodule
