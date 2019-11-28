#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.1 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Thu Nov 28 11:36:43 WET 2019
# SW Build 2552052 on Fri May 24 14:47:09 MDT 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xelab -wto b26b49d9bda747edb325d8846e3ecc83 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot TransWrapper_TB_behav xil_defaultlib.TransWrapper_TB -log elaborate.log"
xelab -wto b26b49d9bda747edb325d8846e3ecc83 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot TransWrapper_TB_behav xil_defaultlib.TransWrapper_TB -log elaborate.log

