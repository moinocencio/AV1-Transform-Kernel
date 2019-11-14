-makelib xcelium_lib/xil_defaultlib -sv \
  "/tools/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/tools/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/tools/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/microblaze_v11_0_1 \
  "../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/f8c3/hdl/microblaze_v11_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/DCTCop/ip/DCTCop_microblaze_0_1/sim/DCTCop_microblaze_0_1.vhd" \
-endlib
-makelib xcelium_lib/lmb_v10_v3_0_9 \
  "../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/78eb/hdl/lmb_v10_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/DCTCop/ip/DCTCop_dlmb_v10_1/sim/DCTCop_dlmb_v10_1.vhd" \
  "../../../bd/DCTCop/ip/DCTCop_ilmb_v10_1/sim/DCTCop_ilmb_v10_1.vhd" \
-endlib
-makelib xcelium_lib/lmb_bram_if_cntlr_v4_0_16 \
  "../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/6335/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/DCTCop/ip/DCTCop_dlmb_bram_if_cntlr_1/sim/DCTCop_dlmb_bram_if_cntlr_1.vhd" \
  "../../../bd/DCTCop/ip/DCTCop_ilmb_bram_if_cntlr_1/sim/DCTCop_ilmb_bram_if_cntlr_1.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_3 \
  "../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c001/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/DCTCop/ip/DCTCop_lmb_bram_1/sim/DCTCop_lmb_bram_1.v" \
-endlib
-makelib xcelium_lib/axi_lite_ipif_v3_0_4 \
  "../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/mdm_v3_2_16 \
  "../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/550e/hdl/mdm_v3_2_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/DCTCop/ip/DCTCop_mdm_1_1/sim/DCTCop_mdm_1_1.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/DCTCop/ip/DCTCop_clk_wiz_1_1/DCTCop_clk_wiz_1_1_clk_wiz.v" \
  "../../../bd/DCTCop/ip/DCTCop_clk_wiz_1_1/DCTCop_clk_wiz_1_1.v" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/DCTCop/ip/DCTCop_rst_clk_wiz_1_100M_1/sim/DCTCop_rst_clk_wiz_1_100M_1.vhd" \
  "../../../bd/DCTCop/ipshared/7098/src/DCT16_1_I.vhd" \
  "../../../bd/DCTCop/ipshared/7098/src/DCT16_2_I.vhd" \
  "../../../bd/DCTCop/ipshared/7098/src/DCT32_1_I.vhd" \
  "../../../bd/DCTCop/ipshared/7098/src/DCT32_2_I.vhd" \
  "../../../bd/DCTCop/ipshared/7098/src/DCT4_I.vhd" \
  "../../../bd/DCTCop/ipshared/7098/src/DCT64_1_I.vhd" \
  "../../../bd/DCTCop/ipshared/7098/src/DCT64_2_I.vhd" \
  "../../../bd/DCTCop/ipshared/7098/src/DCT8_1_I.vhd" \
  "../../../bd/DCTCop/ipshared/7098/src/DCT8_2_I.vhd" \
  "../../../bd/DCTCop/ipshared/7098/src/DCT_Wrapper.vhd" \
  "../../../bd/DCTCop/ipshared/7098/hdl/DCTs_v1_0_S00_AXI.vhd" \
  "../../../bd/DCTCop/ipshared/7098/hdl/DCTs_v1_0.vhd" \
  "../../../bd/DCTCop/ip/DCTCop_DCTs_0_1/sim/DCTCop_DCTs_0_1.vhd" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_19 \
  "../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/4d88/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_4 \
  "../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/1f5a/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_4 \
  "../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_4 \
  "../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_18 \
  "../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/5b9c/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_crossbar_v2_1_20 \
  "../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ace7/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/DCTCop/ip/DCTCop_xbar_1/sim/DCTCop_xbar_1.v" \
-endlib
-makelib xcelium_lib/lib_pkg_v1_0_2 \
  "../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_srl_fifo_v1_0_2 \
  "../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_uartlite_v2_0_23 \
  "../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/0315/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/DCTCop/ip/DCTCop_axi_uartlite_0_1/sim/DCTCop_axi_uartlite_0_1.vhd" \
  "../../../bd/DCTCop/sim/DCTCop.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

