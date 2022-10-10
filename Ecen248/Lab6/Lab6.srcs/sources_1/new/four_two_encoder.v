`timescale 1ns / 1ps
`default_nettype none

module four_two_encoder(
    input wire [3:0] W,
    output wire zero,
    output reg [1:0] Y
);

    assign zero = (W == 4'b0000);
    always@(W) // trigger if W  changes
    begin // start block
            case(W) // base cases off of W
              4'b0001 : Y = 2'b00;
              4'b0010 : Y = 2'b01;
              4'b0100 : Y = 2'b10; // assign the decoding values
              4'b1000 : Y = 2'b11;
              default : Y = 2'bXX;
            endcase
    end
    
endmodule
