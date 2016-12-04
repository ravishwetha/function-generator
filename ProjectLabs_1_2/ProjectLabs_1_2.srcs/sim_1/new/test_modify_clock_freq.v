`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2016 15:39:57
// Design Name: 
// Module Name: test_modify_clock_freq
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


module test_modify_clock_freq(

    );
    
    reg CLOCK;
    reg [15:0] COUNT_LIMIT;
    wire PULSE;
    
    modify_clock_freq dut(CLOCK, COUNT_LIMIT, PULSE);
    
    initial begin
      CLOCK = 0;
      COUNT_LIMIT = 0;
      //COUNT_LIMIT = 16'b0000000000000001; #100;
      //COUNT_LIMIT = 16'b0000000000000010; #200;
      //COUNT_LIMIT = 16'b0000000000000100; #200;
      COUNT_LIMIT = 16'b1111111111111111; #400;
    end
    
    always begin
      #5 CLOCK = ~CLOCK;
    end
endmodule
