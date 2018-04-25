`timescale 1ns / 1ps

module debouncer(
    input clock_in,
    input clear_in,
    output clear_out
    );
    
    reg a, b, c;
    always @(posedge clock_in)
    begin
    	a <= clear_in;
    	b <= a;
    	c <= b;
    end
    
    assign clear_out = ( a && b && c );
endmodule
