`timescale 1ns / 1ps
`default_nettype none

module two_one_mux(Y, A,B,S);
output reg Y; // declare y as a output register
input wire A,B,S; // declaring inputs as wire

always@(A or B or S) // cahnge if these change
    begin // declare block beginning
    if(S == 1'b0) // 1 bit with 1 output
        Y = A;  // drive Y with A value
    else
        Y = B; // else send Y to B
    end // must state ending
endmodule
