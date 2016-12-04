`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2016 16:18:42
// Design Name: 
// Module Name: generate_wave
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


module generate_wave(
    input DAC_CLOCK,
    input [1:0] mode,
    input btnU,
    input btnD,
    input [11:0] CURR_AMP,
    input [11:0] MIN_AMP,
    
    output reg [11:0] new_DATA_A
    );
   
    reg sqr_toggle = 0;
    reg [11:0] sqr_count = 12'HFFF;
    reg [11:0] sqr_count_def = 12'HFFF;
    
    reg tr_initiated = 0;
    reg tr_direction = 0; 
   
    integer si_i = 0;
    reg [11:0] si_val [0:31]; //01
    reg [11:0] si_valAAA [0:31]; //10
    reg [11:0] si_val555 [0:31]; //11
    reg [1:0] si_amp = 2'b10; //default AAA, 00 -> OFF
    reg [7:0] si_count = 8'hFF;
    reg [7:0] si_count_def = 8'hFF;
    
    initial begin
      si_val[0] = 12'H800;
      si_val[1] = 12'H98F;
      si_val[2] = 12'HB0F;
      si_val[3] = 12'HC71;
      si_val[4] = 12'HDA7;
      si_val[5] = 12'HEA6;
      si_val[6] = 12'HF63;
      si_val[7] = 12'HFD8;
      
      si_val[8] = 12'HFFF;
      si_val[9] = 12'HFD8;
      si_val[10] = 12'HF63;
      si_val[11] = 12'HEA6;
      si_val[12] = 12'HDA7;
      si_val[13] = 12'HC71;
      si_val[14] = 12'HB0F;
      si_val[15] = 12'H98F;
      
      si_val[16] = 12'H800;
      si_val[17] = 12'H670;
      si_val[18] = 12'H4F0;
      si_val[19] = 12'H38E;
      si_val[20] = 12'H258;
      si_val[21] = 12'H159;
      si_val[22] = 12'H09C;
      si_val[23] = 12'H027;
      
      si_val[24] = 12'H000;
      si_val[25] = 12'H027;
      si_val[26] = 12'H09C;
      si_val[27] = 12'H159;
      si_val[28] = 12'H258;
      si_val[29] = 12'H38E;
      si_val[30] = 12'H4F0;
      si_val[31] = 12'H670;
      
      //////////////////////
      
      si_valAAA[0] = 12'H555;
      si_valAAA[1] = 12'H65F;
      si_valAAA[2] = 12'H75F;
      si_valAAA[3] = 12'H84B;
      si_valAAA[4] = 12'H91A;
      si_valAAA[5] = 12'H9C4;
      si_valAAA[6] = 12'HA42;
      si_valAAA[7] = 12'HA90;
      
      si_valAAA[8] = 12'HAAA;
      si_valAAA[9] = 12'HA90;
      si_valAAA[10] = 12'HA42;
      si_valAAA[11] = 12'H9C4;
      si_valAAA[12] = 12'H91A;
      si_valAAA[13] = 12'H84B;
      si_valAAA[14] = 12'H75F;
      si_valAAA[15] = 12'H65F;
      
      si_valAAA[16] = 12'H555;
      si_valAAA[17] = 12'H44B;
      si_valAAA[18] = 12'H34B;
      si_valAAA[19] = 12'H25F;
      si_valAAA[20] = 12'H190;
      si_valAAA[21] = 12'H0E6;
      si_valAAA[22] = 12'H068;
      si_valAAA[23] = 12'H01A;
      
      si_valAAA[24] = 12'H000;
      si_valAAA[25] = 12'H01A;
      si_valAAA[26] = 12'H068;
      si_valAAA[27] = 12'H0E6;
      si_valAAA[28] = 12'H190;
      si_valAAA[29] = 12'H25F;
      si_valAAA[30] = 12'H34B;
      si_valAAA[31] = 12'H44B;
      
      //////////////////////
      
      si_val555[0] = 12'H116;
      si_val555[1] = 12'H14C;
      si_val555[2] = 12'H180;
      si_val555[3] = 12'H1B0;
      si_val555[4] = 12'H1DA;
      si_val555[5] = 12'H1FC;
      si_val555[6] = 12'H216;
      si_val555[7] = 12'H226;
      
      si_val555[8] = 12'H22B;
      si_val555[9] = 12'H226;
      si_val555[10] = 12'H216;
      si_val555[11] = 12'H1FC;
      si_val555[12] = 12'H1DA;
      si_val555[13] = 12'H1B0;
      si_val555[14] = 12'H180;
      si_val555[15] = 12'H14C;
      
      si_val555[16] = 12'H116;
      si_val555[17] = 12'H0DF;
      si_val555[18] = 12'H0AB;
      si_val555[19] = 12'H07B;
      si_val555[20] = 12'H051;
      si_val555[21] = 12'H02F;
      si_val555[22] = 12'H015;
      si_val555[23] = 12'H005;
      
      si_val555[24] = 12'H000;
      si_val555[25] = 12'H005;
      si_val555[26] = 12'H015;
      si_val555[27] = 12'H02F;
      si_val555[28] = 12'H051;
      si_val555[29] = 12'H07B;
      si_val555[30] = 12'H0AB;
      si_val555[31] = 12'H0DF;
      
    end
        
    always @ (posedge DAC_CLOCK) begin
      
      //triangle wave
      if(mode == 2'b01) begin
      
        //reset other reg
        sqr_count = sqr_count_def;
        si_i = 0;
        si_count = si_count_def;
              
        if(tr_initiated == 0) begin
          new_DATA_A = MIN_AMP;
          tr_initiated = 1;
        end
        else if(new_DATA_A == MIN_AMP | new_DATA_A == CURR_AMP) begin
          tr_direction = ~tr_direction;
        end
        
        if(tr_direction == 0)
          new_DATA_A = new_DATA_A + 12'H001;
        else
          new_DATA_A = new_DATA_A - 12'H001;
  
      end
      
      //sine wave
      else if(mode == 2'b10) begin
      
        //reset other reg 
        sqr_count = sqr_count_def;   
        tr_initiated = 0;
        tr_direction = 0;
        
        si_count = si_count + 1;
        
        if(btnU)
          si_amp = si_amp - 1;
        else if(btnD)
          si_amp = si_amp + 1;
        
        if(si_amp == 2'b01) begin
          new_DATA_A = si_val[si_i];
        end
        else if(si_amp == 2'b10) begin
          new_DATA_A = si_valAAA[si_i];
        end
        else if(si_amp == 2'b11) begin
          new_DATA_A = si_val555[si_i];
        end
        else begin
          new_DATA_A = 0;
        end
        
        if(si_count == 0) begin
          si_i = si_i + 1;
          if(si_i == 32)
            si_i = 0;
        end
      end
      
      //square wave
      else if (mode == 2'b00) begin
        
        //reset other reg 
        tr_initiated = 0;
        tr_direction = 0;
        si_i = 0;
        si_count = si_count_def;
       
        sqr_count = sqr_count + 1;
        
        if(sqr_count == 0) begin
          sqr_toggle = ~sqr_toggle;
          new_DATA_A = (sqr_toggle) ? MIN_AMP : CURR_AMP;
        end
      end
      
      //OFF
      else begin
      
        //reset other reg
        sqr_count = sqr_count_def;  
        tr_initiated = 0;
        tr_direction = 0;
        si_i = 0;
        si_count = si_count_def;
        
        new_DATA_A = 0;
      end
 
    end
    
endmodule
