`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2017 08:15:43 PM
// Design Name: 
// Module Name: frequency_divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module f_div(
    input clock_in,
    output clock_out
    );
    
    parameter width = 18;
    reg [width-1:0] count;
    always @(posedge clock_in)
    begin
    	count = count + 1;
    end
    
    assign clock_out = count[width - 1];
endmodule
