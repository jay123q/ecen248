`timescale 1ns / 1ps

module d_latch(Q,notQ,D,En);
output wire Q,notQ;
input wire D,En;

wire Dnot,DnandEn,DnotNandEn;
not  #2 not0(Dnot,D); // invert D  ADD DELAY
nand  #2  nand0(DnandEn,D,En); // nand of D and clock
nand   #2 nand1(DnotNandEn,Dnot,En);
// ready for the actual latch now
nand   #2 nand3(notQ,Q,DnotNandEn);
nand   #2 nand2(Q,DnandEn,notQ);


endmodule
