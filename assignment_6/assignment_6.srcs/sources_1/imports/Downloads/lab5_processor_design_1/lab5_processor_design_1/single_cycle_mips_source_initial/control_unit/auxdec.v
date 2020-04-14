module auxdec (
    input  [1:0] alu_op,
    input  [5:0] funct,
    output [2:0] alu_ctrl, 
    output [1:0] shift_op,
    output mfhi_mflo, jr, mult_sel, mult_w_en
);

    reg [3:0] ctrl;
    reg [5:0] aux_ctrl;

    assign {alu_ctrl, mult_w_en} = ctrl;
    assign {mfhi_mflo, jr, mult_sel, shift_op, mult_w_en} = aux_ctrl;

    always @ (alu_op, funct) begin
        case (alu_op)
            2'b00: case(funct) 
                default:    begin
                    ctrl = 4'b010_0; // ADD
                    aux_ctrl = 6'b0_0_0_00_x;
                end
            endcase
            2'b01: begin
                ctrl = 4'b110_0;
                aux_ctrl = 6'b0_0_0_00_x;
            end
             
            default: begin
                aux_ctrl = 6'b0_0_0_00_x;
                case (funct)
                    6'b01_0000: aux_ctrl = 6'b1_0_1_00_0; // MFHI
                    6'b01_0010: aux_ctrl = 6'b0_0_1_00_0; // MFLO
                    6'b01_1000: aux_ctrl = 6'b0_1_0_00_0; // JR
                    6'b01_0000: aux_ctrl = 6'b0_0_0_10_0; // SLL
                    6'b01_0010: aux_ctrl = 6'b0_0_0_11_0; // SLR
                    6'b10_0100: ctrl = 4'b000_0; // AND
                    6'b10_0101: ctrl = 4'b001_0; // OR
                    6'b10_0000: ctrl = 4'b010_0; // ADD
                    6'b10_0010: ctrl = 4'b110_0; // SUB
                    6'b01_1001: ctrl = 4'b011_1; // MULTU
                    6'b10_1010: ctrl = 4'b111_0; // SLT
                    default:    ctrl = 4'b000_0; // Should bever be don't care 
                endcase
            end               
        endcase
    end
endmodule