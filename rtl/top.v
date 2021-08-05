`timescale 1ns / 1ps



module top
(
    input clk,
    input irst,
    input center,
    
    output [23:0] io_led,
    input  [23:0] sw,
    
    output [3:0] an,
    output [6:0] seg,
    output dp,
    
    output usb_tx,
    
    output [7:0] led
);
    wire rst = !irst;
    
    wire cpu_clk;
    CLK_PLL clk_pll(.clk_in(clk), .clk_out(cpu_clk), .reset(center));
    
    reg [31:0] counter;
    initial begin
        counter <= 32'd0;
    end
    always @(posedge cpu_clk) begin
        counter <= counter + 1;
    end
    
    wire clk_seg = counter[17];    
    
    wire [31:0] IADRR;
    wire [31:0] IDATA;
    wire        IWAIT;
    
    wire [31:0] MADDR;
    wire [31:0] MDATA;
    wire [3:0]  MBE;
    wire        MEN;
    wire        MRW;
    wire        MWAIT;


    RISCV cpu( IADRR, IDATA, IWAIT, MADDR, MDATA, MBE, MEN, MRW, MWAIT, rst, cpu_clk);
    
    IMEM imem( IADRR, IDATA, IWAIT, cpu_clk);
    DROM drom( MADDR, MDATA, MBE, MEN, MRW, MWAIT, cpu_clk);
    DMEM dmem( MADDR, MDATA, MBE, MEN, MRW, MWAIT, cpu_clk);
    
    seg_7 segs( MADDR, MDATA, MEN, MRW, MWAIT,  {dp, seg}, an, cpu_clk);
    
    led_24 leds( MADDR, MDATA, MEN, MRW, MWAIT, io_led, rst, cpu_clk);
    Input_sw switch( MADDR, MDATA, MEN, MRW, MWAIT, sw, rst, cpu_clk);
    
    

    BPP bpc( MADDR, MDATA, MEN, MRW, MWAIT, rst, cpu_clk);
    IPCP ipc( MADDR, MDATA, MEN, MRW, MWAIT, rst, cpu_clk);
    UART uart( MADDR, MDATA, MEN, MRW, MWAIT, rst, cpu_clk);
    
    assign led[0] = uart.wr_full;
    assign led[1] = uart.rd_empty;

endmodule
