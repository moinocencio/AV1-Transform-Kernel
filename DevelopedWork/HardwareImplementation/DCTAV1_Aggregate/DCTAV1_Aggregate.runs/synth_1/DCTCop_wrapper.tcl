# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param chipscope.maxJobs 1
create_project -in_memory -part xc7a200tfbg676-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.cache/wt [current_project]
set_property parent.project_path /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part xilinx.com:ac701:part0:1.4 [current_project]
set_property ip_repo_paths {
  /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/ip_repo/DCTs_1.0
  /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/ip_repo/DCT_Kernel_1.0
  /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/ip_repo/DCT_Kernel_1.0
  /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/ip_repo/DCTKERNV2_1.0
  /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/ip_repo/DCT_Kernel_1.0
} [current_project]
update_ip_catalog
set_property ip_output_repo /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/imports/new/DCT16_1_I.vhd
  /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/imports/new/DCT16_2_I.vhd
  /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/imports/new/DCT32_1_I.vhd
  /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/imports/new/DCT32_2_I.vhd
  /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/new/DCT4_I.vhd
  /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/imports/new/DCT64_1_I.vhd
  /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/imports/new/DCT64_2_I.vhd
  /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/imports/new/DCT8_1_I.vhd
  /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/imports/new/DCT8_2_I.vhd
  /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/new/DCT_Wrapper.vhd
  /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/hdl/DCTCop_wrapper.vhd
}
add_files /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/DCTCop.bd
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_microblaze_0_1/DCTCop_microblaze_0_1.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_microblaze_0_1/DCTCop_microblaze_0_1_ooc_debug.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_microblaze_0_1/DCTCop_microblaze_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_dlmb_v10_1/DCTCop_dlmb_v10_1.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_dlmb_v10_1/DCTCop_dlmb_v10_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_ilmb_v10_1/DCTCop_ilmb_v10_1.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_ilmb_v10_1/DCTCop_ilmb_v10_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_dlmb_bram_if_cntlr_1/DCTCop_dlmb_bram_if_cntlr_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_ilmb_bram_if_cntlr_1/DCTCop_ilmb_bram_if_cntlr_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_lmb_bram_1/DCTCop_lmb_bram_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_mdm_1_1/DCTCop_mdm_1_1.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_mdm_1_1/DCTCop_mdm_1_1_ooc_trace.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_clk_wiz_1_1/DCTCop_clk_wiz_1_1_board.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_clk_wiz_1_1/DCTCop_clk_wiz_1_1.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_clk_wiz_1_1/DCTCop_clk_wiz_1_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_rst_clk_wiz_1_100M_1/DCTCop_rst_clk_wiz_1_100M_1_board.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_rst_clk_wiz_1_100M_1/DCTCop_rst_clk_wiz_1_100M_1.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_rst_clk_wiz_1_100M_1/DCTCop_rst_clk_wiz_1_100M_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_axi_uartlite_0_1/DCTCop_axi_uartlite_0_1_board.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_axi_uartlite_0_1/DCTCop_axi_uartlite_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_axi_uartlite_0_1/DCTCop_axi_uartlite_0_1.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_xbar_0/DCTCop_xbar_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/DCTCop_ooc.xdc]
set_property used_in_implementation false [get_files -all /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_microblaze_0_1/data/mb_bootloop_le.elf]

read_ip -quiet /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/ip/DCTs_0/DCTs_0.xci

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top DCTCop_wrapper -part xc7a200tfbg676-2


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef DCTCop_wrapper.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file DCTCop_wrapper_utilization_synth.rpt -pb DCTCop_wrapper_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
