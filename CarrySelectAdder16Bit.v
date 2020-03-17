module CarrySelectAdder16Bit(input [15:0]A, input [15:0]B, input Cin, output [15:0]C, output Cout);

wire firstToSecond ; //Takes the carry_out from the first adder to the carry_in of second one
wire SecondToThird ;
wire ThirdToFourth ;

//first adder block need not be a parallel adder becuase Carry_in for it is available immediately (Doesn't need to assume it's value)
		  
		  //INPUTS :						//OUTPUTS :

fourBitAdder 	  first(A[3:0],B[3:0],Cin,				C[3:0],firstToSecond);

parallel4BitAdder second(A[7:4],B[7:4],firstToSecond,			C[7:4],SecondToThird);

parallel4BitAdder third(A[11:8],B[11:8],SecondToThird,			C[11:8],ThirdToFourth);

parallel4BitAdder fourth(A[15:12],B[15:12],ThirdToFourth,	 	C[15:12],Cout);

endmodule 