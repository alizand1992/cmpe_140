`timescale 1ns / 1ps

module Hazard_CU(
        input  wire  [4:0]  rtE,
        input  wire  [4:0]  rtD,
        input  wire  [4:0]  rsD,
        input  wire  [4:0]  rsE,
        input  wire         dm2regE,
        input  wire         dm2regM,
        input  wire  [4:0]  rf_waM,
        input  wire  [4:0]  rf_waE,
        input  wire  [4:0]  rf_waW,
        input  wire         we_regE,
        input  wire         we_regM,
        input  wire         we_regW,
        input  wire         branchD,
        output wire         forwardAD,
        output wire         forwardBD,
        output wire  [1:0]  forwardAE,
        output wire  [1:0]  forwardBE,
        output wire         stallD,
        output wire         flushE,
        output wire         stallF
    );
    
    wire         lwstall;
    wire s_rtE = rtE > 0;
    wire s_rtD = rtD > 0;
    wire s_rsD = rsD > 0;
    wire s_rsE = rsE > 0;
    wire branchStall;
    
    //Stalling
    assign lwstall = ((rsD == rtE) | (rtD == rtE)) & dm2regE;
    assign branchStall = (branchD & we_regE & ((rf_waE == rsD) | (rf_waE == rtD))) | (branchD & dm2regM & ((rf_waM == rsD) | (rf_waM == rtD))) ? 1 : 0;
    assign stallF = lwstall | branchStall;
    assign flushE = lwstall | branchStall;
    assign stallD = lwstall | branchStall;
    
    
    
    //Forward AE
    assign forwardAE = (we_regM & s_rsE & (rf_waM == rsE)) ? 2'b10 : (we_regW & s_rsE & (rf_waW == rsE)) ? 2'b01 : 2'b00;
    
    //Forward BE
    assign forwardBE = (we_regM & s_rtE & (rf_waM == rtE)) ? 2'b10 : (we_regW & s_rtE & (rf_waW == rtE)) ? 2'b01 : 2'b00;
    
    //Forward AD
    assign forwardAD = (we_regM & s_rsD & (rf_waM == rsD) & branchD);
    
    //Forward BD
    assign forwardBD = (we_regM & s_rtD & (rf_waM == rtD) & branchD);
    
endmodule
