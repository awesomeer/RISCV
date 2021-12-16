`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2021 11:46:20 PM
// Design Name: 
// Module Name: tb_mul
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



module top();
    
    reg usb_rx;
    reg clk, rst;
    initial begin
        clk <= 1'b1;
        rst <= 1'b1;
        usb_rx <= 1'b1;
        #250;
        rst <= 1'b0;
    end
    
    always begin
        #5;
        clk <= ~clk;
    end
    
    reg clk_seg;
    always begin
        clk_seg <= 1'b0; #40;
        clk_seg <= 1'b1; #40;
    end
    
    
    
    reg [28:0] sw = 24'd0;
    always begin
        #5000;
        sw <= sw + 1;
    end
    
    
    wire [31:0] IADRR;
    wire [31:0] IDATA;
    wire        IWAIT;
    
    wire [31:0] MADDR;
    wire [31:0] MDATA;
    wire [3:0]  MBE;
    wire        MEN;
    wire        MRW;
    wire        MWAIT;

    
    RISCV cpu( IADRR, IDATA, IWAIT, MADDR, MDATA, MBE, MEN, MRW, MWAIT, rst, clk);
    
    IMEM imem( IADRR, IDATA, IWAIT, MADDR, MDATA, MBE, MEN, MRW, MWAIT, clk);
    
    //DROM drom(MADDR, MDATA, MBE, MEN, MRW, MWAIT, clk);
    DMEM dmem(MADDR, MDATA, MBE, MEN, MRW, MWAIT, clk);
    
    wire dp;
    wire [6:0] seg;
    wire [3:0] an;
    seg_7 segs( MADDR, MDATA, MEN, MRW, MWAIT,  {dp, seg}, an, clk);
    
    wire [23:0] io_led;
    led_24 leds( MADDR, MDATA, MEN, MRW, MWAIT, io_led, rst, clk);
    Input_sw switch( MADDR, MDATA, MEN, MRW, MWAIT, sw, rst, clk);
    
    BPP bpc( MADDR, MDATA, MEN, MRW, MWAIT, rst, clk);
    IPCP ipc( MADDR, MDATA, MEN, MRW, MWAIT, rst, clk);
    
    wire usb_tx;
    UART uart( MADDR, MDATA, MEN, MRW, MWAIT, rst, clk);
    
    DFPU dfpu( MADDR, MDATA, MEN, MRW, MWAIT, rst, cpu_clk);
    //FP_ADD ad2wt( MADDR, MDATA, MEN, MRW, MWAIT, rst, clk);
endmodule

