`timescale 1ns / 1ps

module factorial_fpga(
    input clk100MHz, clk_btn, go,
    input [4:0] n,
    
    output [1:0] cs,
    output done, error,
    output [7:0] LEDOUT,
    output [3:0] LEDSEL    
);
    wire clk, clk_5KHz, DONT_USE;
    wire [31:0] factorial;
    
    clk_gen CLK (
        .clk100MHz(clk100MHz), .clk_4sec(DONT_USE), .clk_5KHz(clk_5KHz)
    );
    
    button_debouncer CLK_DB(
        .clk(clk_5KHz), .button(clk_btn), .debounced_button(clk)
    );
    
    CU_DP cudp (
        .n(n), .clk(clk), .go(go), .done(done), 
        .error(error), .cs(cs), .factorial(factorial)
    );
    
    
endmodule
