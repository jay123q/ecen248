`timescale 1ns / 1ps
`default_nettype none
module carry_lookahead_16bit(Cout,S,X,Y,Cin);
output wire Cout; // c16
output wire [15:0] S;
input wire [ 15:0 ] X,Y; // 16 bit add
input wire Cin;
wire [16:0] C;
wire [15:0] P,G;
wire [ 3:0] P_star, G_star;

assign C[0] = Cin;
//module generate_propogate_unit( G, P, X,Y);
generate_propagate_unit GPU(G,P,X,Y);
// module carry_lookahead_unit(C,G,P,C0);

block_carry_lookahead_unit BCLAU0(
.G_star(G_star[0]),
.P_star(P_star[0]),
.C(C[3:1]),
.G(G[3:0]),
.P(P[3:0]),
.C0(C[0])
);

block_carry_lookahead_unit BCLAU1(
.G_star(G_star[1]),
.P_star(P_star[1]),
.C(C[7:5]),
.G(G[7:4]),
.P(P[7:4]),
.C0(C[4])
);

block_carry_lookahead_unit BCLAU2(
.G_star(G_star[2]),
.P_star(P_star[2]),
.C(C[11:9]),
.G(G[11:8]),
.P(P[11:8]),
.C0(C[8])
);

block_carry_lookahead_unit BCLAU3(
.G_star(G_star[3]),
.P_star(P_star[3]),
    .C(C[15:13]),
    .G(G[15:12]),
    .P(P[15:12]),
    .C0(C[12])
    );

carry_lookahead_unit CLAU(
        .C({C[16],C[12],C[8],C[4]}),
        .G(G_star),
        .P(P_star),
        .C0(C[0])
        );
        
        
summation_unit Su(S,P,C[15:0]);
assign Cout = C[16];

        
        



endmodule
