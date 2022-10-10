`timescale 1ns / 1ps

module d_flip_flop_behavioral(
    output reg Q,
    output wire notQ,
    input wire D,Clk // merrging these two
    );
    //pos edge means rising clock edge
    always@(posedge Clk)
        Q<=D;
    assign notQ = ~Q;
endmodule
