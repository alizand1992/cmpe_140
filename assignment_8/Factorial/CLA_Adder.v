`timescale 1ns / 0.1ps
//////////////////////////////////////////////////////////////////////////////////

//purpose is to generate the carryouts C0 to C4
// put all inputs in the half adders- so output P adn G values 
//these P and G values serve as inputs
//insert all these equations

module CLA_Adder(
    input wire Cin, //initial carry in- instananizously determins C1-C3
    input wire [3:0] a, //standard inputs for the 4 half adders
    input wire [3:0] b,
 
    output wire [3:0] sum, //sum of everthing have a sum[3:0] on the tb and assign everthing to it and compre with adder
    output wire C4
    );
    wire P3,P2,P1,P0; //SUMs FROM HALF ADDER 
    wire G3,G2,G1,G0; //CARRYOUTS FROM HALF ADDER 
    wire C1,C2,C3; //declaring this wires
   // HalfAdder( input wire a, input wire b, output wire sum, output wire c_out );
   //Sum=A XOR B Carry=A&B
   //Sum=P And Carry=G
    HalfAdder h3(a[3],b[3],P3,G3);
    HalfAdder h2(a[2],b[2],P2,G2);
    HalfAdder h1(a[1],b[1],P1,G1);
    HalfAdder h0(a[0],b[0],P0,G0);
    
    //generating the carry out, C4 is Cout! 
    CarryLookBlock CLA (P3,G3,P2,G2,P1,G1,P0,G0,Cin,C1,C2,C3,C4);
    //This will pass in the inputs for sum, and the output for C4(carryout)
    XOR s3(P3,C3,sum[3]);
    XOR s2(P2,C2,sum[2]);
    XOR s1(P1,C1,sum[1]);
    XOR s0(P0,Cin,sum[0]);
endmodule
