module controlunit (
    input  wire [5:0]  opcode,
    input  wire [5:0]  funct,
    output branch, jump, 
    output reg_dst_1, reg_dst_2, reg_dst_3,
    output we_reg, alu_src, we_dm, dm2reg,
    output mfhi_mflo, jr, mult_sel, jal_sel, mult_w_en,
    output [1:0] shift_op,
    output [2:0]  alu_ctrl
);
    
    wire [1:0] alu_op;

    maindec md (
        .opcode(opcode), .branch(branch), .jump(jump), 
        .reg_dst_1(reg_dst_1), .reg_dst_2(reg_dst_2), .reg_dst_3(reg_dst_3),
        .we_reg(we_reg), .alu_src(alu_src), .we_dm(we_dm), 
        .dm2reg(dm2reg), .alu_op(alu_op), .jal_sel(jal_sel)
    );

    auxdec ad (
        .alu_op(alu_op), .funct(funct),
        
        .alu_ctrl(alu_ctrl), .shift_op(shift_op), .mfhi_mflo(mfhi_mflo),
        .jr(jr), .mult_sel(mult_sel), .mult_w_en(mult_w_en)
    );

endmodule