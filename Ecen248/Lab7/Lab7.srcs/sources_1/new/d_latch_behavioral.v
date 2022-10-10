`timescale 1ns / 1ps

module d_latch_behavioral(
output reg Q, // register because using behavioral
output wire notQ,
input wire D,En
    );
    always@(En or D)

    if(En) // if En is 1'b0
        Q=D;// drive Q with D
    else
        Q=Q; // else drive with Q as 0
    assign notQ = ~Q; // registers can drive wires
// told there is supposed to be nothing here 
endmodule
