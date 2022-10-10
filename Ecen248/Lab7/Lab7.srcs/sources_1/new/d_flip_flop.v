`timescale 1ns / 1ps

module d_flip_flop(Q,notQ,Clk,D);
output wire Q, notQ; //  outputs of slave
input wire Clk, D;
// wire nets
wire notClk, notnotClk;
wire Qm;

wire notQm; // used in instaintion but left unconnected

not #2 not1(notClk,Clk); // not clock
not #2 not2(notnotClk,notClk); // not not clock

d_latch master(Qm,notQm,D,notClk);
d_latch slave(Q,notQ,Qm,notnotClk); //  lab manuel has not not clock

endmodule
