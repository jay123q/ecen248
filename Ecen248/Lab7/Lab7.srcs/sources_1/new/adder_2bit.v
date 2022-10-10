`timescale 1ns / 1ps
`default_nettype none
module adder_2bit(
output wire Carry, // carry out a 2 bit wire, should this be delcared as a reg?
output wire [1:0] Sum,
input wire[1:0] A,B
);
wire co;
// inside of here I have added the delay
// tried to use a always loop for if A or B changed but got an error
full_adderOLD add(Sum[0],co,A[0],B[0],0);
full_adderOLD add2(Sum[1],Carry,A[1],B[1],co);
//full_adderOLD add2(Sum[1],Carry,A,B);


endmodule
