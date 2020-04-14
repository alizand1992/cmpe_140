module datapath (
    input clk, rst, branch, jump, reg_dst_1, reg_dst_2, reg_dst_3, we_reg, alu_src, 
    input dm2reg, mult_w_en, mult_sel, mfhi_mflo, jal_sel, jr,
    input [2:0]  alu_ctrl,
    input [4:0]  ra3,
    input [31:0] instr, rd_dm, pc_current, alu_out, wd_dm, rd3
);

    wire        pc_src, zero;
    wire [4:0]  dst_1_2, dst_2_3, r31, rf_wa;
    wire [31:0] pc_plus4, pc_pre, pc_next, sext_imm, 
                ba, bta, jta, alu_pa, alu_pb, mult_hi, 
                mult_lo, mult_res, mem_jal, jal_res, 
                wd_rf, pc_jmp_addr, pc_jmp_jr;
    wire [63:0] mult_out;
    
    assign pc_src = branch & zero;
    assign ba = {sext_imm[29:0], 2'b00};
    assign jta = {pc_plus4[29:0], 2'b00};
    assign pc_jmp_addr = {pc_plus4[29:0], 2'b00};
        
    // --- PC Logic --- //
    adder pc_plus_br (
        .a(pc_plus4), .b(ba),
        .y(bta)
    );

    mux2 #(32) pc_src_mux (
        .sel(pc_src), .a(pc_plus4), .b(bta), 
        .y(pc_pre)
    );

    mux2 #(32) pc_jmp_mux (
        .sel(jump), .a(pc_pre), .b(jta),
        .y(pc_jmp_jr)
    );
    
    mux2 #(32) jr_mux (
        .sel(jr), .a(pc_jmp_jr), .b(alu_pa),
        .y(pc_next)
    );

    dreg pc_reg (
        .clk(clk), .rst(rst), .d(pc_next),
        .q(pc_current)
    );

    adder pc_plus_4 (
        .a(pc_current), .b(32'd4),
        .y(pc_plus4)
    );
        
    // --- RF Logic --- //
    mux2 #(5) reg_dst1 (
        .sel(reg_dst_1), .a(instr[20:16]), .b(instr[15:11]),
        .y(dst_1_2)
    );
        
    mux2 #(5) reg_dst2 (
        .sel(reg_dst_2), .a(dst_1_2), .b(r31),
        .y(rf_wa)
    );

    regfile rf (
        .clk(clk), .we(we_reg), .ra1(instr[25:21]), .ra2(instr[20:16]), 
        .ra3(ra3), .wa(rf_wa), .wd(wd_rf),
        .rd1(alu_pa), .rd2(wd_dm), .rd3(rd3), .r31(r31)
    );

    signext se (
        .a(instr[15:0]),
        .y(sext_imm)
    );

    // --- ALU Logic --- //
    mux2 #(32) alu_pb_mux (
        .sel(alu_src), .a(wd_dm), .b(sext_imm),
        .y(alu_pb)
    );

    alu alu (
        .op(alu_ctrl), .a(alu_pa), .b(alu_pb),
        .zero(zero), .y(alu_out), .mult_out(mult_out)
    );

    reg_32 hi_reg (
        .we(mult_w_en), .D(mult_out[63:32]),
        .Q(mult_hi)
    );

    reg_32 lo_reg (
        .we(mult_w_en), .D(mult_out[31:0]),
        .Q(mult_lo)
    );
    
    mux2 #(32) mf_mux (
        .sel(mfhi_mflo), .a(mult_lo), .b(mult_hi),
        .y(mult_res)
    );

    mux2 #(32) mem_mux (
        .sel(dm2reg), .a(alu_out), .b(rd_dm),
        .y(mem_jal)
    );

    mux2 #(32) jal_mux (
        .sel(jal_sel), .a(mem_jal), .b(pc_plus4),
        .y(jal_res)
    );

    mux2 #(32) mult_mux (
        .sel(mfhi_mflo), .a(jal_res), .b(mult_res),
        .y(wd_rf)
    );

endmodule
