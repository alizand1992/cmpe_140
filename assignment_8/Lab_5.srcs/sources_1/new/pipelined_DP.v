`timescale 1ns / 1ps

module pipelined_DP(
//cu
        input  wire        clk,
        input  wire        rst,
        input  wire        branchD,
        input  wire        jump,
        input  wire [1:0]  reg_dstD,
        input  wire        we_regD,
        input  wire        we_dmD,
        input  wire        alu_srcD,
        input  wire [1:0]  dm2regD,
        input  wire        jr_mux,
        input  wire        m_muxD,
        input  wire        m_weD,
        input  wire        m_raD,
        input  wire [2:0]  alu_ctrlD,
        input  wire [4:0]  ra3,
        input  wire [31:0] instr,
        input  wire [31:0] rd_dm, //goes into reg_m 
        output wire [31:0] pc_current,
        output wire [31:0] alu_outM,
        output wire [31:0] wd_dmM,
        output wire [31:0] rd3,
        output wire [31:0] instrD,
        output wire        we_dmM,
        
//hazard CU
        input wire         forwardAD,
        input wire         forwardBD,
        input wire  [1:0]  forwardAE,
        input wire  [1:0]  forwardBE,
        input wire         stallD,
        input wire         flushE,
        input wire         stallF,
        output wire [4:0]  rtE,
        output wire [4:0]  rtD,
        output wire [4:0]  rsD,
        output wire [4:0]  rsE,
        output wire        dm2regE_HU,
        output wire        dm2regM_HU,
        output wire        we_regE,
        output wire        we_regM,
        output wire        we_regW,
        output wire [4:0]  rf_waM,
        output wire [4:0]  rf_waE,
        output wire [4:0]  rf_waW
    );
//Wires
    //IF
    wire [31:0] pc_plus4F;
    wire [31:0] pc_pre;
    wire [31:0] pc_jmp_jr;
    wire [31:0] pc_next;
    wire        pc_src;
    wire [31:0] jta;
    
    //ID
    wire [31:0] pc_plus4D;
    wire [4:0]  ra1;
    wire [4:0]  ra2;
    wire [5:0]  shamtD;
    wire [31:0] alu_paD; //rd1
    wire [31:0] wd_dmD; //rd2
    
    wire [31:0] rd_mux_out;
    wire [31:0] rd_mux_out2; 
    wire        rd_mux_cmp;
    
    wire [31:0] sext_immD;
    wire [31:0] baD;
    wire [31:0] btaD;
    
    wire [4:0]  rdD;
    
    //EXE
    wire [31:0] alu_paE;
    wire [31:0] alu_paE2;
    wire [31:0] alu_pb;
    wire [31:0] wd_dmE;
    wire [31:0] wd_dmE2;
    wire [4:0]  rdE;
    wire [31:0] sext_immE;
    wire [1:0]  reg_dstE;
    wire        alu_srcE;
    wire [1:0]  dm2regE;
    wire        we_dmE;
    wire [2:0]  alu_ctrlE;
    
    wire        m_muxE;
    wire        m_weE;
    wire        m_raE;
    
    wire [63:0] alu_out_full;
    
    wire [5:0]  shamt;
    wire        zero; //unused because of early branch determination
    
    //MEM
    wire [1:0]  dm2regM;
    wire        m_muxM;
    
    wire [31:0] prod_reg_rd;
    
    //WB
    wire [31:0] wd_rfW;
    wire        m_muxW;
    wire [31:0] prod_reg_rdW;
    wire [31:0] alu_outW;
    wire [1:0]  dm2regW;
    wire [31:0] rd_dmW;
    wire [31:0] math_prod;
    
//Modules
    //IF
    assign jta = {pc_plus4D[31:28], instrD[25:0], 2'b00};//assumed that pc_plus4 and instrD from id stage
    
    mux2 #(32) pc_src_mux(
        .sel            (pc_src),
        .a              (pc_plus4F),
        .b              (btaD),
        .y              (pc_pre)
    );
    
    mux2 #(32) pc_jmp_mux(
        .sel            (jump), 
        .a              (pc_pre),
        .b              (btaD),
        .y              (pc_jmp_jr)
    );
    
    mux2 #(32) jr_sel_mux (
        .sel            (jr_mux),
        .a              (pc_jmp_jr),
        .b              (alu_paD),
        .y              (pc_next)
        );
        
    pc_reg_withStall pc_reg (//edit this
        .clk            (clk),
        .stallF         (stallF),
        .d              (pc_next),
        .q              (pc_current)
    );
    
    adder pc_plus_4 (
            .a              (pc_current),
            .b              (32'd4),
            .y              (pc_plus4F)
        );
        
    reg_F reg_F(
        .clk            (clk),
        .stallD         (stallD),
        .instrF         (instr),
        .pc_plus4F      (pc_plus4F),
        .instrD         (instrD),
        .pc_plus4D      (pc_plus4D)
    );
    
    //ID
    regfile rf (
            .clk            (clk),
            .we             (we_regW),
            .ra1            (instrD[25:21]),
            .ra2            (instrD[20:16]),
            .ra3            (ra3), //old
            .wa             (rf_waW),
            .wd             (wd_rfW),
            .rd1            (alu_paD),
            .rd2            (wd_dmD),
            .rd3            (rd3) //old
        );
        
    mux2 #(32) rd_mux(
        .sel            (forwardAD),
        .a              (alu_paD),
        .b              (alu_outM),
        .y              (rd_mux_out)
    );
    
    mux2 #(32) rd_mux2(
        .sel            (forwardBD),
        .a              (wd_dmD),
        .b              (alu_outM),
        .y              (rd_mux_out2)
    );
    
    assign rd_mux_cmp = (rd_mux_out == rd_mux_out2);
    assign pc_src = branchD & rd_mux_cmp;
    
    signext se (
            .a              (instrD[15:0]),
            .y              (sext_immD)
        );
    
    assign baD = {sext_immD[29:0], 2'b00};
    
    adder pc_plus_br (
            .a              (pc_plus4D),
            .b              (baD),
            .y              (btaD)
        );
        
    assign rsD = instrD[25:21];
    assign rtD = instrD[20:16];
    assign rdD = instrD[15:11];
    assign shamtD = instrD[10:6];
        
    reg_D reg_D(
        .clk            (clk),
        .flushE         (flushE),
        .we_dmD         (we_dmD),
        .we_regD        (we_regD),
        .m_muxD         (m_muxD),
        .m_weD          (m_weD),
        .m_raD          (m_raD),
        .alu_srcD       (alu_srcD),
        .dm2regD        (dm2regD),
        .reg_dstD       (reg_dstD),
        .alu_ctrlD      (alu_ctrlD),
        .rtD            (rtD),
        .rsD            (rsD),
        .rdD            (rdD),
        .alu_paD        (alu_paD),
        .wd_dmD         (wd_dmD),
        .sext_immD      (sext_immD),
        .shamtD         (shamtD),
        
        .shamtE         (shamt),        
        .we_dmE         (we_dmE),
        .alu_srcE       (alu_srcE),
        .m_muxE         (m_muxE),
        .m_weE          (m_weE),
        .m_raE          (m_raE),
        .dm2regE        (dm2regE),
        .reg_dstE       (reg_dstE),
        .alu_ctrlE      (alu_ctrlE),
        .rdE            (rdE),
        .rsE            (rsE),
        .rtE            (rtE),
        .sext_immE      (sext_immE),
        .we_regE        (we_regE),
        .wd_dmE         (wd_dmE),
        .alu_paE        (alu_paE)
    );
    
    //EXE
    mux4 #(5) rf_wa_mux (
            .sel            (reg_dstE),
            .a              (rtE),
            .b              (rdE),
            .c              (5'b11111),
            .d              (5'b00000),
            .y              (rf_waE)
        );
    mux4 #(32) forwardAE_mux (
            .sel            (forwardAE),
            .a              (alu_paE),
            .b              (wd_rfW),
            .c              (alu_outM),
            .d              (32'b0),
            .y              (alu_paE2)
        );
    mux4 #(32) forwardBE_mux (
            .sel            (forwardBE),
            .a              (wd_dmE),
            .b              (wd_rfW),
            .c              (alu_outM),
            .d              (32'b0),
            .y              (wd_dmE2)
        );
    mux2 #(32) alu_pb_mux (
            .sel            (alu_srcE),
            .a              (wd_dmE2),
            .b              (sext_immE),
            .y              (alu_pb)
        );
    alu alu (
            .op             (alu_ctrlE),
            .a              (alu_paE2),
            .b              (alu_pb),
            .zero           (zero), //unused
            .shamt          (shamt), 
            .y              (alu_out_full)
        );
    reg_E reg_E(
        .clk            (clk),
        .we_dmE         (we_dmE),
        .we_regE        (we_regE),
        .m_muxE         (m_muxE),
        .m_weE          (m_weE),
        .m_raE          (m_raE),
        .rf_waE         (rf_waE),
        .dm2regE        (dm2regE),
        .wd_dmE2        (wd_dmE2),
        .alu_outE       (alu_out_full),
        .we_dmM         (we_dmM),
        .m_muxM         (m_muxM),
        .we_regM        (we_regM),
        .rf_waM         (rf_waM),
        .wd_dmM         (wd_dmM),
        .alu_outM       (alu_outM),
        .prod_reg_rd    (prod_reg_rd),
        .dm2regM        (dm2regM)
    );
    assign dm2regE_HU = dm2regE[0];
    
    //MEM
    reg_M reg_M(
        .clk            (clk),
        .rd_dm          (rd_dm),
        .dm2regM        (dm2regM),
        .m_muxM         (m_muxM),
        .m_muxW         (m_muxW),
        .rf_waM         (rf_waM),
        .we_regM        (we_regM),
        .alu_outM       (alu_outM),
        .prod_reg_rd    (prod_reg_rd),
        .we_regW        (we_regW),
        .dm2regW        (dm2regW),
        .rf_waW         (rf_waW),
        .alu_outW       (alu_outW),
        .prod_reg_rdW   (prod_reg_rdW),
        .rd_dmW         (rd_dmW)
    );
    
    assign dm2regM_HU = dm2regM[0];
    
    //WB
    mux2 #(32) prod_reg_mux (
            .sel            (m_muxW),
            .a              (alu_outW),
            .b              (prod_reg_rdW),
            .y              (math_prod)
        );
        
    mux4 #(32) rf_wd_mux (
            .sel            (dm2regW),
            .a              (math_prod),
            .b              (rd_dmW),
            .c              (pc_plus4F),
            .d              (32'b0),
            .y              (wd_rfW)
        );
    
endmodule
