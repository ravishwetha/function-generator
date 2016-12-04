`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2016 15:19:24
// Design Name: 
// Module Name: test_myDAC
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


module test_myDAC(

    );
    
    reg CLOCK;
    reg RESET;
    
    reg btnU;
    reg btnD;
    
    wire [3:0] JA;
    wire LED;
    
    myDAC dut(CLOCK, RESET, btnU, btnD, JA, LED);
    
    initial begin
      CLOCK = 0;
      RESET = 0;
      btnU = 0;
      btnD = 0;
    end
    
    always begin
      #5 CLOCK = ~CLOCK;
    end
        
endmodule
