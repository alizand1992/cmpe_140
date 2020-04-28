`timescale 1ns / 0.1ps
//purpose is to generate the carryouts C0 to C4
// put all inputs in the half adders- so output P adn G values 
//these P and G values serve as inputs
//insert all these equations

module CarryLookBlock(
    input wire P3, //initial carry in- instananizously determins C1-C3
    input wire G3, //standard inputs for the 4 half adders
    input wire P2, //initial carry in- instananizously determins C1-C3
    input wire G2,
    input wire P1, //initial carry in- instananizously determins C1-C3
    input wire G1,
    input wire P0, //initial carry in- instananizously determins C1-C3
    input wire G0,
    input wire C0,
    output reg C1,
    output reg C2,
    output reg C3,
    output reg C4 //C4 IS COUT
    );

    always@(*)
        begin //P0-P3, and G3-G0 generated now we use them to form the carryout equations
            //Ci=Gi+PiCi-1
            C1=G0|P0&C0;
            C2=G1|P1&(G0|P0&C0);
            C3=G2|P2&(G1|P1&(G0|P0&C0));
            C4=G3|P3&(G2|P2&(G1|P1&(G0|P0&C0)));
        end
    
endmodule