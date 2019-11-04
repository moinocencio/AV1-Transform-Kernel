#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Mon Nov 04 19:23:43 WET 2019
# SW Build 2552052 on Fri May 24 14:47:09 MDT 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xsim DCT4_TB_behav -key {Behavioral:sim_1:Functional:DCT4_TB} -tclbatch DCT4_TB.tcl -view /run/media/moinocencio/Data/Tese/TestDCTs/DCT4_AV1/DCT4_TB_behav.wcfg -log simulate.log"
xsim DCT4_TB_behav -key {Behavioral:sim_1:Functional:DCT4_TB} -tclbatch DCT4_TB.tcl -view /run/media/moinocencio/Data/Tese/TestDCTs/DCT4_AV1/DCT4_TB_behav.wcfg -log simulate.log

