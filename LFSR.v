module LFSR(input clk, input enable, input async_reset, input load, input data_in, output reg data_out );

reg [15:1] data ;

always @(posedge clk or async_reset)
begin
	if(async_reset) data = 'b 101010001110110 ; 
	else if(enable)
	begin
		casex( load )
			'b 0 :
			begin
				data[15:2] <= data[14:1] ;
				data[1]    <= data[14] ^ data[15] ;
				data_out   <= data[1] ;
			end
			
			'b 1 :
			begin
				data[15:2] <= data[14:1] ;
				data[1]    <= data_in ;
				data_out   <= 'bx ;
			end
		
		endcase
	end 
end

endmodule 