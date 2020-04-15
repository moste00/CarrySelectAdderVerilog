module Randomizer(input LFSR_data, input external_data, output data_out);

assign data_out = LFSR_data ^ external_data ;

endmodule
