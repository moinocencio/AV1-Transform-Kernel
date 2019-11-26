vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm
vlib questa_lib/msim/microblaze_v11_0_1
vlib questa_lib/msim/lmb_v10_v3_0_9
vlib questa_lib/msim/lmb_bram_if_cntlr_v4_0_16
vlib questa_lib/msim/blk_mem_gen_v8_4_3
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/mdm_v3_2_16
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/proc_sys_reset_v5_0_13
vlib questa_lib/msim/lib_pkg_v1_0_2
vlib questa_lib/msim/lib_srl_fifo_v1_0_2
vlib questa_lib/msim/axi_uartlite_v2_0_23
vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_19
vlib questa_lib/msim/fifo_generator_v13_2_4
vlib questa_lib/msim/axi_data_fifo_v2_1_18
vlib questa_lib/msim/axi_crossbar_v2_1_20
vlib questa_lib/msim/axi_protocol_converter_v2_1_19

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm
vmap microblaze_v11_0_1 questa_lib/msim/microblaze_v11_0_1
vmap lmb_v10_v3_0_9 questa_lib/msim/lmb_v10_v3_0_9
vmap lmb_bram_if_cntlr_v4_0_16 questa_lib/msim/lmb_bram_if_cntlr_v4_0_16
vmap blk_mem_gen_v8_4_3 questa_lib/msim/blk_mem_gen_v8_4_3
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap mdm_v3_2_16 questa_lib/msim/mdm_v3_2_16
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13
vmap lib_pkg_v1_0_2 questa_lib/msim/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 questa_lib/msim/lib_srl_fifo_v1_0_2
vmap axi_uartlite_v2_0_23 questa_lib/msim/axi_uartlite_v2_0_23
vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_19 questa_lib/msim/axi_register_slice_v2_1_19
vmap fifo_generator_v13_2_4 questa_lib/msim/fifo_generator_v13_2_4
vmap axi_data_fifo_v2_1_18 questa_lib/msim/axi_data_fifo_v2_1_18
vmap axi_crossbar_v2_1_20 questa_lib/msim/axi_crossbar_v2_1_20
vmap axi_protocol_converter_v2_1_19 questa_lib/msim/axi_protocol_converter_v2_1_19

vlog -work xil_defaultlib -64 -sv "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" \
"/tools/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/tools/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/tools/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v11_0_1 -64 -93 \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/f8c3/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/DCTCop/ip/DCTCop_microblaze_0_1/sim/DCTCop_microblaze_0_1.vhd" \

vcom -work lmb_v10_v3_0_9 -64 -93 \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/78eb/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/DCTCop/ip/DCTCop_dlmb_v10_1/sim/DCTCop_dlmb_v10_1.vhd" \
"../../../bd/DCTCop/ip/DCTCop_ilmb_v10_1/sim/DCTCop_ilmb_v10_1.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_16 -64 -93 \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/6335/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/DCTCop/ip/DCTCop_dlmb_bram_if_cntlr_1/sim/DCTCop_dlmb_bram_if_cntlr_1.vhd" \
"../../../bd/DCTCop/ip/DCTCop_ilmb_bram_if_cntlr_1/sim/DCTCop_ilmb_bram_if_cntlr_1.vhd" \

vlog -work blk_mem_gen_v8_4_3 -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c001/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" \
"../../../bd/DCTCop/ip/DCTCop_lmb_bram_1/sim/DCTCop_lmb_bram_1.v" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work mdm_v3_2_16 -64 -93 \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/550e/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/DCTCop/ip/DCTCop_mdm_1_1/sim/DCTCop_mdm_1_1.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" \
"../../../bd/DCTCop/ip/DCTCop_clk_wiz_1_1/DCTCop_clk_wiz_1_1_clk_wiz.v" \
"../../../bd/DCTCop/ip/DCTCop_clk_wiz_1_1/DCTCop_clk_wiz_1_1.v" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
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

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93 \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_23 -64 -93 \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/0315/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/DCTCop/ip/DCTCop_axi_uartlite_0_1/sim/DCTCop_axi_uartlite_0_1.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0 -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_19 -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/4d88/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_4 -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/1f5a/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_4 -64 -93 \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_4 -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_18 -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/5b9c/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_20 -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ace7/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" \
"../../../bd/DCTCop/ip/DCTCop_xbar_0/sim/DCTCop_xbar_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/DCTCop/sim/DCTCop.vhd" \

vlog -work axi_protocol_converter_v2_1_19 -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c83a/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" \
"../../../bd/DCTCop/ip/DCTCop_auto_pc_0/sim/DCTCop_auto_pc_0.v" \
"../../../bd/DCTCop/ip/DCTCop_auto_pc_1/sim/DCTCop_auto_pc_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

