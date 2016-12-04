`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2016 13:42:33
// Design Name: 
// Module Name: square_wave
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


module square_wave(
    input CLOCK,
    input [11:0] MIN_AMP,
    input [11:0] CURR_AMP,
    output reg [11:0] OUT
    );
    
    reg sqr_toggle = 0;
    
    always @ (posedge CLOCK) begin
        sqr_toggle = ~sqr_toggle;
        OUT = (sqr_toggle) ? MIN_AMP : CURR_AMP;
    end
    
endmodule
