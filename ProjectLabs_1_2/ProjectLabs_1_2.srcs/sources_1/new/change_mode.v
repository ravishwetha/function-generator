`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2016 16:50:34
// Design Name: 
// Module Name: change_mode
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


module change_mode(
    input CLOCK, 
    input btnC,
    input sw,
    
    output reg [1:0] mode
    );
    
    reg [1:0] mode = 2'b00;
    
    always @ (posedge CLOCK) begin
      if(btnC & sw) begin
        mode = mode + 1;
      end
    end
    
endmodule
