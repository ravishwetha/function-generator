`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2016 18:08:36
// Design Name: 
// Module Name: LED_7seg
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


module LED_7seg(
    input CLOCK,
    input [1:0] mode,
    output reg [7:0] seg
    );
    
    always @ (posedge CLOCK) begin
        case(mode)
          //dp, 
          2'b11 : seg = 8'b11000000; //0 for OFF 
          2'b00 : seg = 8'b11111001; //1 for sqr
          2'b01 : seg = 8'b10100100; //2 for tri
          2'b10 : seg = 8'b10110000; //3 for sine
        endcase
    end
    
     /*
    assign an[3] = 1;
    assign an[2] = 1;
    assign an[1] = 1;
    assign an[0] = 0;
    */
    
endmodule
