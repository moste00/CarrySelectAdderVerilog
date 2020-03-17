module fourBitAdder(input [3:0]A, input [3:0]B, input Cin, output [3:0]C,output Cout);
 
assign {Cout,C} = A+B+Cin;

endmodule 