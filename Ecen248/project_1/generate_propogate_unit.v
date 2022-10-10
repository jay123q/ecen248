`timescale 1ns / 1ps
`default_nettype none

module generate_propagate_unit( G, P, X,Y);
// time scale declared above
// expanding to 15 bits
output wire [15:0] G,P;
input wire [15:0] X,Y;

assign G =  X & Y;
assign P = X ^ Y;

// pass in busse
endmodule
module carry_lookahead_unit(C,G,P,C0);

output wire [4:1] C; //c1 - c4
input wire [3:0] G, P;
input wire C0; //inital carry

// using formula, would rather use a full adder and just delcare outputs
assign  C[1] = G[0] | P[0] & C0;
assign C[2] = G[1] | P[1]&G[0]|(P[1]&P[0]&C0);                                                                      //     C[1] &P[1] | G[1]; 
assign C[3] = G[2] | P[2]&G[1] | P[2]&P[1]&G[0] | P[2]&P[1]&P[0]&C0;                                                //                   C[2] & P[2] | G[2];
assign C[4] = G[3] | P[3]&G[2] | P[3]&P[2]&G[01] | P[3]&P[2]& P[1]&G[0] |(P[3]&P[2]&P[1]&P[0]&C0);   //     C[3] & P[3] | G[3];
endmodule
// summation unit
module summation_unit(S,P,C);

output wire [15:0] S; // sum vector
input wire [15:0] P,C; //  propogate n carry

// follow circuit diagram
assign S = P^C;

endmodule
