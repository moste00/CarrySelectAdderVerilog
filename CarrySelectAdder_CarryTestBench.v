module CarrySelectAdder_CarryTestBench();

reg [15:0] A ;
reg [15:0] B ;
reg carry_in;

wire [15:0] C;
wire carry_out;

wire carry_one;
wire carry_two;
wire carry_three;

fourBitAdder one(A[3:0], B[3:0], carry_in, C[3:0], carry_one);

parallel4BitAdder two(A[7:4], B[7:4], carry_one, C[7:4], carry_two);

parallel4BitAdder three(A[11:8], B[11:8], carry_two, C[11:8], carry_three);

parallel4BitAdder four(A[15:12], B[15:12], carry_three, C[15:12], carry_out);

integer i;
integer j;

initial
begin
	for(i = 10; i < 13 ; i = i+1)
	begin
		for(j = 11 ; j< 13 ; j = j+1)
		begin
			A = i;
			B = j;
			carry_in = 0;
			#10
			$display("Adding %d + %d + %d gives %d",i,j,carry_in,C+carry_out);
			$display("Intermediate Carries : Cout1 = %d   Cout2 = %d   Cout3 = %d",carry_one,carry_two,carry_three);


			carry_in = 1;
			#10
			$display("Adding %d + %d + %d gives %d",i,j,carry_in,C+carry_out);
			$display("Intermediate Carries : Cout1 = %d   Cout2 = %d   Cout3 = %d",carry_one,carry_two,carry_three);
		end 
	end

end


endmodule 