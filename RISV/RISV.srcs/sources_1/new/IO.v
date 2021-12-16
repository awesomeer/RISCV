`timescale 1ns / 1ps

`include "defines.v"


module seg_7
(

    input [31:0] MADDR,
    inout [31:0] MDATA,
    //wire [3:0]  MBE;
    input       MEN,
    input       MRW,
    output      MWAIT,
    
    output  [7:0] seg,
    output  [3:0] an,
    
    
    input clk
);
    
    
    reg [31:0] seg_data;
    reg [1:0] state;
    
    initial begin
        seg_data <= 32'hFFFF_FFFF;
        state <= 2'b00;
    end
    
    always @(posedge top.clk_seg) begin
        state <= state + 1;
    end
    
    assign an = (state == 2'b00) ? 4'b1110:
                (state == 2'b01) ? 4'b1101:
                (state == 2'b10) ? 4'b1011: 4'b0111;
                
    assign seg = (state == 2'b00) ? seg_data[7:0] :
                 (state == 2'b01) ? seg_data[15:8] :
                 (state == 2'b10) ? seg_data[23:16] : seg_data[31:24];
    
    
    wire seg_en = MEN && (MADDR == 32'hFFFF_FF00);
    
    assign MWAIT = seg_en ? 1'b0 : 1'bz;
    assign MDATA = (seg_en && !MRW) ? seg_data : 32'hzzzzzzzz;
    always @(posedge clk) begin
        
        if(seg_en && MRW) begin
            seg_data <= MDATA;
        end
        
    end
    

endmodule




module led_24
(

    input [31:0] MADDR,
    inout [31:0] MDATA,
    //wire [3:0]  MBE;
    input       MEN,
    input       MRW,
    output      MWAIT,
    
    output reg [23:0] leds,
    
    input rst,
    input clk
);


    initial begin
        leds = 24'd0;
    end

    
    wire led_en = MEN && (MADDR == 32'hFFFF_FF04);
    
    assign MWAIT = led_en ? 1'b0 : 1'bz;
    assign MDATA = (led_en && !MRW) ? {8'hFF, leds} : 32'hzzzzzzzz;
    always @(posedge clk) begin
        
        if(rst) begin
            leds <= leds;//24'd0;
        end
        else if(led_en && MRW) begin
            leds <= MDATA[23:0];
        end
        
    end 
    


endmodule




module Input_sw
(
    input [31:0] MADDR,
    inout [31:0] MDATA,
    //wire [3:0]  MBE;
    input       MEN,
    input       MRW,
    output      MWAIT,
    
    input [28:0] sw,
    input         rst,
    input         clk
);




    wire sw_en = MEN && (MADDR == 32'hFFFF_FF08);
    
    assign MWAIT = sw_en ? 1'b0 : 1'bz;
    assign MDATA = (sw_en && !MRW) ? { 3'h0, sw} : 32'hzzzzzzzz;
    

endmodule


module BPP
(
    input [31:0] MADDR,
    inout [31:0] MDATA,
    //wire [3:0]  MBE;
    input       MEN,
    input       MRW,
    output      MWAIT,
    
    input         rst,
    input         clk
);

    reg [63:0] bpcc;
    initial begin
        bpcc <= 64'd0;
    end
    
    always @(posedge clk) begin
        
        if(rst) begin
            bpcc <= 64'd0;
        end
        else if(top.cpu.EXE_V && !top.cpu.mem_stall && (top.cpu.EXE_OP == `INSTR_BRANCH) && !(top.cpu.EXE_BT ^^ top.cpu.cmp_true) ) begin
            bpcc <= bpcc + 1;
        end
        
    end
    
    
    
    reg [63:0] bpc;
    initial begin
        bpc <= 64'd0;
    end
    
    always @(posedge clk) begin
        
        if(rst) begin
            bpc <= 64'd0;
        end
        else if(top.cpu.EXE_V && !top.cpu.mem_stall && (top.cpu.EXE_OP == `INSTR_BRANCH) ) begin
            bpc <= bpc + 1;
        end
        
    end
    
    
    wire bpp_en = MEN && (MADDR[31:4] == 28'hFFF_FFF1);
    
    assign MWAIT = bpp_en ? 1'b0 : 1'bz;
    
    wire [31:0] data = (!MADDR[3] && !MADDR[2]) ? bpcc[31:0]  :
                       (!MADDR[3] &&  MADDR[2]) ? bpcc[63:32] :
                       ( MADDR[3] && !MADDR[2]) ? bpc[31:0]   : bpc[63:32];
                       
    assign MDATA = bpp_en && !MRW ? data : 32'hzzzzzzzz;  
    

endmodule



module IPCP
(
    input [31:0] MADDR,
    inout [31:0] MDATA,
    //wire [3:0]  MBE;
    input       MEN,
    input       MRW,
    output      MWAIT,
    
    input         rst,
    input         clk
);
    
    reg [63:0] ipc_counter;
    initial begin
        ipc_counter <= 64'd0;
    end
    
    always @(posedge clk) begin
        
        if(rst) begin
            ipc_counter <= 64'd0;
        end
        else begin
            ipc_counter <= ipc_counter + (top.cpu.EXE_V && !top.cpu.mem_stall && top.cpu.EXE_OP == `INSTR_BRANCH)
                                       + (top.cpu.MEM_V && top.cpu.MEM_MEN && top.cpu.MEM_RW && !top.cpu.mem_stall)
                                       + (top.cpu.WR_V);
        end
        
    end
    
    
    
    reg [63:0] ticks;
    initial begin
        ticks <= 64'd0;
    end
    
    always @(posedge clk) begin
        if(rst) begin
            ticks <= 64'd0;
        end
        else begin
            ticks <= ticks + 1;
        end
    end
    
    
    wire bpp_en = MEN && (MADDR[31:4] == 28'hFFF_FFF2);
    
    assign MWAIT = bpp_en ? 1'b0 : 1'bz;
    
    wire [31:0] data = (!MADDR[3] && !MADDR[2]) ? ipc_counter[31:0]  :
                       (!MADDR[3] &&  MADDR[2]) ? ipc_counter[63:32] :
                       ( MADDR[3] && !MADDR[2]) ? ticks[31:0]        : ticks[63:32];
                       
    assign MDATA = bpp_en && !MRW ? data : 32'hzzzzzzzz;  
    

endmodule



/**********

                UART MODULE

**********/



module uart_rx 
  (
   input        i_Clock,
   input        i_Rx_Serial,
   output       o_Rx_DV,
   output [7:0] o_Rx_Byte
   );
  
  parameter CLK = 50000000;
  parameter BAUD = (115200*8);
  
  parameter CLKS_PER_BIT   = (CLK/BAUD);  
  parameter s_IDLE         = 3'b000;
  parameter s_RX_START_BIT = 3'b001;
  parameter s_RX_DATA_BITS = 3'b010;
  parameter s_RX_STOP_BIT  = 3'b011;
  parameter s_CLEANUP      = 3'b100;
   
  reg           r_Rx_Data_R = 1'b1;
  reg           r_Rx_Data   = 1'b1;
   
  reg [7:0]     r_Clock_Count = 0;
  reg [2:0]     r_Bit_Index   = 0; //8 bits total
  reg [7:0]     r_Rx_Byte     = 0;
  reg           r_Rx_DV       = 0;
  reg [2:0]     r_SM_Main     = 0;
   
  // Purpose: Double-register the incoming data.
  // This allows it to be used in the UART RX Clock Domain.
  // (It removes problems caused by metastability)
  always @(posedge i_Clock)
    begin
      r_Rx_Data_R <= i_Rx_Serial;
      r_Rx_Data   <= r_Rx_Data_R;
    end
   
   
  // Purpose: Control RX state machine
  always @(posedge i_Clock)
    begin
       
      case (r_SM_Main)
        s_IDLE :
          begin
            r_Rx_DV       <= 1'b0;
            r_Clock_Count <= 0;
            r_Bit_Index   <= 0;
             
            if (r_Rx_Data == 1'b0)          // Start bit detected
              r_SM_Main <= s_RX_START_BIT;
            else
              r_SM_Main <= s_IDLE;
          end
         
        // Check middle of start bit to make sure it's still low
        s_RX_START_BIT :
          begin
            if (r_Clock_Count == (CLKS_PER_BIT-1)/2)
              begin
                if (r_Rx_Data == 1'b0)
                  begin
                    r_Clock_Count <= 0;  // reset counter, found the middle
                    r_SM_Main     <= s_RX_DATA_BITS;
                  end
                else
                  r_SM_Main <= s_IDLE;
              end
            else
              begin
                r_Clock_Count <= r_Clock_Count + 1;
                r_SM_Main     <= s_RX_START_BIT;
              end
          end // case: s_RX_START_BIT
         
         
        // Wait CLKS_PER_BIT-1 clock cycles to sample serial data
        s_RX_DATA_BITS :
          begin
            if (r_Clock_Count < CLKS_PER_BIT-1)
              begin
                r_Clock_Count <= r_Clock_Count + 1;
                r_SM_Main     <= s_RX_DATA_BITS;
              end
            else
              begin
                r_Clock_Count          <= 0;
                r_Rx_Byte[r_Bit_Index] <= r_Rx_Data;
                 
                // Check if we have received all bits
                if (r_Bit_Index < 7)
                  begin
                    r_Bit_Index <= r_Bit_Index + 1;
                    r_SM_Main   <= s_RX_DATA_BITS;
                  end
                else
                  begin
                    r_Bit_Index <= 0;
                    r_SM_Main   <= s_RX_STOP_BIT;
                  end
              end
          end // case: s_RX_DATA_BITS
     
     
        // Receive Stop bit.  Stop bit = 1
        s_RX_STOP_BIT :
          begin
            // Wait CLKS_PER_BIT-1 clock cycles for Stop bit to finish
            if (r_Clock_Count < CLKS_PER_BIT-1)
              begin
                r_Clock_Count <= r_Clock_Count + 1;
                r_SM_Main     <= s_RX_STOP_BIT;
              end
            else
              begin
                r_Rx_DV       <= 1'b1;
                r_Clock_Count <= 0;
                r_SM_Main     <= s_CLEANUP;
              end
          end // case: s_RX_STOP_BIT
     
         
        // Stay here 1 clock
        s_CLEANUP :
          begin
            r_SM_Main <= s_IDLE;
            r_Rx_DV   <= 1'b0;
          end
         
         
        default :
          r_SM_Main <= s_IDLE;
         
      endcase
    end   
   
  assign o_Rx_DV   = r_Rx_DV;
  assign o_Rx_Byte = r_Rx_Byte;
   
endmodule // uart_rx



module uart_tx
(   
    input clk, //cpu_clk
    input start,
    output ready,
    input [7:0] data,
    output tx
);

    parameter CLK = 50000000;
    parameter BAUD = (115200*8);
    parameter RATE = ((CLK)/(2*BAUD));

// UART CLK Generation
    reg uartClk;
    reg [31:0] counter;
    initial begin
        uartClk <= 1'b0;
        counter <= 32'd0;
    end
    
    always @(posedge clk) begin
        if(counter == RATE) begin
            uartClk <= ~uartClk;
            counter <= 0;
        end
        else counter <= counter + 1;
    end
//END UART CLK Generation
    
    parameter [3:0] TX_IDLE = 4'h0,
                    TX_START = 4'h1,
                    TX_LOOP = 4'h2,
                    TX_STOP = 4'h3;
    
    reg [3:0] state, n_state;
    
    reg [3:0] dataCount, n_dataCount;
    
    reg [9:0] tx_shift, n_tx_shift;
    
    initial begin
        state <= TX_IDLE;
        n_state <= TX_IDLE;
        
        dataCount <= 0;
        n_dataCount <= 0;
        
        tx_shift <= 10'b0000000001;
        n_tx_shift <= 10'b0000000001;
    end
    
    assign tx = tx_shift[0];
    assign ready = state == TX_IDLE;
    
    always @(*) begin
        case(state)
            TX_IDLE: begin
                if(start) n_state <= TX_START;
                else n_state <= TX_IDLE;
                
                n_tx_shift <= tx_shift;
                n_dataCount <= dataCount;
            end
            TX_START: begin
                n_tx_shift <= {data, 2'b01};
                n_dataCount <= 4'h0;
                n_state <= TX_LOOP;
            end
            TX_LOOP: begin
                if(dataCount == 4'd10) begin
                    n_tx_shift <= tx_shift;
                    n_dataCount <= dataCount;
                    n_state <= TX_STOP;
                end
                else begin
                    n_tx_shift <= {1'b1, tx_shift[9:1]};
                    n_dataCount <= dataCount + 1;
                    n_state <= TX_LOOP;
                end
            end
            TX_STOP: begin
                if(start) n_state <= TX_STOP;
                else n_state <= TX_IDLE;
                
                n_tx_shift <= tx_shift;
                n_dataCount <= dataCount;
            end
            default begin
                n_state <= state;
                n_tx_shift <= tx_shift;
                n_dataCount <= dataCount;
            end
        endcase
    end
    
    always @(posedge uartClk) begin
        state <= n_state;
        dataCount <= n_dataCount;
        tx_shift <= n_tx_shift;
    end
    
    
endmodule

//BASE ADDRESS = 0x0000_00030
module UART
(
    input [31:0] MADDR,
    inout [31:0] MDATA,
    //wire [3:0]  MBE;
    input       MEN,
    input       MRW,
    output      MWAIT,
    
    input         rst,
    input         clk
);

    wire uart_en = MEN && (MADDR[31:3] == 29'h1FFF_FFE6);
    
    /****** UART RX ******/
    
    wire rx_full;
    wire [7:0] rx_data;
    wire rx_byte;
    
    
    wire rx_empty; // 1 - data avail 0 - no data
    wire [7:0] rx_out;
    wire rx_read = uart_en && !MRW && (MADDR[2] == 1'b1); 
    FIFO_FWFT rx_fifo( 
            .full(rx_full),
            .din(rx_data),
            .wr_en(rx_byte && !rx_full),
            
            .empty(rx_empty),
            .dout(rx_out),
            .rd_en(rx_read),
            
            .clk(clk),
            .rst(rst)
         );    
    
    uart_rx rx(clk, top.usb_rx, rx_byte, rx_data);
    /****** UART TX ******/    

    wire wr_full; //TX buffer full
    wire wr_en = uart_en && MRW && MADDR[2] == 1'b1;
    
    wire rd_empty;
    wire [7:0] fifo_read;
    wire rd_en;
    
    FIFO tx_fifo( 
            .full(wr_full),
            .din(MDATA[7:0]),
            .wr_en(wr_en),
            
            .empty(rd_empty),
            .dout(fifo_read),
            .rd_en(rd_en),
            
            .clk(clk),
            .rst(rst)
         );   
    
    
    reg [1:0] state;
    reg ustart;
    wire uready;
    initial begin
        state <= 3'd0;
    end
    
    assign rd_en = (state == 3'd0) && !rd_empty;
    always @(posedge clk) begin
    
        if(rst) begin
            ustart <= 1'b0;
            state <= 3'd0;
        end
        else begin
        
            case(state)
            
            2'd0: begin
                if(rd_empty) begin
                    ustart <= 1'b0;
                    state <= 3'd0;
                end
                else begin
                    ustart <= 1'b1;
                    state <= 3'd1;
                end
            end
            
            2'd1: begin
                
                if(uready) begin
                    ustart <= 1'b1;
                    state <= 3'd1;
                end
                else begin
                    ustart <= 1'b0;
                    state <= 3'd2;
                end
                
            end
            
            2'd2: begin
                
                if(uready) state <= 3'd0;
                else state <= 3'd2;
                
            end
            
            default: begin
                ustart <= 1'b0;
                state <= 3'd0;
            end
            endcase
        
        end
    end
    
    uart_tx tx(clk, ustart, uready, fifo_read, top.usb_tx);
    

    /******* MEMORY ACCESS ******/

    assign MWAIT = uart_en ? 1'b0 : 1'bz;
    //wire [31:0] readdata = (MADDR[2] == 1'b0) ? {30'd0, wr_full, 1'b0} : {32'd0};
    wire [31:0] readdata = (MADDR[2] == 1'b0) ? {29'd0, !rx_empty, wr_full, 1'b0} : {24'd0, rx_out}; 
    
    assign MDATA = uart_en && !MRW ? readdata : 32'hzzzzzzzz;
    


endmodule




module DFPU
(
    input [31:0] MADDR,
    inout [31:0] MDATA,
    //wire [3:0]  MBE;
    input       MEN,
    input       MRW,
    output      MWAIT,
    
    input         rst,
    input         clk
);

    parameter DMUL = 2'b00;
    parameter DDIV = 2'b01;
    parameter DADD = 2'b10;
    parameter DCMP = 2'b11;

    wire fpmul_en = MEN && (MADDR[31:5] == 27'h7FF_FFFB);
    assign MWAIT = fpmul_en ? 1'b0 : 1'bz;
    
    reg [31:0] al;
    reg [31:0] ah;
    reg [31:0] bl;
    reg [31:0] bh;
    reg [1:0]  mode;
    
    always @(posedge clk) begin
        
        if(rst) begin
            al <= 32'd0;
            ah <= 32'd0;
            bl <= 32'd0;
            bh <= 32'd0;
            mode <= 2'd0;
        end
        else begin
            
            if(fpmul_en && MRW && MADDR[4:0] == 5'h00) al <= MDATA;
            if(fpmul_en && MRW && MADDR[4:0] == 5'h04) ah <= MDATA;
            if(fpmul_en && MRW && MADDR[4:0] == 5'h08) bl <= MDATA;
            if(fpmul_en && MRW && MADDR[4:0] == 5'h0C) bh <= MDATA;
            if(fpmul_en && MRW && MADDR[4:0] == 5'h18) mode <= MDATA[3:2];
        end
    end
    
    
    wire fpmul_start = (fpmul_en && MRW && (MADDR[4:0] == 5'h18) && MDATA[0]);
    
    wire a_ready;
    wire b_ready;
    wire [3:0] fresult_v;
    
    reg [1:0] dcon;
    always @(posedge clk) begin
        if(rst) dcon <= 2'b0;
        else begin
        case(dcon)
            
            2'b00: begin
                if(fpmul_start) dcon <= 2'b01;
                else dcon <= 2'b00;
            end
            
            2'b01: begin
                if( (mode != DDIV) || (a_ready && b_ready) ) dcon <= 2'b10;
                else dcon <= 2'b01;
            end
            
            2'b10: begin
                if(|fresult_v) dcon <= 2'b00;
                else dcon <= 2'b10;
            end
            
            default: begin
                dcon <= 2'b00;
            end
        
        endcase
        end
    end
    
    wire valid = dcon == 2'b01;
    wire clken = dcon != 2'b00;
    wire [63:0] dmul_result;
    fpd_mul fpmul(
                       .s_axis_a_tdata( {ah,al} ),
                       .s_axis_a_tvalid(valid),
                       
                       .s_axis_b_tdata( {bh,bl} ),
                       .s_axis_b_tvalid(valid),
                       
                       .m_axis_result_tdata(dmul_result),
                       .m_axis_result_tvalid(fresult_v[DMUL]),
                       .aclk(clk), .aclken(clken && (mode == DMUL))
                    );
                    
    wire [63:0] ddiv_result;
    fpd_div fpdiv(
                       .s_axis_a_tdata( {ah,al} ),
                       .s_axis_a_tready(a_ready),
                       .s_axis_a_tvalid(valid && a_ready),
                       
                       .s_axis_b_tdata( {bh,bl} ),
                       .s_axis_b_tready(b_ready),
                       .s_axis_b_tvalid(valid && b_ready),
                       
                       .m_axis_result_tdata(ddiv_result),
                       .m_axis_result_tvalid(fresult_v[DDIV]),
                       .aclk(clk), .aclken(clken && (mode == DDIV))
                    );
    
    wire [63:0] dadd_result;
    fpd_add fpadd(
                       .s_axis_a_tdata( {ah,al} ),
                       .s_axis_a_tvalid(valid),
                       
                       .s_axis_b_tdata( {bh,bl} ),
                       .s_axis_b_tvalid(valid),
                       
                       .m_axis_result_tdata(dadd_result),
                       .m_axis_result_tvalid(fresult_v[DADD]),
                       .aclk(clk), .aclken(clken && (mode == DADD))
                    );
    
    wire [7:0] dcmp_result;
    fpd_cmp fpcmp(
                       .s_axis_a_tdata( {ah,al} ),
                       .s_axis_a_tvalid(valid),
                       
                       .s_axis_b_tdata( {bh,bl} ),
                       .s_axis_b_tvalid(valid),
                       
                       .m_axis_result_tdata(dcmp_result),
                       .m_axis_result_tvalid(fresult_v[DCMP]),
                       .aclk(clk), .aclken(clken && (mode == DCMP))
                    );
    
    reg [63:0] fresult;
    always @(posedge clk) begin
        if(rst) fresult <= 64'd0;
        else if(|fresult_v) fresult <= (mode == 2'b00) ? dmul_result : 
                                       (mode == 2'b01) ? ddiv_result :
                                       (mode == 2'b10) ? dadd_result : {24'd0, dcmp_result};
    end
    
    
    wire [31:0] readata = (MADDR[4:0] == 5'h10) ? fresult[31:0]  : 
                          (MADDR[4:0] == 5'h14) ? fresult[63:32] : {28'd0, mode, clken, 1'b0};
    
    assign MDATA = (fpmul_en && !MRW) ? readata : 32'hzzzzzzzz;
    

endmodule



