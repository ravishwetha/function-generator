`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2016 14:12:20
// Design Name: 
// Module Name: modify_amplitude
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


module modify_amplitude(
    input CLOCK,
 
    input btnU,
    input btnD,
    input sw,
    
    output reg [11:0] new_DATA_A,
    output reg [11:0] MIN_AMP
    );
     
    reg [11:0] new_DATA_A = 12'hAAA;
    reg [11:0] MIN_AMP = 12'h000;
    reg [11:0] Jump_UP = 12'h111;
    reg [11:0] Jump_DN = 12'h111;
   
    always @ (posedge CLOCK) begin
    
       if(btnU & ~sw) begin
         new_DATA_A = new_DATA_A + Jump_UP;
       end
       else if(btnD & ~sw) begin
         new_DATA_A = new_DATA_A - Jump_DN;
       end
       else if(btnU & sw) begin
         MIN_AMP = MIN_AMP + Jump_UP;
       end
       else if(btnD & sw) begin
         MIN_AMP = MIN_AMP - Jump_DN;
       end
       
       if(new_DATA_A == 12'h110)
         new_DATA_A = 12'h000;
       else if(new_DATA_A == 12'hEEF)
         new_DATA_A = 12'hFFF;
       if(MIN_AMP == 12'h110)
         MIN_AMP = 12'h000;
       else if(MIN_AMP == 12'hEEF)
         MIN_AMP = 12'hFFF;
     
    end
  
endmodule
