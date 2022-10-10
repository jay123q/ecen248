`timescale 1ns / 1ps
`default_nettype none
module full_adderOLD(S,Cout,A,B,Cin);
//input wires
input wire A,B,Cin;
output wire S, Cout;
// nests
wire andBCin, andACin, andAB;
// #6 is gate delay
assign #6 S = A^B^Cin;  // S is xor A,B,and Cin
assign #4 andBCin = B&Cin; // 4ns delay
assign #4 andACin = A&Cin;
assign #4 andAB = A&B;
assign #6 Cout = andAB | andACin | andBCin;

endmodule
