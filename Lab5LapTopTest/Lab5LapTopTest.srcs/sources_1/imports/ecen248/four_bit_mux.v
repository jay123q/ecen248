`timescale 1ns / 1ps
`default_nettype none
/* this connects four 1 bit, 2:1 MUXs together to *
    * create a single 4 bit, 2:1 MUX */
    
    module four_bit_mux(Y,A,B,S);
    //declaring output and input
    
    
    //output is a 4 bit wide wire
    
    input wire [3:0] A,B; // A and B are input wires
    input wire S; // select still 1 bit wire
    output wire [3:0] Y; // declare output to be a 4 bit wire
    
    /* instantiate userdefined wires */
    two_one_mux MUX0(Y[0],A[0],B[0],S);
    two_one_mux MUX1(Y[1],A[1],B[1],S);
    two_one_mux MUX2(Y[2],A[2],B[2],S);  //increment each one up and repeat
    two_one_mux MUX3(Y[3],A[3],B[3],S);
    //Add outputs for other files
endmodule
