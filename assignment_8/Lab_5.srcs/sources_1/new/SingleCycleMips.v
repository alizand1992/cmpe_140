`timescale 1ns / 1ps

module SingleCycleMips(
        input   clk, rst,
        input   [31:0] instr, rd,
        output  we,
        output [11:2] addr,
        output [31:0] pc, wd
    );
    
    
    
    mips mips (
            .clk            (clk),
            .rst            (rst),
            .ra3            (ra3),
            .instr          (instr),
            .rd_dm          (rd),
            .we_dm          (we),
            .pc_current     (pc),
            .alu_out        (alu_out),
            .wd_dm          (wd),
            .rd3            (rd3)
        );
endmodule
