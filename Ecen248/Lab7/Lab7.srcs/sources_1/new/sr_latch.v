`timescale 1ns / 1ps

module sr_latch(Q,notQ,En,S,R);
output wire Q, notQ; // one bit output
input wire En,S,R; // one bit gates
wire nandSen,nandREN; // delay of nand0 is 2ns
nand #2 nand1 (nandSen,S,En);
nand #2 nand2(nandREN,R,En);
nand #2 nand4(notQ,nandREN,Q);
nand #2 nand0(Q,nandSen, notQ);

endmodule
