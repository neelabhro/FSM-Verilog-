`timescale 1ns / 1ps

module top(
	
	input clock_in,
	input clr,
	input [7:0] sw,
	input [2:0] bn,
	output [1:0] counter, 
	output LED_right,
	output LED_wrong,
	output [3:0] state
    );
    
    wire clk_pls;
    
    assign clk_pls = ( bn[0] | bn[1] | bn[2] );
    
    f_div f(clock_in, clk_out);
    
    debouncer d(clk_out, clr, clr_db);
    
    clock_pulse c(clk_pls,clk_out, clr, cln_pulse);
        
    FSM_Door fsm(cln_pulse, clr_db, bn[2:1],sw,counter,LED_right,LED_wrong, state);
    
endmodule

