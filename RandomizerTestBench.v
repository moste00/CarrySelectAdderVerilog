module RandomizerTestBench ;

//The LFSR Ports
reg clk ;
reg enable ;
reg reset; 
reg load ;
reg Serial_Input ;
wire Serial_Output ;

//external data pins for the randomizer 
reg data_in ;
wire data_out;

//Buffers for storing the input and output sequence
reg [95:0] InputStream ;
reg [95:0] OutputStream ;

LFSR 	   UUTl(clk, enable, reset, load, Serial_Input, Serial_Output) ;

Randomizer UUTr(Serial_Output, data_in, data_out) ;

initial clk = 0;
always #5 clk = ~clk ;

integer iterator ;
initial
begin 
	enable = 1;
	reset =  1;
	load = 0 ;
	#10 ;
	reset = 0;

	InputStream = 'hACBCD2114DAE1577C6DBF4C9 ;
	for(iterator = 95 ; iterator >= 0 ; iterator = iterator - 1)
	begin
		data_in = InputStream[iterator] ;
		#10
		$display("Iteration %d , Serial Ouutput == %b", iterator, Serial_Output);
		OutputStream[iterator] = data_out ;
	end
	
	$display("Given the test sequence : %h", InputStream);
	$display("\nthe Randomizer unit produced the following sequence \n");
	$display("%h", OutputStream);
end


endmodule
