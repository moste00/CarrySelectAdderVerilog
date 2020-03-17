module CarrySelectAdderTestBench();

reg [15:0] testInput_A;
reg [15:0] testInput_B;
reg testCarry_in;

wire [15:0] testOutput_C ;
wire testCarry_Cout;

CarrySelectAdder16Bit test(testInput_A, testInput_B, testCarry_in, testOutput_C, testCarry_Cout);

integer i;
integer j;

initial
begin
	//Testing the adder over all 16*16 possible combinations for A & B
	//1 Time Unit := 1 pico Second
	#5 for(i = 0; i<16 ; i = i+1)
	begin
		testInput_A = i ;
		for(j = 0; j<16 ; j = j+1)
		begin
			testInput_B = j ;

			//This line's purpose is to verify that the adder is working in parallel.
			//If it was a sequential adder, setting the carry to "x" would make the result "xxxxxxxxxxx....xxx"
			//But since the adder works in parallel, making the carry "x" only affects the bits that depend on it.
			//so that result will appear as (for example) "00001011.....xxxxxxx"; i.e: only part of the result appears as undefined.
			testCarry_in = 'bx;
			#5

			testCarry_in = 1;
			#5
			$display("%d+%d+%d = %d ",testInput_A,testInput_B,testCarry_in,testOutput_C + testCarry_Cout);

			testCarry_in = 0;
			#5
			$display("%d+%d+%d = %d ",testInput_A,testInput_B,testCarry_in,testOutput_C + testCarry_Cout);
		end
	end
end

endmodule 