`timescale 1ns / 1ps
`default_nettype none
module four_bit_mux( Y,A,B,S);
    output reg [3:0] Y; // declare output bit as a register vector 4
    input wire [3:0] A,B;
    input wire S; // the selector of what type

    always@(A or B or S) // cahnge if these change
    begin // declare block beginning
    if(S == 1'b0) // 1 bit with 1 output
        Y = A;  // drive Y with A value
    else
        Y = B; // else send Y to B
    end // must state ending
endmodule
