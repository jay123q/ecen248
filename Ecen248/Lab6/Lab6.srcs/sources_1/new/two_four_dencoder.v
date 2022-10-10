// add timescale etc

module two_four_dencoder(
    input wire [1:0] W, 
    input wire En,
    output wire [3:0] Y
    );
    // declare not variables for the complement
    wire notW0;
    wire notW1;
    not not0(W[0],notW0); //using structural opposed to data flow
    not not1(W[1],notW1);
    //if using dataflow
    // assign notW0 = !W[0];
    // assign notW1 = !W[1];

    // now we will declare and gates and outputs
    // check the circuit diagram  for reference
    and and0(notW0,notW1,En,Y[0]); 
    and and1(W[0],notW1,En,Y[1]);
    and and2(notW0,W[1],En,Y[2]);
    and and3(W[0],W[1],En,Y[3]);
  //  assign Y[0] = notW0 && notW1 && En;
    //assign Y[1] = W[0] && notW1 && En;
   // assign Y[2] = notW0 && W[1] && En;
  //  assign Y[3] = W[0] && W[1] && En;
        
    
    
    
endmodule
