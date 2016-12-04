`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2016 16:27:17
// Design Name: 
// Module Name: debounce_button
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


module debounce_button(
    input SLOW_CLOCK,
    input btn,
    output debounced_btn
    );
    
    wire Q1;
    wire Q2;
    
    my_dff dff1 (SLOW_CLOCK, btn, Q1);
    my_dff dff2 (SLOW_CLOCK, Q1, Q2);
    assign debounced_btn = Q1 & ~Q2;
    
endmodule
