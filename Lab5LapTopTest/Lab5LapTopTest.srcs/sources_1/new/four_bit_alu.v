`timescale 1ns / 1ps
`default_nettype none

module four_bit_alu(
output wire [3:0] Result,// 4 bit output
output wire Overflow, //  the overflow of alu
input wire [3:0] opA, opB, // defining 4 bit operands
input wire [1:0] ctrl // this will control add and subtract
    ); // 00 = and, 01 = add, 10 = and, 11 = sub
    // declare wire nests
wire  flowOver; // used in overflow
wire [3:0] add_sub_result; // the adder and subtractor mux
wire [3:0] A3B3; // sed in AB values for mux
// this will take the and of all A and B inputs for the mux
assign A3B3 =  opA & opB;


// now find the mux inputs from the adder/sub

add_sub add_subUnit(add_sub_result, flowOver, opA, opB, ctrl[1]);    //send in ctrl[1] it is the cin for the add_sub


// we send in ctrl[0] in accordance with the lab manual, and input 
four_bit_mux Mux0000(Result,A3B3,add_sub_result,ctrl[0]);

// this will print out the result A is and off A and B, B is the addition or sub sent by ctrl1

//Overflow logic
assign Overflow = flowOver & ctrl[0]; //  it maybe  Results[3] ^ Results[2]
endmodule
