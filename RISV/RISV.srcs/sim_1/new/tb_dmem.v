`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2021 03:32:57 AM
// Design Name: 
// Module Name: tb_dmem
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



module double_div();

    reg [63:0] A;
    wire a_ready;
    
    reg [63:0] B;
    wire b_ready;
    
    wire [63:0] result;
    wire result_valid;
    
    reg clk;
    
    always begin
        #5 clk <= ~clk;
    end
    initial begin
        clk <= 1'b0;
        
        A <= 64'h3FF0000000000000;
        B <= 64'h3FF0000000000000;
        
        #105;
        A <= 64'h3FF8000000000000;
        B <= 64'h3FD0000000000000;
        
//        #10;
//        a_valid <= 0;
//        b_valid <= 0;
    end
    
    reg fpmul_start = 1;
    reg rst = 0;
    reg [1:0] dcon = 0;
    always @(posedge clk) begin
        if(rst) dcon <= 2'b0;
        else begin
        case(dcon)
            
            2'b00: begin
                if(fpmul_start) dcon <= 2'b01;
                else dcon <= 2'b00;
            end
            
            2'b01: begin
                if(a_ready && b_ready) dcon <= 2'b10;
                else dcon <= 2'b01;
            end
            
            2'b10: begin
                if(result_valid) dcon <= 2'b00;
                else dcon <= 2'b10;
            end
        
        endcase
        end
    end
    wire valid = dcon == 2'b01;
    wire clken = dcon != 2'b00;
    
    fpd_div fpdiv(
               .s_axis_a_tdata(A),
               .s_axis_a_tready(a_ready),
               .s_axis_a_tvalid(valid && a_ready),
               
               .s_axis_b_tdata(B),
               .s_axis_b_tready(b_ready),
               .s_axis_b_tvalid(valid && b_ready),
               
               .m_axis_result_tdata(result),
               .m_axis_result_tvalid(result_valid),
               .aclk(clk), .aclken(clken)
    ); 
    
    

endmodule

//module tb_fifo();

//    wire wr_full;
//    reg [7:0] wr_data = 8'h00;
//    reg wr_en = 0;
    
//    wire re_empty;
//    wire [7:0] re_data;
//    reg rd_en = 0;
    
//    reg clk;
//    reg rst;
    
    
    
//    FIFO fifo( 
//                .full(wr_full),
//                .din(wr_data),
//                .wr_en(wr_en),
                
//                .empty(re_empty),
//                .dout(re_data),
//                .rd_en(rd_en),
                
//                .clk(clk),
//                .rst(rst)
//             );   
              


    
//    always begin
//        #50; clk <= 1'b1;
//        #50; clk <= 1'b0;
//    end
    
//    initial begin
//        clk <= 1'b0;
//        rst <= 1'b0;
        
//        #100;
//        rst <= 1'b1;
//        #10000;
//        rst <= 1'b0;
        
//        #200;
//        wr_data <= 8'h12;
//        wr_en <= 1'b1;
        
//        repeat(16) begin
//        #100;
//        wr_data <= wr_data + 1;
//        end

        
        
//    end

//endmodule

//module tb_mul();

//    reg  clk;
//    always begin
//        clk <= 1'b0; #5; 
//        clk <= 1'b1; #5;
//    end
    
    
//    reg [31:0] rs1, rs2;
//    wire [31:0] p;
    
    
//    signed_mul ss( .CLK(clk), .A(rs1), .B(rs2), .P(p));
    
    
//    initial begin
//        rs1 <= 32'd5;
//        rs2 <= 32'd23;
//    end
    


//endmodule 


//module tb_div();

//    reg clk;
    
//    always begin
//        clk <= 1'b0;
//        #5;
//        clk <= 1'b1;
//        #5;
    
//    end
    
//    wire [31:0] div_result;
//    reg [31:0] rs1, rs2;
//    reg [2:0] f3;
//    reg start;
//    wire stall;
//    reg rst;
    
    
//    DIV div( div_result,
//             rs1,
//             rs2,
//             f3,
//             start,
//             stall,
//             rst,
//             clk
//           );
    
    
//    initial begin
    
//        rs1 <= -32'd24;
//        rs2 <= -32'd9;
//        f3 <= 3'b100;
//        start <= 1'b0;
//        rst <= 1'b1;
        
//        #200;
        
//        rst <= 1'b0;
//        start <= 1'b1;
       
//        rs1 <= 32'd16;
//        rs2 <= 32'd5;
        
        
    
//    end



//endmodule


//module tb_dmem();

//    reg [13:0] addr;
//    reg [31:0] write;
//    reg en;
//    reg clk;
//    reg [3:0] be;
    
//    wire [31:0] read;
    
//    always begin
//        #100;
//        clk <= ~clk;
//    end
    
//    initial begin
    
//        addr <= 12'd0;
//        write <= 32'h44332211;
//        en <= 1'b0;
//        clk <= 1'b0;
//        be <= 4'hf;
        
//        #50;
        
//        en <= 1'b1;
//        be <= 4'h8;
        
//        #100;
//        be <= 4'h3;
        
    
//    end
    
    
//    DRAM mem(
//                .addra(addr),
//                .clka(clk),
//                .dina(write),
//                .douta(read),
//                .ena(en),
//                .wea(be)
//            ); 


//endmodule
