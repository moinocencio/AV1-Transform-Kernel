-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Tue Nov 26 21:50:00 2019
-- Host        : abencoado running 64-bit Manjaro Linux
-- Command     : write_vhdl -force -mode synth_stub
--               /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCTAV1_Aggregate/DCTAV1_Aggregate.srcs/sources_1/bd/DCTCop/ip/DCTCop_clk_wiz_1_1/DCTCop_clk_wiz_1_1_stub.vhdl
-- Design      : DCTCop_clk_wiz_1_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DCTCop_clk_wiz_1_1 is
  Port ( 
    clk_out1 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end DCTCop_clk_wiz_1_1;

architecture stub of DCTCop_clk_wiz_1_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,reset,locked,clk_in1";
begin
end;
