`timescale 1ns / 1ps
`default_nettype none
/* this module describes a 1-bit wide mux using structural constructs */
module two_one_mux(Y,A ,B, S); // definging module name and interface
    /* declaring output*/
    output wire Y; //declaring output
    input wire A,B,S;
    /* declare internal nets */
    wire notS;
    wire andA;
    wire andB; // output of each gate, not, and A and B
    
    // instantiate your modules
    
    not not0(notS,S);
    and and0(andA, notS, A);
    and and1(andB, S,B);
    or or0(Y,andA,andB);
    
    
    
    
endmodule // designate end of module