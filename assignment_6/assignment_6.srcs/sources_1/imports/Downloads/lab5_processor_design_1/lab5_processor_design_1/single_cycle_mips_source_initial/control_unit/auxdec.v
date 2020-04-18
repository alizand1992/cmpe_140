module auxdec (
    input  [1:0] alu_op,
    input  [5:0] funct,
    output [2:0] alu_ctrl, 
    output [1:0] shift_op,
    output mfhi_mflo, jr, mult_sel, mult_w_en, reg_dst_2
);

    reg [9:0] ctrl;

    assign {alu_ctrl, mfhi_mflo, jr, mult_sel, shift_op, mult_w_en, reg_dst_2} = ctrl;

    always @ (alu_op, funct) begin
        case (alu_op)
            2'b00: case(funct) 
                6'b00_0101: ctrl = 10'b010_0_0_0_00_0_1; // ADD                
                default:    ctrl = 10'b010_0_0_0_00_0_0; // ADD
            endcase

            2'b01: ctrl = 10'b110_0_0_0_00_0_0;
             
            default: begin
                case (funct)
                    6'b01_0000: ctrl = 10'b000_1_0_1_00_0_0; // MFHI
                    6'b01_0010: ctrl = 10'b000_0_0_1_00_0_0; // MFLO
                    6'b00_1000: ctrl = 10'b000_0_1_0_00_0_1; // JR
                    6'b01_0000: ctrl = 10'b000_0_0_0_10_0_0; // SLL
                    6'b01_0010: ctrl = 10'b000_0_0_0_11_0_0; // SLR
                    6'b10_0100: ctrl = 10'b000_0_0_0_00_0_0; // AND 
                    6'b10_0101: ctrl = 10'b001_0_0_0_00_0_0; // OR
                    6'b10_0000: ctrl = 10'b010_0_0_0_00_0_0; // ADD
                    6'b10_0010: ctrl = 10'b110_0_0_0_00_0_0; // SUB
                    6'b01_1001: ctrl = 10'b011_0_0_1_00_1_0; // MULTU
                    6'b10_1010: ctrl = 10'b111_0_0_0_00_0_0; // SLT
                    default: ctrl = 10'b000_0_0_0_00_0_0; 
                endcase
            end               
        endcase
    end
endmodule