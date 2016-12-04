`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2016 13:23:59
// Design Name: 
// Module Name: modify_frequency
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


module modify_frequency(
    input CLOCK,
    input btnR,
    input btnL,
    
    output reg [23:0] FREQ_LIMIT
    );
    
    reg [23:0] FREQ_LIMIT = 24'h001000;
    
    always @ (posedge CLOCK) begin
        
      if(btnL) begin
        FREQ_LIMIT = FREQ_LIMIT << 1;
        if(FREQ_LIMIT == 24'h000000)
          FREQ_LIMIT = 24'h000100;
      end
            
      if(btnR) begin
        FREQ_LIMIT = FREQ_LIMIT >> 1;
        if(FREQ_LIMIT == 24'h000010)
          FREQ_LIMIT = 24'h100000;
      end
         
    end
    
endmodule
