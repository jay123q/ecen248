`timescale 1ns / 1ps
`default_nettype none

module priority_encoder(
    input wire [3:0] W,
    output wire zero,
    output reg [1:0] Y
);
// this will be the four two but with some changes to the switch satements
    assign zero = (W == 4'b0000);
    always@(W) // trigger if W  changes
    begin // start block
            casex(W) // base cases off of W
              4'b0001 : Y = 2'b00;
              4'b001X : Y = 2'b01;
              4'b01XX : Y = 2'b10; // assign the decoding values
              4'b1XXX : Y = 2'b11;
              default : Y = 2'bXX; //  case is not listed
            endcase
    end
    
endmodule
