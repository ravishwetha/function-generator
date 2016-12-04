`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2016 17:03:49
// Design Name: 
// Module Name: test_generate_wave
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


module test_generate_wave(

    );
    
        reg CLOCK;
        reg [1:0] mode;
        reg [11:0] CURR_AMP;
        wire [11:0] new_DATA_A;
        
        generate_wave dut(CLOCK, mode, CURR_AMP, new_DATA_A);
        
        initial begin
          CLOCK = 0;
          mode = 0;
          CURR_AMP = 12'hf45;
          
          mode = 2'b01; #100;
          mode = 2'b10; #200;
          mode = 2'b00; #300;
        end
        
        always begin
          #25000000 CLOCK = ~CLOCK;
        end
            
    endmodule