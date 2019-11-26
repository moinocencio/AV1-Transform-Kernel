set_property SRC_FILE_INFO {cfile:/run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_clk_wiz_1_1/DCTCop_clk_wiz_1_1.xdc rfile:../../../DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_clk_wiz_1_1/DCTCop_clk_wiz_1_1.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
