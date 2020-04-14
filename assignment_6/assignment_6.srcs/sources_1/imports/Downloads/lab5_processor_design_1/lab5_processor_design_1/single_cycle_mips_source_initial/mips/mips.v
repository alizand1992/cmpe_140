module mips (
    input clk, rst,
    input [4:0]  ra3,
    input [31:0] instr, rd_dm,
    output we_dm,
    output [31:0] pc_current, alu_out, wd_dm, rd3
);
    
    wire branch, jump, reg_dst_1, reg_dst_2, reg_dst_3;
    wire we_reg, alu_src, dm2reg, mfhi_mflo, jr, mult_sel, jal_sel, shift_op, mult_w_en;
    wire [2:0] alu_ctrl;

    datapath dp (
        .clk(clk), .rst(rst), .branch(branch), .jump(jump), 
        .reg_dst_1(reg_dst_1), .reg_dst_2(reg_dst_2), .reg_dst_3(reg_dst_3), 
        .we_reg(we_reg), .alu_src(alu_src), .dm2reg(dm2reg), .alu_ctrl(alu_ctrl), 
        .ra3(ra3), .instr(instr), .rd_dm(rd_dm), .pc_current(pc_current), 
        .alu_out(alu_out), .wd_dm(wd_dm), .rd3(rd3), .mult_w_en(mult_w_en), 
        .mult_sel(mult_sel), .mfhi_mflo(mfhi_mflo), .jal_sel(jal_sel), .jr(jr)
    );

    controlunit cu (
        .opcode(instr[31:26]), .funct(instr[5:0]),

        .branch(branch), .jump(jump), .reg_dst_1(reg_dst_1), .reg_dst_2(reg_dst_2), 
        .reg_dst_3(reg_dst_3), .we_reg(we_reg), .alu_src(alu_src), .we_dm(we_dm), 
        .dm2reg(dm2reg), .mfhi_mflo(mfhi_mflo), .jr(jr), .mult_sel(mult_sel), 
        .jal_sel(jal_sel), .shift_op(shift_op), .alu_ctrl(alu_ctrl), .mult_w_en(mult_w_en)
    );

endmodule