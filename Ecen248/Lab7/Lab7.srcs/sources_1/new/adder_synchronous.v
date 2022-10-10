`timescale 1ns / 1ps
`default_nettype none

module adder_synchronous(Carry_reg, Sum_reg, Clk, A,B);
output reg Carry_reg;
output reg [1:0] Sum_reg;
input wire Clk;
input wire [1:0] A,B;
// wire nest
reg [1:0] A_reg, B_reg;
wire Carry;
wire [1:0] Sum;
// call the 2 bit adder
adder_2bit addyboi(Carry,Sum,A_reg,B_reg);

always@(posedge Clk)
    begin
    A_reg <= A;
    B_reg <=B;
    end
always@(posedge Clk)
    begin // needed to put two statements here
    Carry_reg <= Carry;
    Sum_reg <= Sum;
    end

endmodule
