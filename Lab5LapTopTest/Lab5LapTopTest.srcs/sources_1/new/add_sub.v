`timescale 1ns / 1ps
`default_nettype none
// the idea here us to add all parts of pervious assignments into one
module add_sub( 
// opSel is the user input
    output wire [3:0] Sum,  // make sure there is no overflow
    output wire Overflow, //output is 4 bit wire
    input wire [3:0] opA, // 4 bit inputs
    input wire [3:0] opB, //  4 bit inputs to add or sub
    input wire opSel // Cin is a one bit input that controls Mux

 //  this is weirdly done, is it done this way to "import" the full adder?
);
// now declare the internal nest
wire [3:0] notB; // this will take the B's completement if Cin is a 1 (subtract)
wire c0,c1,c2,c3; 
assign notB[0] = opB[0] ^ opSel; // if opSel is 1 and opB is 0 then it subtracts from A
assign notB[1] = opB[1] ^ opSel;
assign notB[2] = opB[2] ^ opSel;
assign notB[3] = opB[3] ^ opSel;
// Declaring the add OR subtract

// Now I will repreat with AND and A thus finishing the addition or subtractor
// but I dont have to since I build a full_adder to ddo this for me
full_adder adder0(Sum[0],c0,opA[0],notB[0],opSel);
full_adder adder1(Sum[1],c1,opA[1],notB[1],c0);
full_adder adder2(Sum[2],c2,opA[2],notB[2],c1);
full_adder adder3(Sum[3],c3,opA[3],notB[3],c2);

/* overflow detection */
assign Overflow = c3 ^ c2; //Overflow is c4 xor c3

endmodule
