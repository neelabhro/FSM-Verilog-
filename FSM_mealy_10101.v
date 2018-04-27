`timescale 1ns / 1ps

module FSM_Door(
		input clock,
		input clear,
		input [2:1] bn,
	    input [7:0] sw,
		output reg [1:0] counter,
		output reg LED_right,
		output reg LED_wrong,
		output reg [3:0] state
    );
    
    reg [3:0] present_state, next_state;
    
    parameter s0 = 4'b0000, s1 = 4'b0001, s2 = 4'b0010, s3 = 4'b0011, s4 = 4'b0100, e1 = 4'b0101, e2 = 4'b0110, e3 = 4'b0111, e4 = 4'b1000;
    

    always @(posedge clock or posedge clear)

    begin
    	if (clear == 1)

    	begin
    		present_state <= s0;
    		state <= s0;
    	end

    	else

    	begin
    		present_state <= next_state;
    		state <= next_state;
    	end

    end
        
    always @ (*)

    begin

    	case (present_state)
    		s0 : if ( bn == sw[7:6] )
    				next_state <= s1;
    			 else
    			 	next_state <= e1;
    		s1 : if ( bn == sw[5:4] )
    				next_state <= s2;
    			 else
    			 	next_state <= e2;
    		s2 : if ( bn == sw[3:2] )
    				next_state <= s3;
    			 else
    			 	next_state <= e3;
    		s3 : if ( bn == sw[1:0] )
    				next_state <= s4;
    			 else
    			 	next_state <= e4;
    		s4 : if ( bn == sw[7:6] )
    				next_state <= s1;
    			 else
    			 	next_state <= e1;

    		e1 : next_state <= e2;
    		e2 : next_state <= e3;
    		e3 : next_state <= e4;
    		e4 : if ( bn == sw[7:6] )
    				next_state <= s1;
    			 else
    			 	next_state <= e1;
    		
    		default : next_state <= s0;
    	endcase
    end
    
    always @ (*)

    begin
    	if (present_state == s4)
    	begin
    		  LED_right <= 1;
    		  LED_wrong <= 0;  
    	end

    	else if (present_state == e4)
    	begin
    		  LED_right <= 0;
    		  LED_wrong <= 1;  
    	end

        else
        begin
    		  LED_right <= 0;
    		  LED_wrong <= 0;        
    	end

    end


    always @ (LED_right)
    begin
    counter <= counter + 1;
    end
   

	
endmodule
