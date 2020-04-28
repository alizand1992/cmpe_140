module auxdec (
        input  wire [1:0] alu_op,
        input  wire [5:0] funct,
        output wire        jr_mux,
        output wire        m_mux,
        output wire        m_we,
        output wire        m_ra,
        output wire [2:0] alu_ctrl
    );

    reg [6:0] ctrl;

    assign {alu_ctrl, jr_mux, m_mux, m_we, m_ra} = ctrl;

    always @ (alu_op, funct) begin
        case (alu_op)
            2'b00: ctrl = 7'b010_0_0_0_0;          // ADD
            2'b01: ctrl = 7'b110_0_0_0_0;          // SUB
            default: case (funct)
                6'b00_0000: ctrl = 7'b100_0_0_0_0; // SLL
                6'b00_0010: ctrl = 7'b011_0_0_0_0; // SRL
                6'b00_1000: ctrl = 7'b000_1_0_0_0; // JR
                6'b01_0000: ctrl = 7'b000_0_1_0_0; // MFHI
                6'b01_0010: ctrl = 7'b000_0_1_0_0; // MFLO
                6'b01_1001: ctrl = 7'b101_0_0_1_1; // MULTU
                6'b10_0100: ctrl = 7'b000_0_0_0_0; // AND
                6'b10_0101: ctrl = 7'b001_0_0_0_0; // OR
                6'b10_0000: ctrl = 7'b010_0_0_0_0; // ADD
                6'b10_0010: ctrl = 7'b110_0_0_0_0; // SUB
                6'b10_1010: ctrl = 7'b111_0_0_0_0; // SLT
                default:    ctrl = 7'bxxx_x_x_x_x;
            endcase
        endcase
    end

endmodule