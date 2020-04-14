module auxdec (
        input  wire [1:0] alu_op,
        input  wire [5:0] funct,
        output wire [2:0] alu_ctrl,
        output wire       jr_sel,
        output wire       hi_en,
        output wire       lo_en,
        output wire       HILO_sel,
        output wire       alu_mult_sel,
        output wire       shift_mux_sel,
        output wire       shift_mult_sel

    );

    reg [9:0] ctrl;

    assign {alu_ctrl, jr_sel, hi_en, lo_en, HILO_sel, alu_mult_sel, shift_mux_sel, shift_mult_sel} = ctrl;

always @ (alu_op, funct) begin
        case (alu_op)
            2'b00: ctrl = 10'b010_0000000;          // ADD
            2'b01: ctrl = 10'b110_0000000;          // SUB
            default: case (funct)
                6'b10_0100: ctrl = 10'b000_0000000; // AND
                6'b10_0101: ctrl = 10'b001_0000000; // OR
                6'b10_0000: ctrl = 10'b010_0000000; // ADD
                6'b10_0010: ctrl = 10'b110_0000000; // SUB
                6'b10_1010: ctrl = 10'b111_0000000; // SLT
                
                6'b00_1000: ctrl = 10'b000_1_0000_00; // JR
                
                6'b01_1001: ctrl = 10'b000_0_1100_00; // MULTU
                6'b01_0000: ctrl = 10'b000_0_1101_00; // MFHI
                6'b01_0010: ctrl = 10'b000_0_1111_00; // MFLO
                
                6'b00_0000: ctrl = 10'b000_0_0000_01; // SLL
                6'b00_0010: ctrl = 10'b000_0_0000_11; // SLR
                default:    ctrl = 10'bxxx_xxxxxxx;
            endcase
        endcase
    end
endmodule
