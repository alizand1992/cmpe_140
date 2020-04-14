module maindec (
    input [5:0] opcode,
    output branch, jump, we_reg, alu_src, we_dm, dm2reg,
    output reg_dst_1, reg_dst_2, reg_dst_3, jal_sel,
    output [1:0] alu_op
);
    reg [8:0] ctrl;

    assign {branch, jump, reg_dst_1, reg_dst_2, reg_dst_3, we_reg, alu_src, we_dm, dm2reg, jal_sel, alu_op} = ctrl;

    always @ (opcode) begin
        case (opcode)
            6'b00_0000: ctrl = 12'b0_0_1_0_0_1_0_0_0_0_10; // R-type
            6'b00_1000: ctrl = 12'b0_0_0_0_0_1_1_0_0_0_00; // ADDI
            6'b00_0100: ctrl = 12'b1_0_0_0_0_0_0_0_0_0_01; // BEQ
            6'b00_0010: ctrl = 12'b0_1_0_0_0_0_0_0_0_0_00; // J
            6'b10_1011: ctrl = 12'b0_0_0_0_0_0_1_1_0_0_00; // SW
            6'b10_0011: ctrl = 12'b0_0_0_0_0_1_1_0_1_0_00; // LW
            6'b00_0011: ctrl = 12'b0_1_0_1_0_1_0_0_0_1_00; // 3/NA JAL
            default:    ctrl = 12'bx_x_x_x_x_x_x_x_x_x_xx;
        endcase
    end

endmodule