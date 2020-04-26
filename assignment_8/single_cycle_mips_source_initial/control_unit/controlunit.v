module controlunit (
        input  wire [5:0]  opcode,
        input  wire [5:0]  funct,
        output wire        branch,
        output wire        jump,
        output wire [1:0]  reg_dst,//make 2 bit
        output wire        we_reg,
        output wire        alu_src,
        output wire        we_dm,
        output wire [1:0]  dm2reg,
        output wire        jr_mux,
        output wire        m_mux,
        output wire        m_we,
        output wire        m_ra,
        output wire [2:0]  alu_ctrl
    );
    
    wire [1:0] alu_op;

    maindec md (
        .opcode         (opcode),
        .branch         (branch),
        .jump           (jump),
        .reg_dst        (reg_dst),
        .we_reg         (we_reg),
        .alu_src        (alu_src),
        .we_dm          (we_dm),
        .dm2reg         (dm2reg),
        .alu_op         (alu_op)
    );

    auxdec ad (
        .alu_op         (alu_op),
        .funct          (funct),
        .alu_ctrl       (alu_ctrl),
        .jr_mux         (jr_mux),
        .m_mux          (m_mux),
        .m_we           (m_we),
        .m_ra           (m_ra)
    );

endmodule