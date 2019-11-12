--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
--Date        : Tue Nov 12 21:10:50 2019
--Host        : abencoado running 64-bit Manjaro Linux
--Command     : generate_target DCTCop_wrapper.bd
--Design      : DCTCop_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity DCTCop_wrapper is
  port (
    diff_clock_rtl_clk_n : in STD_LOGIC;
    diff_clock_rtl_clk_p : in STD_LOGIC;
    reset : in STD_LOGIC;
    reset_0 : in STD_LOGIC
  );
end DCTCop_wrapper;

architecture STRUCTURE of DCTCop_wrapper is
  component DCTCop is
  port (
    reset : in STD_LOGIC;
    reset_0 : in STD_LOGIC;
    diff_clock_rtl_clk_n : in STD_LOGIC;
    diff_clock_rtl_clk_p : in STD_LOGIC
  );
  end component DCTCop;
begin
DCTCop_i: component DCTCop
     port map (
      diff_clock_rtl_clk_n => diff_clock_rtl_clk_n,
      diff_clock_rtl_clk_p => diff_clock_rtl_clk_p,
      reset => reset,
      reset_0 => reset_0
    );
end STRUCTURE;
