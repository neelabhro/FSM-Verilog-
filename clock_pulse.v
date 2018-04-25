`timescale 1ns / 1ps


module clock_pulse(
	input inp,
	input clk,
	input clr,
	output out
    );

    reg d1,d2,d3;
    
    always @(posedge clk or posedge clr)

    begin

    	if (clr == 1)

    	begin
    		d1 <= 1'b0;
    		d2 <= 1'b0;
    		d3 <= 1'b0;
    	end
    	
    	else

    	begin
    		d1 <= inp;
    		d2 <= d1;
    		d3 <= ~d2;
    	end

    end
    
    assign out = (d1 & d2 & d3); 

endmodule
