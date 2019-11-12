vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/microblaze_v11_0_1
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/lmb_v10_v3_0_9
vlib questa_lib/msim/lmb_bram_if_cntlr_v4_0_16
vlib questa_lib/msim/blk_mem_gen_v8_4_3
vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_19
vlib questa_lib/msim/fifo_generator_v13_2_4
vlib questa_lib/msim/axi_data_fifo_v2_1_18
vlib questa_lib/msim/axi_crossbar_v2_1_20
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/axi_intc_v4_1_13
vlib questa_lib/msim/xlconcat_v2_1_3
vlib questa_lib/msim/mdm_v3_2_16
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/proc_sys_reset_v5_0_13
vlib questa_lib/msim/util_vector_logic_v2_0_1

vmap microblaze_v11_0_1 questa_lib/msim/microblaze_v11_0_1
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap lmb_v10_v3_0_9 questa_lib/msim/lmb_v10_v3_0_9
vmap lmb_bram_if_cntlr_v4_0_16 questa_lib/msim/lmb_bram_if_cntlr_v4_0_16
vmap blk_mem_gen_v8_4_3 questa_lib/msim/blk_mem_gen_v8_4_3
vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_19 questa_lib/msim/axi_register_slice_v2_1_19
vmap fifo_generator_v13_2_4 questa_lib/msim/fifo_generator_v13_2_4
vmap axi_data_fifo_v2_1_18 questa_lib/msim/axi_data_fifo_v2_1_18
vmap axi_crossbar_v2_1_20 questa_lib/msim/axi_crossbar_v2_1_20
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap axi_intc_v4_1_13 questa_lib/msim/axi_intc_v4_1_13
vmap xlconcat_v2_1_3 questa_lib/msim/xlconcat_v2_1_3
vmap mdm_v3_2_16 questa_lib/msim/mdm_v3_2_16
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13
vmap util_vector_logic_v2_0_1 questa_lib/msim/util_vector_logic_v2_0_1

vcom -work microblaze_v11_0_1 -64 -93 \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/f8c3/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/DCTCop/ip/DCTCop_microblaze_0_0/sim/DCTCop_microblaze_0_0.vhd" \
"../../../bd/DCTCop/ipshared/2e5f/src/DCT16_1_I.vhd" \
"../../../bd/DCTCop/ipshared/2e5f/src/DCT16_2_I.vhd" \
"../../../bd/DCTCop/ipshared/2e5f/src/DCT32_1_I.vhd" \
"../../../bd/DCTCop/ipshared/2e5f/src/DCT32_2_I.vhd" \
"../../../bd/DCTCop/ipshared/2e5f/src/DCT4_I.vhd" \
"../../../bd/DCTCop/ipshared/2e5f/src/DCT64_1_I.vhd" \
"../../../bd/DCTCop/ipshared/2e5f/src/DCT64_2_I.vhd" \
"../../../bd/DCTCop/ipshared/2e5f/src/DCT8_1_I.vhd" \
"../../../bd/DCTCop/ipshared/2e5f/src/DCT8_2_I.vhd" \
"../../../bd/DCTCop/ipshared/2e5f/src/DCT_Wrapper.vhd" \
"../../../bd/DCTCop/ipshared/2e5f/hdl/DCTs_v1_0_S00_AXI.vhd" \
"../../../bd/DCTCop/ipshared/2e5f/hdl/DCTs_v1_0.vhd" \
"../../../bd/DCTCop/ip/DCTCop_DCTs_0_0/sim/DCTCop_DCTs_0_0.vhd" \

vcom -work lmb_v10_v3_0_9 -64 -93 \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/78eb/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/DCTCop/ip/DCTCop_dlmb_v10_0/sim/DCTCop_dlmb_v10_0.vhd" \
"../../../bd/DCTCop/ip/DCTCop_ilmb_v10_0/sim/DCTCop_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_16 -64 -93 \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/6335/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/DCTCop/ip/DCTCop_dlmb_bram_if_cntlr_0/sim/DCTCop_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/DCTCop/ip/DCTCop_ilmb_bram_if_cntlr_0/sim/DCTCop_ilmb_bram_if_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_3 -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c001/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" \
"../../../bd/DCTCop/ip/DCTCop_lmb_bram_0/sim/DCTCop_lmb_bram_0.v" \

vlog -work generic_baseblocks_v2_1_0 -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0 -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_19 -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/4d88/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_4 -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/1f5a/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_4 -64 -93 \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_4 -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_18 -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/5b9c/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_20 -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ace7/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" \
"../../../bd/DCTCop/ip/DCTCop_xbar_0/sim/DCTCop_xbar_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work axi_intc_v4_1_13 -64 -93 \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c0fe/hdl/axi_intc_v4_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/DCTCop/ip/DCTCop_microblaze_0_axi_intc_0/sim/DCTCop_microblaze_0_axi_intc_0.vhd" \

vlog -work xlconcat_v2_1_3 -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" \
"../../../bd/DCTCop/ip/DCTCop_microblaze_0_xlconcat_0/sim/DCTCop_microblaze_0_xlconcat_0.v" \

vcom -work mdm_v3_2_16 -64 -93 \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/550e/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/DCTCop/ip/DCTCop_mdm_1_0/sim/DCTCop_mdm_1_0.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" \
"../../../bd/DCTCop/ip/DCTCop_clk_wiz_1_0/DCTCop_clk_wiz_1_0_clk_wiz.v" \
"../../../bd/DCTCop/ip/DCTCop_clk_wiz_1_0/DCTCop_clk_wiz_1_0.v" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/DCTCop/ip/DCTCop_rst_clk_wiz_1_100M_0/sim/DCTCop_rst_clk_wiz_1_100M_0.vhd" \

vlog -work util_vector_logic_v2_0_1 -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" \
"../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/2137/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/ec67/hdl" "+incdir+../../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ipshared/c923" \
"../../../bd/DCTCop/ip/DCTCop_reset_inv_0_0/sim/DCTCop_reset_inv_0_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/DCTCop/sim/DCTCop.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

