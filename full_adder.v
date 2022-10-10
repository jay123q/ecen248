`timescale 1ns / 1ps
`default_nettype none

/* this describes the gate level adder in verlog */

module full_adder(S,Cout,A,B,Cin);

    input wire A,B,Cin; // 1 bitwires
    wire andBCin, andACin, andAB; // this line was missing a&B
    output wire S;
    output wire Cout;
    
    // declaring internal nests
    assign S=A^B^Cin;
    assign andAB = A&B;
    assign andBCin = B&Cin;
    assign andACin = A&Cin;
    
    
    assign Cout = andAB | andBCin | andACin; 
endmodule
    
    
    
    