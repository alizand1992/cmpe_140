module auxdec (
    input  [1:0] alu_op,
    input  [5:0] funct,
    output [2:0] alu_ctrl, 
    output [1:0] shift_op,
    output mfhi_mflo, jr, mult_sel, mult_w_en, reg_dst_2
);

    reg [2:0] ctrl;
    reg [6:0] aux_ctrl;

    assign {alu_ctrl} = ctrl;
    assign {mfhi_mflo, jr, mult_sel, shift_op, mult_w_en, reg_dst_2} = aux_ctrl;

    always @ (alu_op, funct) begin
        case (alu_op)
            2'b00: case(funct) 
                6'b00_0101: begin
                    ctrl = 3'b010; // ADD
                    aux_ctrl = 7'b0_0_0_00_0_1;
                end
                
                default:    begin
                    ctrl = 3'b010; // ADD
                    aux_ctrl = 7'b0_0_0_00_0_0;
                end
            endcase

            2'b01: begin
                ctrl = 3'b110;
                aux_ctrl = 7'b0_0_0_00_0_0;
            end
             
            default: begin
                case (funct)
                    6'b01_0000: aux_ctrl = 7'b1_0_1_00_0_0; // MFHI
                    6'b01_0010: aux_ctrl = 7'b0_0_1_00_0_0; // MFLO
                    6'b00_1000: aux_ctrl = 7'b0_1_0_00_0_1; // JR
                    6'b01_0000: aux_ctrl = 7'b0_0_0_10_0_0; // SLL
                    6'b01_0010: aux_ctrl = 7'b0_0_0_11_0_0; // SLR
                    6'b10_0100: begin
                        ctrl = 3'b000; // AND
                        aux_ctrl = 7'b0_0_0_00_0_0; 
                    end
                    6'b10_0101: begin
                        ctrl = 3'b001; // OR
                        aux_ctrl = 7'b0_0_0_00_0_0; 
                    end
                    6'b10_0000: begin
                        ctrl = 3'b010; // ADD
                        aux_ctrl = 7'b0_0_0_00_0_0; 
                    end
                    6'b10_0010: begin
                        ctrl = 3'b110; // SUB
                        aux_ctrl = 7'b0_0_0_00_0_0; 
                    end
                    6'b01_1001: begin
                        ctrl = 3'b011; // MULTU
                        aux_ctrl = 7'b0_0_1_00_1_0; 
                    end
                    6'b10_1010: begin 
                        ctrl = 3'b111; // SLT
                        aux_ctrl = 7'b0_0_0_00_0_0; 
                    end
                    default: begin
                        ctrl = 3'b000; // Should bever be don't care 
                        aux_ctrl = 7'b0_0_0_00_0_0; 
                    end
                endcase
            end               
        endcase
    end
endmodule