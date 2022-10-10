`timescale 1ns / 1ps
`default_nettype none
module carry_lookahead_4bit(Cout, S, X ,Y, Cin );
output wire Cout;  // used for last wire
output wire [3:0] S; //  final 4 bit sum
input wire [3:0] X,Y;
input wire Cin;

// declare wirenests

// Generate propogate
wire [3:0] G, P;
wire [4:1] hold;

generate_propogate_unit C(G,P,X,Y);

//module carry_lookahead_unit(C,G,P,C0);
carry_lookahead_unit B(hold,G,P,Cin);

summation_unit M(S,P,{hold[3:1],Cin});

assign Cout = hold[4];
endmodule
