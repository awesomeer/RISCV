
module IMEM
(    
    input   [31:0]  IADRR,
    output  [31:0]  IDATA,
    output          IWAIT,
    
    input   [31:0]  MADDR,
    inout   [31:0]  MDATA,
    input   [3:0]   MBE,
    input           MEN,
    input           MRW,
    output          MWAIT,
      
    input clk
);

    //IMEM_ROM imem_rom( .addra(IADRR[9:2]), .clka(!clk), .douta(IDATA));
    assign IWAIT = 1'b0;
    
    assign rom_en = MEN && (MADDR[31:16] == 16'h0000);
    assign MWAIT = rom_en ? 1'b0 : 1'bz;
    
    reg [31:0] ROM [0:16383];
    initial begin
        $readmemh("C:\\Users\\mithi\\Desktop\\share\\memrom.txt", ROM);
    end
    
//    wire [31:0] idata;
//    wire [31:0] mdata;   
//    assign IDATA = ROM[IADRR[15:2]];
//    assign mdata = ROM[MADDR[15:2]];

    reg [31:0] idata = 32'd0;
    reg [31:0] mdata = 32'd0;   
    always @(negedge clk) begin
        idata <= ROM[IADRR[15:2]];
        mdata <= ROM[MADDR[15:2]];
    end
    
    assign IDATA = idata;
    assign MDATA = rom_en && !MRW ? mdata : 32'hzzzzzzzz;
    

endmodule




//BASE address = 0x0003_0000
//               0x0003_FFFF
module DMEM
(
    input   [31:0]  MADDR,
    inout   [31:0]  MDATA,
    input   [3:0]   MBE,
    input           MEN,
    input           MRW,
    output          MWAIT,    
    input           clk
);
    
    wire ram_en = MEN && (MADDR[31:16] == 16'h8000);  
    
    
    wire [31:0] ram_read;
    assign MDATA = (ram_en && !MRW) ? ram_read : 32'hzzzzzzzz;
    
    wire [3:0] be = {4{ram_en && MRW}} & MBE; 
    DRAM ram(
                .addra(MADDR[15:2]),
                .clka(!clk),
                .dina(MDATA),
                .douta(ram_read),
                .ena(ram_en),
                .wea(be)
            ); 

    wire mwait = 1'b0;
    assign MWAIT = ram_en ? mwait : 1'bz;
    
    
//    reg state;
//    assign mwait = (!state && ram_en && !MRW);
    
//    initial begin
//        state <= 1'b0;
//    end
    
//    always @(posedge clk) begin
        
//        if(!state) begin
//            state <= ram_en && !MRW;
//        end
//        else begin
//            state <= 1'b0;
//        end
    
//    end
    
endmodule
