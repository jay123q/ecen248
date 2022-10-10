`timescale 1ns / 1ps
`default_nettype none

module two_four_decoder(
    input wire [1:0] W, // input two bits
    input wire En,
    output reg [3:0] Y //  output two bits
    );
    always@(W,En) // trigger if W or En changes
    begin // start block
        if(En == 1'b1) // select based off W
            case(W) // base cases off of W
              2'b00 : Y = 4'b0001;
              2'b01 : Y = 4'b0010;
              2'b10 : Y = 4'b0100; // assign the decoding values
              2'b11 : Y = 4'b1000;
            endcase
        else
            Y = 4'b0000; // sets
    end
endmodule
