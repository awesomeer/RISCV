// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat Sep  4 22:07:35 2021
// Host        : LAPTOP-CCFS063F running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/mithi/RISV/RISV.gen/sources_1/ip/FIFO_FWFT/FIFO_FWFT_sim_netlist.v
// Design      : FIFO_FWFT
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tftg256-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "FIFO_FWFT,fifo_generator_v13_2_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_5,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module FIFO_FWFT
   (clk,
    rst,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 core_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME core_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0" *) input clk;
  input rst;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;

  wire clk;
  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_en;
  wire rst;
  wire wr_en;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [10:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [10:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "1" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "11" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "6" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "4" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "2kx9" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "2047" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "2046" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "11" *) 
  (* C_RD_DEPTH = "2048" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "11" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "11" *) 
  (* C_WR_DEPTH = "2048" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "11" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  FIFO_FWFT_fifo_generator_v13_2_5 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(clk),
        .data_count(NLW_U0_data_count_UNCONNECTED[10:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[10:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(rst),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(1'b0),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[10:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
SFoQ2tXDMrL2nCJbfpmHXuteJlKaWDWl3o9OY1miFvmYb8EDywmDpLUHQktJ/VoW+17fK5WHgFVI
FZV1B91GDQ==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
mxGWDRjEAsKmBqldxevT1RKZvqK7vn0KlTODVXNGlRcGf9zOAmj0Z7Ppu79POBDb8oNQyCY+2q1q
BddzhQfh5WLIVX9BNUMIF6M6IF0elM4GMSLHGeYEwqSaMPC+thuR8FGj1J7z6rH+43gDYhtIeyY+
ZuZUz/Pqg8Lu63Xwe+0=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HLwPjQzkuqv5FEDBriEJS2DikBeIHB/bWuVWooHY5ChdoHatcmqCHpSvnGxVzLwObZWHFys2nR9y
P3zxywjtgtOWq/n3cYVa5li6eyiUmGXv2OE8nw1nLnAY1kzBvGd6VwQ45t6l4Hx5+oqpIfuU2KI2
7/Qpj2atiTN3Y+q5He/BMXLIxF9vWuU6XL/+HsxriGAumcZDuESdidlxOztbW1bFhYr1/qWwou2q
wynnRVKYHL41aWycgFdkDoDEFFxv8ft8+F5Ux+J5Hg5XdgRULJc6uUQE/lDG3zOqzPftlODB52zU
d0cm8gFOvSZ2nO8ZB8THnxoAGe33iIZJfMcefA==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jlR0iZ4fp9QXiFgaT07DMAK1YFLyBpsOGOOR9j2PWImFEh8oTBt4cvmGo+2z1Umbt9OMQwOhyepO
QIsKLFzUXYUba+SFFLBoCiaww24KICecbUfd3VV5sg2bEJjAdtYTT6mJqyc3vQRvBlONeBFdIGy2
AXqdK7QtXGLsLAIF/z4FG8cfG6nSD6e16gccBC6+kl5MoShdnmebKLyoo6UKFdMbDK88sHvTcD9S
LNCau6RK7FkTZg23FV0tf6cTP9Rray9YEcowm2AAh51Wldo2lGJ2W5iiDatRKH/W1bu7FGWZG+OT
+VZE+Ckiuf4T6cuu+G5IbrtMv6a4U93R0gtxXQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
p/kq+JjPPJbOTWT2SRiPJ99/iH6kkVGEiluRRXpuRN+j+cVPgJD1v4QVjw3zMWLlvTGB7OOqC+JG
Lc62Wiizd/BFfGj2JYkTZMatcOWok7A87HK+vRTjr4nZMApD2jKaneJdU1279KsIEeRfImCQ2uRl
QRNMH3PPdNGYCnOGgNk=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kyyI/O29YYc5VBwhz19i7AV7MC75r43hHVKAOTBiGBhRu8zZxCwGGcNFqc2HgHcWC6nq4jCIbIXf
S3FDzPdasegnERlWvoob9/SXM88zKsyeTbUf+DRu5lB8SPROBMaIhnj375C5XLowL17MXZdmB6fV
X5ukCg7cNhCjssKt/bIJibWkfna7hvj4ye+CLWmi3LdEiix8KTwRoBS3ZJrjM4/N6FfZkXerVxs+
txkhdsmG9ga1g/xErhTRilhqrV2WetlpX86qH/64sRGVxrWeEfNoHhMZsqEK0jWDx4WavKt8XY7W
NDzMXLZ2m5Dv5HMiJWgFG+ntPwgiYYtBuwu7Eg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tv6UL1ZWqo3dAIlhN5UTNGzJyqzdHpCqh217JPvIvHiWJgcFh2tw1n7HWnOPcK3VhCt31AGnCEFe
HpTiinXvHna65L2X2HhtNUrsgvZlUuh/oQR273wp5JPFDPD97NQ4ELkGI+w26HTYLgZ70K5rQo87
D4AkQNRuzTRS5G12yb4RU7ZYgmkYLuq1UyqjlxyN62Del4XoqZyivOGw5H+7wlfkNRu98iQwqq12
jthZbH/ue5wxZJUcb7NmEwL+3abpyDNmWs1qORHOFoE3t97/9XMmeSCpM2+KnSKJvsV5VbuoTCOT
964fsEh7ey4IVb4aum095gQjLCqTmDm8DWFmaw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Oxo3AgNmVWgrXtMKDIThYfXr0YJfyFr7Bsjn2ge/G72mb25MA8Dbkd9ZZPtwqU1poazNnTng5Cx5
s8C1zMNEoo38jNY8zEUBjCCuasJgeMo5xsiha+3ZIBiuHS0KLrjLaPFIQZdsYevb44fg6J5YQLn5
jd1M6YdNMd1VwSezDxtbk9sN8ExPrmtwum/6L1ia9j9UlIzPTEaJ60Xz7tloPsgsbkborO2JLiIk
kIAY2q1b8tuhHzJ5DoXlvIo49wSDj75ncLrkwbAd26huob7aOmX1bS34pJLF17JzqYH0MoPJbHxb
RPdD+qUawXFsMSs2fOLnZrNxeG8L+TyAT0N8tQ==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
CIR/vwxo0IBrPr5+bMp2YuBCQTNBRIIbqgEB18Oewkc8CuHzGCAgPyQUBUKaUG3bBy+KDOPVxBP5
cE/d3QYZAT11fyB1OMMTrjmEIZcr0Vk3nVTAnivoxxxkmdzPjkj0OcGcU9fMArPi3dfTgIsKdtCq
94+mV/70WeprgijzuZFWD7uH+gVioY/+rq/Wc1O6x1n949w8YGgSCTurUvhsobx2bonoC317J0Wm
IX17XRkSBIFgzqA8iC+GV5oCfxIGkihKmXxjIJbMamlOdCOycEkjkh3JYmm7TLNxmI65iffsabR0
t5+iI0l8eJxFhElzWeREqE43cnJYLaKZBUA+DA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 52256)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
