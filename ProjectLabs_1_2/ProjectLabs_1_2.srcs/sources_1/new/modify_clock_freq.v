`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2016 14:38:41
// Design Name: 
// Module Name: modify_clock_freq
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


module modify_clock_freq(
    input CLOCK,
    input [25:0] COUNT_LIMIT,
    output PULSE
    );
    
    reg [25:0] COUNT = 0;
    reg PULSE = 0;
    
    always @ (posedge CLOCK) begin
      COUNT = COUNT + 1;
      if(COUNT == COUNT_LIMIT) begin
        if(PULSE == 0)
          PULSE <= 1;
        else
          PULSE <= 0;
          
        COUNT = 0;
      end
    end
    
endmodule
