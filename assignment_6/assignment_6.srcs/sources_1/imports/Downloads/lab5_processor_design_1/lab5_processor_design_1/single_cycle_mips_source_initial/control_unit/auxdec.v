module auxdec (
        input  wire [1:0] alu_op,
        input  wire [5:0] funct,
        output wire [2:0] alu_ctrl,
        output wire mfhi_mflo, jr
    );

    reg [2:0] ctrl;
    reg [1:0] aux_ctrl;

    assign {alu_ctrl} = ctrl;
    assign {mfhi_mflo, jr} = aux_ctrl;

    always @ (alu_op, funct) begin
        case (alu_op)
            2'b00: case(funct) begin
                6'b01_0000: aux_ctrl = 2'b1_0; // MFHI
                6'b01_0010: aux_ctrl = 2'b0_0; // MFLO
                6'b01_1000: aux_ctrl = 2'b0_1; // JR
                6'b01_0000: // SLL
                6'b01_0010: // SLR
                default:    ctrl = 3'b010; // ADD
            endcase
            2'b01: ctrl = 3'b110;          // SUB
            default: case (funct)
                6'b10_0100: ctrl = 3'b000; // AND
                6'b10_0101: ctrl = 3'b001; // OR
                6'b10_0000: ctrl = 3'b010; // ADD
                6'b10_0010: ctrl = 3'b110; // SUB
                6'b01_1001: ctrl = 3'b011; // MULTU
                6'b10_1010: ctrl = 3'b111; // SLT
                default:    ctrl = 3'bxxx;
            endcase
        endcase
    end
            // 0/10 MFHI 
            // 0/12 MFLO
            // 0/08 JR
            // 0/00 SLL
            // 0/02 SLR
endmodule