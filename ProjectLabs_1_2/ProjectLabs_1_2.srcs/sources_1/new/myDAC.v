`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2016 14:57:49
// Design Name: 
// Module Name: myDAC
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


module myDAC(
    input CLOCK,
    input RESET,
    
    input PS2Clk, //keyboard clock and data signals
    input PS2Data,
        
    input btnU,
    input btnD,
    input btnR,
    input btnL,
    
    input MODE_RST_SW,
    input MAXMIN_AMP_SW,
    
    output [3:0] JA,
    output LED,
    output [7:0] seg,
    
    //test keyboard
    output led1,
    output led2,
    output led3,
    output led4,
    output led5
    );
    
    wire HALF_CLOCK;
    wire DAC_CLOCK;
    wire WAVE_CLOCK;
    
    wire arrUP;
    wire arrDN;
    wire dbARRUP;
    wire dbARRDN;
    wire userU;
    wire userD;
    
    wire space;
    wire dbSPACE;
    wire userC;
    
    wire arrLF;
    wire arrRT;
    wire dbARRLF;
    wire dbARRRT;
    wire userL;
    wire userR;
    
    wire dbBTNU;
    wire dbBTND;
    wire dbBTNR;
    wire dbBTNL;
    wire dbRST;
    
    wire dbBTNU_WVE;
    wire dbBTNU_WVE;
    
    wire [23:0] FREQ_LIMIT;
    wire [23:0] FREQ_CLOCK;
    
    wire [11:0] DATA_Seed;
    wire [11:0] MIN_AMP;
    wire [11:0] DATA_A;
    
    wire [1:0] mode;
    
    //keyboard
    Keyboard KEY (CLOCK, PS2Clk, PS2Data, arrUP, arrDN, space, arrLF, arrRT); 
    
    //deboucers
    modify_clock_freq SLOW_CLK (CLOCK, 22'b1000000000000000000000, SLOW_CLOCK);
    debounce_button DBU (SLOW_CLOCK, btnU, dbBTNU);
    debounce_button DBD (SLOW_CLOCK, btnD, dbBTND);
    debounce_button DBR (SLOW_CLOCK, btnR, dbBTNR);
    debounce_button DBL (SLOW_CLOCK, btnL, dbBTNL);
    debounce_button DBC (SLOW_CLOCK, RESET, dbRST);
    
    debounce_button DBARRU (SLOW_CLOCK, arrUP, dbARRUP);
    debounce_button DBARRD (SLOW_CLOCK, arrDN, dbARRDN);
    debounce_button DBSPACE (SLOW_CLOCK, space, dbSPACE);
    debounce_button DBARRL (SLOW_CLOCK, arrLF, dbARRLF);
    debounce_button DBARRT (SLOW_CLOCK, arrRT, dbARRRT);
    
    //test keyboard
    assign led1 = dbARRUP;
    assign led2 = dbARRDN;
    assign led3 = dbSPACE;
    assign led4 = dbARRLF;
    assign led5 = dbARRRT;
     
    //clocks
    modify_clock_freq HALF_CLK (CLOCK, 16'h0001, HALF_CLOCK);
    modify_clock_freq DAC_CLK (CLOCK, 12'h100, DAC_CLOCK);
    
    //alternate user inputs
        assign userU = dbBTNU || dbARRUP;
        assign userD = dbBTND || dbARRDN;
        assign userL = dbBTNL || dbARRLF;
        assign userR = dbBTNR || dbARRRT;
        assign userC = dbRST || dbSPACE;
    
    //frequency
    modify_frequency FREQ_LMT (SLOW_CLOCK, userR, userL, FREQ_LIMIT);
    modify_clock_freq WAVE_CLK (CLOCK, FREQ_LIMIT, WAVE_CLOCK);
   
    //wave
    modify_amplitude MA (SLOW_CLOCK, userU, userD, MAXMIN_AMP_SW, DATA_Seed, MIN_AMP);
    change_mode CM (SLOW_CLOCK, userC, MODE_RST_SW, mode);  
    
    debounce_button DBU_WVE (WAVE_CLOCK, userU, dbBTNU_WVE);
    debounce_button DBD_WVE (WAVE_CLOCK, userD, dbBTND_WVE);
    generate_wave GW (WAVE_CLOCK, mode, dbBTNU_WVE, dbBTND_WVE, DATA_Seed, MIN_AMP, DATA_A);
    
    //7-seg display
    LED_7seg L7 (DAC_CLOCK, mode, seg);
    
    DA2RefComp MY_BASIC_DAC (
    .CLK(HALF_CLOCK),
    .START(DAC_CLOCK),
    .RST(RESET),
    .D1(JA[1]),
    .D2(JA[2]),
    .CLK_OUT(JA[3]),
    .nSYNC(JA[0]),
    .DATA1(DATA_A),
    .DATA2(),
    .DONE(LED)
    );
    
endmodule
