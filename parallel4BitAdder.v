module parallel4BitAdder(input [3:0]A, input [3:0]B, input Cin, output [3:0]C, output Cout);

wire firstCarry;
wire secondCarry;
wire [3:0] firstResult;
wire [3:0] secondResult;

fourBitAdder   first(A,B,0,firstResult,firstCarry);
fourBitAdder   second(A,B,1,secondResult,secondCarry);

assign C = (Cin)? secondResult:firstResult ;

assign Cout = (Cin)? secondCarry:firstCarry ;


endmodule 