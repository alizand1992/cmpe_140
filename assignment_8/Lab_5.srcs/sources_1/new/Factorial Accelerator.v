`timescale 1ns / 1ps

module FactorialAccelerator(
    input clk, rst, we,
    input [1:0] a,
    input [3:0] wd,
    output [31:0] rd
    );
    
    wire        We2;
    wire        We1;
    wire [1:0]  RdSel;
    wire        Go;
    wire        GoPulse;
    wire        GoPulseClk;
    wire        GoPulseCmb;
    wire [3:0]  n;
    wire done;
    wire err;
    wire [31:0] nf;
    wire [31:0] nfClk;
    wire        ResDone;
    wire        ResErr;
    
    fact_ad decoder(
        .A      (a),
        .WE     (we),
        .WE1    (We1),
        .WE2    (We2),
        .RdSel  (RdSel)
    );
    
    assign GoPulse = wd[0] & We2;
    
    Gate #(1) GoPulseGate(
        .clk    (clk),
        .en     (GoPulse),
        .i      (GoPulse),
        .o      (GoPulseClk)
    );
    
    Gate #(1) GoGate(
        .clk    (clk),
        .en     (We2),
        .i      (wd[0]),
        .o      (Go)
    );
    Gate #(4) NGate(
        .clk    (clk),
        .en     (We1),
        .i      (wd),
        .o      (n)
    );
    
    Factorial Factorial(
        .clk    (clk),
        .rst    (rst),
        .go     (GoPulseClk),
        .n      (n),
        .done   (done),
        .err    (err),
        .out    (nf)
    );
    
    Gate #(32) NfGate(
        .clk    (clk),
        .en     (done),
        .i      (nf),
        .o      (nfClk)
    );
    
    SRLatch ErrLatch(
        .clk    (clk),
        .s      (err),
        .r      (GoPulseCmb),
        .q      (ResErr)
    );
    
    SRLatch DoneLatch(
        .clk    (clk),
        .s      (done),
        .r      (GoPulseCmb),
        .q      (ResDone)
    );
    
    mux4 #(32) data_mux(
        .sel    (RdSel),
        .a      ({28'b0,n}),
        .b      ({31'b0,Go}), 
        .c      ({30'b0,ResErr,ResDone}),
        .d      (nfClk),
        .y      (rd)
    );
endmodule
