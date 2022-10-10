`timescale 1ns / 1ps
`default_nettype none
module block_carry_lookahead_unit(G_star, P_star,C,G,P,C0);
output wire G_star, P_star;
output wire [3:1] C; // C3, C2, C1
input wire [3:0] G,P;
input wire C0;

assign C[1] = G[0] | P[0]&C0;
assign C[2] = G[1] | (P[1]&G[0]) | (P[1]&P[0]&C0);
assign C[3] = G[2] | (P[2]&G[1]) | (P[2]&P[1]&G[0]) | (P[2]&P[1]&P[0]&C0);

//assign C[3:2] = G[2:1] | (P[2:1] & C[2:1]);
assign G_star  = G[3]|(P[3]&G[2])|(P[3]&P[2]&G[1])|(P[3]&P[2]&P[1]&G[0]);
assign P_star = P[3]&P[2]&P[1]&P[0];


endmodule
