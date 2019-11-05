-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Tue Nov  5 19:09:25 2019
-- Host        : abencoado running 64-bit Manjaro Linux
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/HardwareImplementation/DCT4_AV1/DCT4_AV1.sim/sim_1/synth/func/xsim/DCT4_TB_func_synth.vhd
-- Design      : DCT4
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity DCT4 is
  port (
    dataIn0 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dataIn1 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dataIn2 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dataIn3 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    res : in STD_LOGIC;
    en : in STD_LOGIC;
    clk : in STD_LOGIC;
    dataOut0 : out STD_LOGIC_VECTOR ( 14 downto 0 );
    dataOut1 : out STD_LOGIC_VECTOR ( 14 downto 0 );
    dataOut2 : out STD_LOGIC_VECTOR ( 14 downto 0 );
    dataOut3 : out STD_LOGIC_VECTOR ( 14 downto 0 );
    validOut : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of DCT4 : entity is true;
  attribute K : integer;
  attribute K of DCT4 : entity is 8;
end DCT4;

architecture STRUCTURE of DCT4 is
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal dataIn0_IBUF : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal dataIn1_IBUF : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal dataIn2_IBUF : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal dataIn3_IBUF : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal dataOut00 : STD_LOGIC;
  signal dataOut0_OBUF : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal dataOut1_OBUF : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal dataOut2_OBUF : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal dataOut3_OBUF : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal en_IBUF : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal res_IBUF : STD_LOGIC;
  signal s_dataIn0 : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal s_dataIn00 : STD_LOGIC;
  signal s_dataIn1 : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal s_dataIn2 : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal s_dataIn3 : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal s_dataOut00 : STD_LOGIC;
  signal s_dataOut0_reg_n_100 : STD_LOGIC;
  signal s_dataOut0_reg_n_101 : STD_LOGIC;
  signal s_dataOut0_reg_n_102 : STD_LOGIC;
  signal s_dataOut0_reg_n_103 : STD_LOGIC;
  signal s_dataOut0_reg_n_104 : STD_LOGIC;
  signal s_dataOut0_reg_n_105 : STD_LOGIC;
  signal s_dataOut0_reg_n_98 : STD_LOGIC;
  signal s_dataOut0_reg_n_99 : STD_LOGIC;
  signal s_dataOut1_reg_n_100 : STD_LOGIC;
  signal s_dataOut1_reg_n_101 : STD_LOGIC;
  signal s_dataOut1_reg_n_102 : STD_LOGIC;
  signal s_dataOut1_reg_n_103 : STD_LOGIC;
  signal s_dataOut1_reg_n_104 : STD_LOGIC;
  signal s_dataOut1_reg_n_105 : STD_LOGIC;
  signal s_dataOut1_reg_n_83 : STD_LOGIC;
  signal s_dataOut1_reg_n_84 : STD_LOGIC;
  signal s_dataOut1_reg_n_85 : STD_LOGIC;
  signal s_dataOut1_reg_n_86 : STD_LOGIC;
  signal s_dataOut1_reg_n_87 : STD_LOGIC;
  signal s_dataOut1_reg_n_88 : STD_LOGIC;
  signal s_dataOut1_reg_n_89 : STD_LOGIC;
  signal s_dataOut1_reg_n_90 : STD_LOGIC;
  signal s_dataOut1_reg_n_91 : STD_LOGIC;
  signal s_dataOut1_reg_n_92 : STD_LOGIC;
  signal s_dataOut1_reg_n_93 : STD_LOGIC;
  signal s_dataOut1_reg_n_94 : STD_LOGIC;
  signal s_dataOut1_reg_n_95 : STD_LOGIC;
  signal s_dataOut1_reg_n_96 : STD_LOGIC;
  signal s_dataOut1_reg_n_97 : STD_LOGIC;
  signal s_dataOut1_reg_n_98 : STD_LOGIC;
  signal s_dataOut1_reg_n_99 : STD_LOGIC;
  signal s_dataOut2_reg_n_100 : STD_LOGIC;
  signal s_dataOut2_reg_n_101 : STD_LOGIC;
  signal s_dataOut2_reg_n_102 : STD_LOGIC;
  signal s_dataOut2_reg_n_103 : STD_LOGIC;
  signal s_dataOut2_reg_n_104 : STD_LOGIC;
  signal s_dataOut2_reg_n_105 : STD_LOGIC;
  signal s_dataOut2_reg_n_83 : STD_LOGIC;
  signal s_dataOut2_reg_n_84 : STD_LOGIC;
  signal s_dataOut2_reg_n_85 : STD_LOGIC;
  signal s_dataOut2_reg_n_86 : STD_LOGIC;
  signal s_dataOut2_reg_n_87 : STD_LOGIC;
  signal s_dataOut2_reg_n_88 : STD_LOGIC;
  signal s_dataOut2_reg_n_89 : STD_LOGIC;
  signal s_dataOut2_reg_n_90 : STD_LOGIC;
  signal s_dataOut2_reg_n_91 : STD_LOGIC;
  signal s_dataOut2_reg_n_92 : STD_LOGIC;
  signal s_dataOut2_reg_n_93 : STD_LOGIC;
  signal s_dataOut2_reg_n_94 : STD_LOGIC;
  signal s_dataOut2_reg_n_95 : STD_LOGIC;
  signal s_dataOut2_reg_n_96 : STD_LOGIC;
  signal s_dataOut2_reg_n_97 : STD_LOGIC;
  signal s_dataOut2_reg_n_98 : STD_LOGIC;
  signal s_dataOut2_reg_n_99 : STD_LOGIC;
  signal s_dataOut3_reg_n_100 : STD_LOGIC;
  signal s_dataOut3_reg_n_101 : STD_LOGIC;
  signal s_dataOut3_reg_n_102 : STD_LOGIC;
  signal s_dataOut3_reg_n_103 : STD_LOGIC;
  signal s_dataOut3_reg_n_104 : STD_LOGIC;
  signal s_dataOut3_reg_n_105 : STD_LOGIC;
  signal s_dataOut3_reg_n_83 : STD_LOGIC;
  signal s_dataOut3_reg_n_84 : STD_LOGIC;
  signal s_dataOut3_reg_n_85 : STD_LOGIC;
  signal s_dataOut3_reg_n_86 : STD_LOGIC;
  signal s_dataOut3_reg_n_87 : STD_LOGIC;
  signal s_dataOut3_reg_n_88 : STD_LOGIC;
  signal s_dataOut3_reg_n_89 : STD_LOGIC;
  signal s_dataOut3_reg_n_90 : STD_LOGIC;
  signal s_dataOut3_reg_n_91 : STD_LOGIC;
  signal s_dataOut3_reg_n_92 : STD_LOGIC;
  signal s_dataOut3_reg_n_93 : STD_LOGIC;
  signal s_dataOut3_reg_n_94 : STD_LOGIC;
  signal s_dataOut3_reg_n_95 : STD_LOGIC;
  signal s_dataOut3_reg_n_96 : STD_LOGIC;
  signal s_dataOut3_reg_n_97 : STD_LOGIC;
  signal s_dataOut3_reg_n_98 : STD_LOGIC;
  signal s_dataOut3_reg_n_99 : STD_LOGIC;
  signal s_stage1En : STD_LOGIC;
  signal s_stage1En_i_1_n_0 : STD_LOGIC;
  signal s_stage1En_i_2_n_0 : STD_LOGIC;
  signal s_stage2AEn : STD_LOGIC;
  signal s_stage2AEn_i_1_n_0 : STD_LOGIC;
  signal s_stage2MEn : STD_LOGIC;
  signal s_stage2MEn_i_1_n_0 : STD_LOGIC;
  signal s_stg1Out00 : STD_LOGIC;
  signal s_stg2M00 : STD_LOGIC;
  signal s_stg2M0_reg_n_10 : STD_LOGIC;
  signal s_stg2M0_reg_n_100 : STD_LOGIC;
  signal s_stg2M0_reg_n_101 : STD_LOGIC;
  signal s_stg2M0_reg_n_102 : STD_LOGIC;
  signal s_stg2M0_reg_n_103 : STD_LOGIC;
  signal s_stg2M0_reg_n_104 : STD_LOGIC;
  signal s_stg2M0_reg_n_105 : STD_LOGIC;
  signal s_stg2M0_reg_n_106 : STD_LOGIC;
  signal s_stg2M0_reg_n_107 : STD_LOGIC;
  signal s_stg2M0_reg_n_108 : STD_LOGIC;
  signal s_stg2M0_reg_n_109 : STD_LOGIC;
  signal s_stg2M0_reg_n_11 : STD_LOGIC;
  signal s_stg2M0_reg_n_110 : STD_LOGIC;
  signal s_stg2M0_reg_n_111 : STD_LOGIC;
  signal s_stg2M0_reg_n_112 : STD_LOGIC;
  signal s_stg2M0_reg_n_113 : STD_LOGIC;
  signal s_stg2M0_reg_n_114 : STD_LOGIC;
  signal s_stg2M0_reg_n_115 : STD_LOGIC;
  signal s_stg2M0_reg_n_116 : STD_LOGIC;
  signal s_stg2M0_reg_n_117 : STD_LOGIC;
  signal s_stg2M0_reg_n_118 : STD_LOGIC;
  signal s_stg2M0_reg_n_119 : STD_LOGIC;
  signal s_stg2M0_reg_n_12 : STD_LOGIC;
  signal s_stg2M0_reg_n_120 : STD_LOGIC;
  signal s_stg2M0_reg_n_121 : STD_LOGIC;
  signal s_stg2M0_reg_n_122 : STD_LOGIC;
  signal s_stg2M0_reg_n_123 : STD_LOGIC;
  signal s_stg2M0_reg_n_124 : STD_LOGIC;
  signal s_stg2M0_reg_n_125 : STD_LOGIC;
  signal s_stg2M0_reg_n_126 : STD_LOGIC;
  signal s_stg2M0_reg_n_127 : STD_LOGIC;
  signal s_stg2M0_reg_n_128 : STD_LOGIC;
  signal s_stg2M0_reg_n_129 : STD_LOGIC;
  signal s_stg2M0_reg_n_13 : STD_LOGIC;
  signal s_stg2M0_reg_n_130 : STD_LOGIC;
  signal s_stg2M0_reg_n_131 : STD_LOGIC;
  signal s_stg2M0_reg_n_132 : STD_LOGIC;
  signal s_stg2M0_reg_n_133 : STD_LOGIC;
  signal s_stg2M0_reg_n_134 : STD_LOGIC;
  signal s_stg2M0_reg_n_135 : STD_LOGIC;
  signal s_stg2M0_reg_n_136 : STD_LOGIC;
  signal s_stg2M0_reg_n_137 : STD_LOGIC;
  signal s_stg2M0_reg_n_138 : STD_LOGIC;
  signal s_stg2M0_reg_n_139 : STD_LOGIC;
  signal s_stg2M0_reg_n_14 : STD_LOGIC;
  signal s_stg2M0_reg_n_140 : STD_LOGIC;
  signal s_stg2M0_reg_n_141 : STD_LOGIC;
  signal s_stg2M0_reg_n_142 : STD_LOGIC;
  signal s_stg2M0_reg_n_143 : STD_LOGIC;
  signal s_stg2M0_reg_n_144 : STD_LOGIC;
  signal s_stg2M0_reg_n_145 : STD_LOGIC;
  signal s_stg2M0_reg_n_146 : STD_LOGIC;
  signal s_stg2M0_reg_n_147 : STD_LOGIC;
  signal s_stg2M0_reg_n_148 : STD_LOGIC;
  signal s_stg2M0_reg_n_149 : STD_LOGIC;
  signal s_stg2M0_reg_n_15 : STD_LOGIC;
  signal s_stg2M0_reg_n_150 : STD_LOGIC;
  signal s_stg2M0_reg_n_151 : STD_LOGIC;
  signal s_stg2M0_reg_n_152 : STD_LOGIC;
  signal s_stg2M0_reg_n_153 : STD_LOGIC;
  signal s_stg2M0_reg_n_16 : STD_LOGIC;
  signal s_stg2M0_reg_n_17 : STD_LOGIC;
  signal s_stg2M0_reg_n_18 : STD_LOGIC;
  signal s_stg2M0_reg_n_19 : STD_LOGIC;
  signal s_stg2M0_reg_n_20 : STD_LOGIC;
  signal s_stg2M0_reg_n_21 : STD_LOGIC;
  signal s_stg2M0_reg_n_22 : STD_LOGIC;
  signal s_stg2M0_reg_n_23 : STD_LOGIC;
  signal s_stg2M0_reg_n_6 : STD_LOGIC;
  signal s_stg2M0_reg_n_7 : STD_LOGIC;
  signal s_stg2M0_reg_n_8 : STD_LOGIC;
  signal s_stg2M0_reg_n_86 : STD_LOGIC;
  signal s_stg2M0_reg_n_87 : STD_LOGIC;
  signal s_stg2M0_reg_n_88 : STD_LOGIC;
  signal s_stg2M0_reg_n_89 : STD_LOGIC;
  signal s_stg2M0_reg_n_9 : STD_LOGIC;
  signal s_stg2M0_reg_n_90 : STD_LOGIC;
  signal s_stg2M0_reg_n_91 : STD_LOGIC;
  signal s_stg2M0_reg_n_92 : STD_LOGIC;
  signal s_stg2M0_reg_n_93 : STD_LOGIC;
  signal s_stg2M0_reg_n_94 : STD_LOGIC;
  signal s_stg2M0_reg_n_95 : STD_LOGIC;
  signal s_stg2M0_reg_n_96 : STD_LOGIC;
  signal s_stg2M0_reg_n_97 : STD_LOGIC;
  signal s_stg2M0_reg_n_98 : STD_LOGIC;
  signal s_stg2M0_reg_n_99 : STD_LOGIC;
  signal s_stg2M21_reg_n_106 : STD_LOGIC;
  signal s_stg2M21_reg_n_107 : STD_LOGIC;
  signal s_stg2M21_reg_n_108 : STD_LOGIC;
  signal s_stg2M21_reg_n_109 : STD_LOGIC;
  signal s_stg2M21_reg_n_110 : STD_LOGIC;
  signal s_stg2M21_reg_n_111 : STD_LOGIC;
  signal s_stg2M21_reg_n_112 : STD_LOGIC;
  signal s_stg2M21_reg_n_113 : STD_LOGIC;
  signal s_stg2M21_reg_n_114 : STD_LOGIC;
  signal s_stg2M21_reg_n_115 : STD_LOGIC;
  signal s_stg2M21_reg_n_116 : STD_LOGIC;
  signal s_stg2M21_reg_n_117 : STD_LOGIC;
  signal s_stg2M21_reg_n_118 : STD_LOGIC;
  signal s_stg2M21_reg_n_119 : STD_LOGIC;
  signal s_stg2M21_reg_n_120 : STD_LOGIC;
  signal s_stg2M21_reg_n_121 : STD_LOGIC;
  signal s_stg2M21_reg_n_122 : STD_LOGIC;
  signal s_stg2M21_reg_n_123 : STD_LOGIC;
  signal s_stg2M21_reg_n_124 : STD_LOGIC;
  signal s_stg2M21_reg_n_125 : STD_LOGIC;
  signal s_stg2M21_reg_n_126 : STD_LOGIC;
  signal s_stg2M21_reg_n_127 : STD_LOGIC;
  signal s_stg2M21_reg_n_128 : STD_LOGIC;
  signal s_stg2M21_reg_n_129 : STD_LOGIC;
  signal s_stg2M21_reg_n_130 : STD_LOGIC;
  signal s_stg2M21_reg_n_131 : STD_LOGIC;
  signal s_stg2M21_reg_n_132 : STD_LOGIC;
  signal s_stg2M21_reg_n_133 : STD_LOGIC;
  signal s_stg2M21_reg_n_134 : STD_LOGIC;
  signal s_stg2M21_reg_n_135 : STD_LOGIC;
  signal s_stg2M21_reg_n_136 : STD_LOGIC;
  signal s_stg2M21_reg_n_137 : STD_LOGIC;
  signal s_stg2M21_reg_n_138 : STD_LOGIC;
  signal s_stg2M21_reg_n_139 : STD_LOGIC;
  signal s_stg2M21_reg_n_140 : STD_LOGIC;
  signal s_stg2M21_reg_n_141 : STD_LOGIC;
  signal s_stg2M21_reg_n_142 : STD_LOGIC;
  signal s_stg2M21_reg_n_143 : STD_LOGIC;
  signal s_stg2M21_reg_n_144 : STD_LOGIC;
  signal s_stg2M21_reg_n_145 : STD_LOGIC;
  signal s_stg2M21_reg_n_146 : STD_LOGIC;
  signal s_stg2M21_reg_n_147 : STD_LOGIC;
  signal s_stg2M21_reg_n_148 : STD_LOGIC;
  signal s_stg2M21_reg_n_149 : STD_LOGIC;
  signal s_stg2M21_reg_n_150 : STD_LOGIC;
  signal s_stg2M21_reg_n_151 : STD_LOGIC;
  signal s_stg2M21_reg_n_152 : STD_LOGIC;
  signal s_stg2M21_reg_n_153 : STD_LOGIC;
  signal s_stg2M31_reg_n_106 : STD_LOGIC;
  signal s_stg2M31_reg_n_107 : STD_LOGIC;
  signal s_stg2M31_reg_n_108 : STD_LOGIC;
  signal s_stg2M31_reg_n_109 : STD_LOGIC;
  signal s_stg2M31_reg_n_110 : STD_LOGIC;
  signal s_stg2M31_reg_n_111 : STD_LOGIC;
  signal s_stg2M31_reg_n_112 : STD_LOGIC;
  signal s_stg2M31_reg_n_113 : STD_LOGIC;
  signal s_stg2M31_reg_n_114 : STD_LOGIC;
  signal s_stg2M31_reg_n_115 : STD_LOGIC;
  signal s_stg2M31_reg_n_116 : STD_LOGIC;
  signal s_stg2M31_reg_n_117 : STD_LOGIC;
  signal s_stg2M31_reg_n_118 : STD_LOGIC;
  signal s_stg2M31_reg_n_119 : STD_LOGIC;
  signal s_stg2M31_reg_n_120 : STD_LOGIC;
  signal s_stg2M31_reg_n_121 : STD_LOGIC;
  signal s_stg2M31_reg_n_122 : STD_LOGIC;
  signal s_stg2M31_reg_n_123 : STD_LOGIC;
  signal s_stg2M31_reg_n_124 : STD_LOGIC;
  signal s_stg2M31_reg_n_125 : STD_LOGIC;
  signal s_stg2M31_reg_n_126 : STD_LOGIC;
  signal s_stg2M31_reg_n_127 : STD_LOGIC;
  signal s_stg2M31_reg_n_128 : STD_LOGIC;
  signal s_stg2M31_reg_n_129 : STD_LOGIC;
  signal s_stg2M31_reg_n_130 : STD_LOGIC;
  signal s_stg2M31_reg_n_131 : STD_LOGIC;
  signal s_stg2M31_reg_n_132 : STD_LOGIC;
  signal s_stg2M31_reg_n_133 : STD_LOGIC;
  signal s_stg2M31_reg_n_134 : STD_LOGIC;
  signal s_stg2M31_reg_n_135 : STD_LOGIC;
  signal s_stg2M31_reg_n_136 : STD_LOGIC;
  signal s_stg2M31_reg_n_137 : STD_LOGIC;
  signal s_stg2M31_reg_n_138 : STD_LOGIC;
  signal s_stg2M31_reg_n_139 : STD_LOGIC;
  signal s_stg2M31_reg_n_140 : STD_LOGIC;
  signal s_stg2M31_reg_n_141 : STD_LOGIC;
  signal s_stg2M31_reg_n_142 : STD_LOGIC;
  signal s_stg2M31_reg_n_143 : STD_LOGIC;
  signal s_stg2M31_reg_n_144 : STD_LOGIC;
  signal s_stg2M31_reg_n_145 : STD_LOGIC;
  signal s_stg2M31_reg_n_146 : STD_LOGIC;
  signal s_stg2M31_reg_n_147 : STD_LOGIC;
  signal s_stg2M31_reg_n_148 : STD_LOGIC;
  signal s_stg2M31_reg_n_149 : STD_LOGIC;
  signal s_stg2M31_reg_n_150 : STD_LOGIC;
  signal s_stg2M31_reg_n_151 : STD_LOGIC;
  signal s_stg2M31_reg_n_152 : STD_LOGIC;
  signal s_stg2M31_reg_n_153 : STD_LOGIC;
  signal s_valOut : STD_LOGIC;
  signal s_valOut_i_1_n_0 : STD_LOGIC;
  signal validOut_OBUF : STD_LOGIC;
  signal NLW_s_dataOut0_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut0_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut0_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut0_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut0_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut0_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut0_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_s_dataOut0_reg_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_s_dataOut0_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_s_dataOut0_reg_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 23 );
  signal NLW_s_dataOut0_reg_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_s_dataOut1_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut1_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut1_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut1_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut1_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut1_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut1_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_s_dataOut1_reg_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_s_dataOut1_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_s_dataOut1_reg_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 23 );
  signal NLW_s_dataOut1_reg_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_s_dataOut2_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut2_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut2_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut2_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut2_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut2_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut2_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_s_dataOut2_reg_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_s_dataOut2_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_s_dataOut2_reg_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 23 );
  signal NLW_s_dataOut2_reg_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_s_dataOut3_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut3_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut3_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut3_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut3_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut3_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_s_dataOut3_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_s_dataOut3_reg_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_s_dataOut3_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_s_dataOut3_reg_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 23 );
  signal NLW_s_dataOut3_reg_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_s_stg2M0_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_stg2M0_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_stg2M0_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_s_stg2M0_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_stg2M0_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_stg2M0_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_s_stg2M0_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_s_stg2M0_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_s_stg2M0_reg_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 20 );
  signal NLW_s_stg2M21_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_stg2M21_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_stg2M21_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_s_stg2M21_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_stg2M21_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_stg2M21_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_s_stg2M21_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_s_stg2M21_reg_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_s_stg2M21_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_s_stg2M21_reg_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_s_stg2M31_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_stg2M31_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_stg2M31_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_s_stg2M31_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_stg2M31_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_s_stg2M31_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_s_stg2M31_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_s_stg2M31_reg_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_s_stg2M31_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_s_stg2M31_reg_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
begin
clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_IBUF,
      O => clk_IBUF_BUFG
    );
clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk,
      O => clk_IBUF
    );
\dataIn0_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn0(0),
      O => dataIn0_IBUF(0)
    );
\dataIn0_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn0(1),
      O => dataIn0_IBUF(1)
    );
\dataIn0_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn0(2),
      O => dataIn0_IBUF(2)
    );
\dataIn0_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn0(3),
      O => dataIn0_IBUF(3)
    );
\dataIn0_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn0(4),
      O => dataIn0_IBUF(4)
    );
\dataIn0_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn0(5),
      O => dataIn0_IBUF(5)
    );
\dataIn0_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn0(6),
      O => dataIn0_IBUF(6)
    );
\dataIn0_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn0(7),
      O => dataIn0_IBUF(7)
    );
\dataIn0_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn0(8),
      O => dataIn0_IBUF(8)
    );
\dataIn0_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn0(9),
      O => dataIn0_IBUF(9)
    );
\dataIn1_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn1(0),
      O => dataIn1_IBUF(0)
    );
\dataIn1_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn1(1),
      O => dataIn1_IBUF(1)
    );
\dataIn1_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn1(2),
      O => dataIn1_IBUF(2)
    );
\dataIn1_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn1(3),
      O => dataIn1_IBUF(3)
    );
\dataIn1_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn1(4),
      O => dataIn1_IBUF(4)
    );
\dataIn1_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn1(5),
      O => dataIn1_IBUF(5)
    );
\dataIn1_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn1(6),
      O => dataIn1_IBUF(6)
    );
\dataIn1_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn1(7),
      O => dataIn1_IBUF(7)
    );
\dataIn1_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn1(8),
      O => dataIn1_IBUF(8)
    );
\dataIn1_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn1(9),
      O => dataIn1_IBUF(9)
    );
\dataIn2_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn2(0),
      O => dataIn2_IBUF(0)
    );
\dataIn2_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn2(1),
      O => dataIn2_IBUF(1)
    );
\dataIn2_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn2(2),
      O => dataIn2_IBUF(2)
    );
\dataIn2_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn2(3),
      O => dataIn2_IBUF(3)
    );
\dataIn2_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn2(4),
      O => dataIn2_IBUF(4)
    );
\dataIn2_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn2(5),
      O => dataIn2_IBUF(5)
    );
\dataIn2_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn2(6),
      O => dataIn2_IBUF(6)
    );
\dataIn2_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn2(7),
      O => dataIn2_IBUF(7)
    );
\dataIn2_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn2(8),
      O => dataIn2_IBUF(8)
    );
\dataIn2_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn2(9),
      O => dataIn2_IBUF(9)
    );
\dataIn3_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn3(0),
      O => dataIn3_IBUF(0)
    );
\dataIn3_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn3(1),
      O => dataIn3_IBUF(1)
    );
\dataIn3_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn3(2),
      O => dataIn3_IBUF(2)
    );
\dataIn3_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn3(3),
      O => dataIn3_IBUF(3)
    );
\dataIn3_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn3(4),
      O => dataIn3_IBUF(4)
    );
\dataIn3_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn3(5),
      O => dataIn3_IBUF(5)
    );
\dataIn3_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn3(6),
      O => dataIn3_IBUF(6)
    );
\dataIn3_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn3(7),
      O => dataIn3_IBUF(7)
    );
\dataIn3_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn3(8),
      O => dataIn3_IBUF(8)
    );
\dataIn3_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => dataIn3(9),
      O => dataIn3_IBUF(9)
    );
\dataOut0[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_valOut,
      I1 => res_IBUF,
      O => dataOut00
    );
\dataOut0_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut0_OBUF(0),
      O => dataOut0(0)
    );
\dataOut0_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut0_OBUF(10),
      O => dataOut0(10)
    );
\dataOut0_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut0_OBUF(11),
      O => dataOut0(11)
    );
\dataOut0_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut0_OBUF(12),
      O => dataOut0(12)
    );
\dataOut0_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut0_OBUF(13),
      O => dataOut0(13)
    );
\dataOut0_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut0_OBUF(14),
      O => dataOut0(14)
    );
\dataOut0_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut0_OBUF(1),
      O => dataOut0(1)
    );
\dataOut0_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut0_OBUF(2),
      O => dataOut0(2)
    );
\dataOut0_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut0_OBUF(3),
      O => dataOut0(3)
    );
\dataOut0_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut0_OBUF(4),
      O => dataOut0(4)
    );
\dataOut0_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut0_OBUF(5),
      O => dataOut0(5)
    );
\dataOut0_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut0_OBUF(6),
      O => dataOut0(6)
    );
\dataOut0_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut0_OBUF(7),
      O => dataOut0(7)
    );
\dataOut0_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut0_OBUF(8),
      O => dataOut0(8)
    );
\dataOut0_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut0_OBUF(9),
      O => dataOut0(9)
    );
\dataOut0_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => p_0_in(0),
      Q => dataOut0_OBUF(0),
      R => dataOut00
    );
\dataOut0_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => p_0_in(10),
      Q => dataOut0_OBUF(10),
      R => dataOut00
    );
\dataOut0_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => p_0_in(11),
      Q => dataOut0_OBUF(11),
      R => dataOut00
    );
\dataOut0_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => p_0_in(12),
      Q => dataOut0_OBUF(12),
      R => dataOut00
    );
\dataOut0_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => p_0_in(13),
      Q => dataOut0_OBUF(13),
      R => dataOut00
    );
\dataOut0_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => p_0_in(14),
      Q => dataOut0_OBUF(14),
      R => dataOut00
    );
\dataOut0_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => p_0_in(1),
      Q => dataOut0_OBUF(1),
      R => dataOut00
    );
\dataOut0_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => p_0_in(2),
      Q => dataOut0_OBUF(2),
      R => dataOut00
    );
\dataOut0_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => p_0_in(3),
      Q => dataOut0_OBUF(3),
      R => dataOut00
    );
\dataOut0_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => p_0_in(4),
      Q => dataOut0_OBUF(4),
      R => dataOut00
    );
\dataOut0_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => p_0_in(5),
      Q => dataOut0_OBUF(5),
      R => dataOut00
    );
\dataOut0_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => p_0_in(6),
      Q => dataOut0_OBUF(6),
      R => dataOut00
    );
\dataOut0_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => p_0_in(7),
      Q => dataOut0_OBUF(7),
      R => dataOut00
    );
\dataOut0_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => p_0_in(8),
      Q => dataOut0_OBUF(8),
      R => dataOut00
    );
\dataOut0_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => p_0_in(9),
      Q => dataOut0_OBUF(9),
      R => dataOut00
    );
\dataOut1_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut1_OBUF(0),
      O => dataOut1(0)
    );
\dataOut1_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut1_OBUF(10),
      O => dataOut1(10)
    );
\dataOut1_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut1_OBUF(11),
      O => dataOut1(11)
    );
\dataOut1_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut1_OBUF(12),
      O => dataOut1(12)
    );
\dataOut1_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut1_OBUF(13),
      O => dataOut1(13)
    );
\dataOut1_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut1_OBUF(14),
      O => dataOut1(14)
    );
\dataOut1_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut1_OBUF(1),
      O => dataOut1(1)
    );
\dataOut1_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut1_OBUF(2),
      O => dataOut1(2)
    );
\dataOut1_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut1_OBUF(3),
      O => dataOut1(3)
    );
\dataOut1_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut1_OBUF(4),
      O => dataOut1(4)
    );
\dataOut1_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut1_OBUF(5),
      O => dataOut1(5)
    );
\dataOut1_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut1_OBUF(6),
      O => dataOut1(6)
    );
\dataOut1_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut1_OBUF(7),
      O => dataOut1(7)
    );
\dataOut1_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut1_OBUF(8),
      O => dataOut1(8)
    );
\dataOut1_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut1_OBUF(9),
      O => dataOut1(9)
    );
\dataOut1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut1_reg_n_97,
      Q => dataOut1_OBUF(0),
      R => dataOut00
    );
\dataOut1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut1_reg_n_87,
      Q => dataOut1_OBUF(10),
      R => dataOut00
    );
\dataOut1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut1_reg_n_86,
      Q => dataOut1_OBUF(11),
      R => dataOut00
    );
\dataOut1_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut1_reg_n_85,
      Q => dataOut1_OBUF(12),
      R => dataOut00
    );
\dataOut1_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut1_reg_n_84,
      Q => dataOut1_OBUF(13),
      R => dataOut00
    );
\dataOut1_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut1_reg_n_83,
      Q => dataOut1_OBUF(14),
      R => dataOut00
    );
\dataOut1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut1_reg_n_96,
      Q => dataOut1_OBUF(1),
      R => dataOut00
    );
\dataOut1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut1_reg_n_95,
      Q => dataOut1_OBUF(2),
      R => dataOut00
    );
\dataOut1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut1_reg_n_94,
      Q => dataOut1_OBUF(3),
      R => dataOut00
    );
\dataOut1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut1_reg_n_93,
      Q => dataOut1_OBUF(4),
      R => dataOut00
    );
\dataOut1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut1_reg_n_92,
      Q => dataOut1_OBUF(5),
      R => dataOut00
    );
\dataOut1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut1_reg_n_91,
      Q => dataOut1_OBUF(6),
      R => dataOut00
    );
\dataOut1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut1_reg_n_90,
      Q => dataOut1_OBUF(7),
      R => dataOut00
    );
\dataOut1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut1_reg_n_89,
      Q => dataOut1_OBUF(8),
      R => dataOut00
    );
\dataOut1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut1_reg_n_88,
      Q => dataOut1_OBUF(9),
      R => dataOut00
    );
\dataOut2_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut2_OBUF(0),
      O => dataOut2(0)
    );
\dataOut2_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut2_OBUF(10),
      O => dataOut2(10)
    );
\dataOut2_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut2_OBUF(11),
      O => dataOut2(11)
    );
\dataOut2_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut2_OBUF(12),
      O => dataOut2(12)
    );
\dataOut2_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut2_OBUF(13),
      O => dataOut2(13)
    );
\dataOut2_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut2_OBUF(14),
      O => dataOut2(14)
    );
\dataOut2_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut2_OBUF(1),
      O => dataOut2(1)
    );
\dataOut2_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut2_OBUF(2),
      O => dataOut2(2)
    );
\dataOut2_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut2_OBUF(3),
      O => dataOut2(3)
    );
\dataOut2_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut2_OBUF(4),
      O => dataOut2(4)
    );
\dataOut2_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut2_OBUF(5),
      O => dataOut2(5)
    );
\dataOut2_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut2_OBUF(6),
      O => dataOut2(6)
    );
\dataOut2_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut2_OBUF(7),
      O => dataOut2(7)
    );
\dataOut2_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut2_OBUF(8),
      O => dataOut2(8)
    );
\dataOut2_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut2_OBUF(9),
      O => dataOut2(9)
    );
\dataOut2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut2_reg_n_97,
      Q => dataOut2_OBUF(0),
      R => dataOut00
    );
\dataOut2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut2_reg_n_87,
      Q => dataOut2_OBUF(10),
      R => dataOut00
    );
\dataOut2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut2_reg_n_86,
      Q => dataOut2_OBUF(11),
      R => dataOut00
    );
\dataOut2_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut2_reg_n_85,
      Q => dataOut2_OBUF(12),
      R => dataOut00
    );
\dataOut2_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut2_reg_n_84,
      Q => dataOut2_OBUF(13),
      R => dataOut00
    );
\dataOut2_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut2_reg_n_83,
      Q => dataOut2_OBUF(14),
      R => dataOut00
    );
\dataOut2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut2_reg_n_96,
      Q => dataOut2_OBUF(1),
      R => dataOut00
    );
\dataOut2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut2_reg_n_95,
      Q => dataOut2_OBUF(2),
      R => dataOut00
    );
\dataOut2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut2_reg_n_94,
      Q => dataOut2_OBUF(3),
      R => dataOut00
    );
\dataOut2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut2_reg_n_93,
      Q => dataOut2_OBUF(4),
      R => dataOut00
    );
\dataOut2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut2_reg_n_92,
      Q => dataOut2_OBUF(5),
      R => dataOut00
    );
\dataOut2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut2_reg_n_91,
      Q => dataOut2_OBUF(6),
      R => dataOut00
    );
\dataOut2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut2_reg_n_90,
      Q => dataOut2_OBUF(7),
      R => dataOut00
    );
\dataOut2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut2_reg_n_89,
      Q => dataOut2_OBUF(8),
      R => dataOut00
    );
\dataOut2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut2_reg_n_88,
      Q => dataOut2_OBUF(9),
      R => dataOut00
    );
\dataOut3_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut3_OBUF(0),
      O => dataOut3(0)
    );
\dataOut3_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut3_OBUF(10),
      O => dataOut3(10)
    );
\dataOut3_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut3_OBUF(11),
      O => dataOut3(11)
    );
\dataOut3_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut3_OBUF(12),
      O => dataOut3(12)
    );
\dataOut3_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut3_OBUF(13),
      O => dataOut3(13)
    );
\dataOut3_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut3_OBUF(14),
      O => dataOut3(14)
    );
\dataOut3_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut3_OBUF(1),
      O => dataOut3(1)
    );
\dataOut3_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut3_OBUF(2),
      O => dataOut3(2)
    );
\dataOut3_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut3_OBUF(3),
      O => dataOut3(3)
    );
\dataOut3_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut3_OBUF(4),
      O => dataOut3(4)
    );
\dataOut3_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut3_OBUF(5),
      O => dataOut3(5)
    );
\dataOut3_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut3_OBUF(6),
      O => dataOut3(6)
    );
\dataOut3_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut3_OBUF(7),
      O => dataOut3(7)
    );
\dataOut3_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut3_OBUF(8),
      O => dataOut3(8)
    );
\dataOut3_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => dataOut3_OBUF(9),
      O => dataOut3(9)
    );
\dataOut3_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut3_reg_n_97,
      Q => dataOut3_OBUF(0),
      R => dataOut00
    );
\dataOut3_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut3_reg_n_87,
      Q => dataOut3_OBUF(10),
      R => dataOut00
    );
\dataOut3_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut3_reg_n_86,
      Q => dataOut3_OBUF(11),
      R => dataOut00
    );
\dataOut3_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut3_reg_n_85,
      Q => dataOut3_OBUF(12),
      R => dataOut00
    );
\dataOut3_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut3_reg_n_84,
      Q => dataOut3_OBUF(13),
      R => dataOut00
    );
\dataOut3_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut3_reg_n_83,
      Q => dataOut3_OBUF(14),
      R => dataOut00
    );
\dataOut3_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut3_reg_n_96,
      Q => dataOut3_OBUF(1),
      R => dataOut00
    );
\dataOut3_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut3_reg_n_95,
      Q => dataOut3_OBUF(2),
      R => dataOut00
    );
\dataOut3_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut3_reg_n_94,
      Q => dataOut3_OBUF(3),
      R => dataOut00
    );
\dataOut3_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut3_reg_n_93,
      Q => dataOut3_OBUF(4),
      R => dataOut00
    );
\dataOut3_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut3_reg_n_92,
      Q => dataOut3_OBUF(5),
      R => dataOut00
    );
\dataOut3_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut3_reg_n_91,
      Q => dataOut3_OBUF(6),
      R => dataOut00
    );
\dataOut3_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut3_reg_n_90,
      Q => dataOut3_OBUF(7),
      R => dataOut00
    );
\dataOut3_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut3_reg_n_89,
      Q => dataOut3_OBUF(8),
      R => dataOut00
    );
\dataOut3_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_dataOut3_reg_n_88,
      Q => dataOut3_OBUF(9),
      R => dataOut00
    );
en_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => en,
      O => en_IBUF
    );
res_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => res,
      O => res_IBUF
    );
\s_dataIn0_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn0_IBUF(0),
      Q => s_dataIn0(0),
      R => s_dataIn00
    );
\s_dataIn0_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn0_IBUF(1),
      Q => s_dataIn0(1),
      R => s_dataIn00
    );
\s_dataIn0_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn0_IBUF(2),
      Q => s_dataIn0(2),
      R => s_dataIn00
    );
\s_dataIn0_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn0_IBUF(3),
      Q => s_dataIn0(3),
      R => s_dataIn00
    );
\s_dataIn0_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn0_IBUF(4),
      Q => s_dataIn0(4),
      R => s_dataIn00
    );
\s_dataIn0_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn0_IBUF(5),
      Q => s_dataIn0(5),
      R => s_dataIn00
    );
\s_dataIn0_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn0_IBUF(6),
      Q => s_dataIn0(6),
      R => s_dataIn00
    );
\s_dataIn0_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn0_IBUF(7),
      Q => s_dataIn0(7),
      R => s_dataIn00
    );
\s_dataIn0_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn0_IBUF(8),
      Q => s_dataIn0(8),
      R => s_dataIn00
    );
\s_dataIn0_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn0_IBUF(9),
      Q => s_dataIn0(9),
      R => s_dataIn00
    );
\s_dataIn1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn1_IBUF(0),
      Q => s_dataIn1(0),
      R => s_dataIn00
    );
\s_dataIn1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn1_IBUF(1),
      Q => s_dataIn1(1),
      R => s_dataIn00
    );
\s_dataIn1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn1_IBUF(2),
      Q => s_dataIn1(2),
      R => s_dataIn00
    );
\s_dataIn1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn1_IBUF(3),
      Q => s_dataIn1(3),
      R => s_dataIn00
    );
\s_dataIn1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn1_IBUF(4),
      Q => s_dataIn1(4),
      R => s_dataIn00
    );
\s_dataIn1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn1_IBUF(5),
      Q => s_dataIn1(5),
      R => s_dataIn00
    );
\s_dataIn1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn1_IBUF(6),
      Q => s_dataIn1(6),
      R => s_dataIn00
    );
\s_dataIn1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn1_IBUF(7),
      Q => s_dataIn1(7),
      R => s_dataIn00
    );
\s_dataIn1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn1_IBUF(8),
      Q => s_dataIn1(8),
      R => s_dataIn00
    );
\s_dataIn1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn1_IBUF(9),
      Q => s_dataIn1(9),
      R => s_dataIn00
    );
\s_dataIn2[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => en_IBUF,
      I1 => res_IBUF,
      O => s_dataIn00
    );
\s_dataIn2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn2_IBUF(0),
      Q => s_dataIn2(0),
      R => s_dataIn00
    );
\s_dataIn2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn2_IBUF(1),
      Q => s_dataIn2(1),
      R => s_dataIn00
    );
\s_dataIn2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn2_IBUF(2),
      Q => s_dataIn2(2),
      R => s_dataIn00
    );
\s_dataIn2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn2_IBUF(3),
      Q => s_dataIn2(3),
      R => s_dataIn00
    );
\s_dataIn2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn2_IBUF(4),
      Q => s_dataIn2(4),
      R => s_dataIn00
    );
\s_dataIn2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn2_IBUF(5),
      Q => s_dataIn2(5),
      R => s_dataIn00
    );
\s_dataIn2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn2_IBUF(6),
      Q => s_dataIn2(6),
      R => s_dataIn00
    );
\s_dataIn2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn2_IBUF(7),
      Q => s_dataIn2(7),
      R => s_dataIn00
    );
\s_dataIn2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn2_IBUF(8),
      Q => s_dataIn2(8),
      R => s_dataIn00
    );
\s_dataIn2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn2_IBUF(9),
      Q => s_dataIn2(9),
      R => s_dataIn00
    );
\s_dataIn3_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn3_IBUF(0),
      Q => s_dataIn3(0),
      R => s_dataIn00
    );
\s_dataIn3_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn3_IBUF(1),
      Q => s_dataIn3(1),
      R => s_dataIn00
    );
\s_dataIn3_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn3_IBUF(2),
      Q => s_dataIn3(2),
      R => s_dataIn00
    );
\s_dataIn3_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn3_IBUF(3),
      Q => s_dataIn3(3),
      R => s_dataIn00
    );
\s_dataIn3_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn3_IBUF(4),
      Q => s_dataIn3(4),
      R => s_dataIn00
    );
\s_dataIn3_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn3_IBUF(5),
      Q => s_dataIn3(5),
      R => s_dataIn00
    );
\s_dataIn3_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn3_IBUF(6),
      Q => s_dataIn3(6),
      R => s_dataIn00
    );
\s_dataIn3_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn3_IBUF(7),
      Q => s_dataIn3(7),
      R => s_dataIn00
    );
\s_dataIn3_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn3_IBUF(8),
      Q => s_dataIn3(8),
      R => s_dataIn00
    );
\s_dataIn3_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => dataIn3_IBUF(9),
      Q => s_dataIn3(9),
      R => s_dataIn00
    );
s_dataOut0_reg: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 1,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 1,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "CASCADE",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 0,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 1,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => true,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29) => dataIn1_IBUF(9),
      A(28) => dataIn1_IBUF(9),
      A(27) => dataIn1_IBUF(9),
      A(26) => dataIn1_IBUF(9),
      A(25) => dataIn1_IBUF(9),
      A(24) => dataIn1_IBUF(9),
      A(23) => dataIn1_IBUF(9),
      A(22) => dataIn1_IBUF(9),
      A(21) => dataIn1_IBUF(9),
      A(20) => dataIn1_IBUF(9),
      A(19) => dataIn1_IBUF(9),
      A(18) => dataIn1_IBUF(9),
      A(17) => dataIn1_IBUF(9),
      A(16) => dataIn1_IBUF(9),
      A(15) => dataIn1_IBUF(9),
      A(14) => dataIn1_IBUF(9),
      A(13) => dataIn1_IBUF(9),
      A(12) => dataIn1_IBUF(9),
      A(11) => dataIn1_IBUF(9),
      A(10) => dataIn1_IBUF(9),
      A(9 downto 0) => dataIn1_IBUF(9 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_s_dataOut0_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 0) => B"000000000000000000",
      BCIN(17) => s_stg2M0_reg_n_6,
      BCIN(16) => s_stg2M0_reg_n_7,
      BCIN(15) => s_stg2M0_reg_n_8,
      BCIN(14) => s_stg2M0_reg_n_9,
      BCIN(13) => s_stg2M0_reg_n_10,
      BCIN(12) => s_stg2M0_reg_n_11,
      BCIN(11) => s_stg2M0_reg_n_12,
      BCIN(10) => s_stg2M0_reg_n_13,
      BCIN(9) => s_stg2M0_reg_n_14,
      BCIN(8) => s_stg2M0_reg_n_15,
      BCIN(7) => s_stg2M0_reg_n_16,
      BCIN(6) => s_stg2M0_reg_n_17,
      BCIN(5) => s_stg2M0_reg_n_18,
      BCIN(4) => s_stg2M0_reg_n_19,
      BCIN(3) => s_stg2M0_reg_n_20,
      BCIN(2) => s_stg2M0_reg_n_21,
      BCIN(1) => s_stg2M0_reg_n_22,
      BCIN(0) => s_stg2M0_reg_n_23,
      BCOUT(17 downto 0) => NLW_s_dataOut0_reg_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_s_dataOut0_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_s_dataOut0_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => en_IBUF,
      CEAD => s_stage1En,
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => s_stage2MEn,
      CEP => s_stage2AEn,
      CLK => clk_IBUF_BUFG,
      D(24) => s_dataIn2(9),
      D(23) => s_dataIn2(9),
      D(22) => s_dataIn2(9),
      D(21) => s_dataIn2(9),
      D(20) => s_dataIn2(9),
      D(19) => s_dataIn2(9),
      D(18) => s_dataIn2(9),
      D(17) => s_dataIn2(9),
      D(16) => s_dataIn2(9),
      D(15) => s_dataIn2(9),
      D(14) => s_dataIn2(9),
      D(13) => s_dataIn2(9),
      D(12) => s_dataIn2(9),
      D(11) => s_dataIn2(9),
      D(10) => s_dataIn2(9),
      D(9 downto 0) => s_dataIn2(9 downto 0),
      INMODE(4 downto 0) => B"00100",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_s_dataOut0_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0010101",
      OVERFLOW => NLW_s_dataOut0_reg_OVERFLOW_UNCONNECTED,
      P(47 downto 23) => NLW_s_dataOut0_reg_P_UNCONNECTED(47 downto 23),
      P(22 downto 8) => p_0_in(14 downto 0),
      P(7) => s_dataOut0_reg_n_98,
      P(6) => s_dataOut0_reg_n_99,
      P(5) => s_dataOut0_reg_n_100,
      P(4) => s_dataOut0_reg_n_101,
      P(3) => s_dataOut0_reg_n_102,
      P(2) => s_dataOut0_reg_n_103,
      P(1) => s_dataOut0_reg_n_104,
      P(0) => s_dataOut0_reg_n_105,
      PATTERNBDETECT => NLW_s_dataOut0_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_s_dataOut0_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47) => s_stg2M0_reg_n_106,
      PCIN(46) => s_stg2M0_reg_n_107,
      PCIN(45) => s_stg2M0_reg_n_108,
      PCIN(44) => s_stg2M0_reg_n_109,
      PCIN(43) => s_stg2M0_reg_n_110,
      PCIN(42) => s_stg2M0_reg_n_111,
      PCIN(41) => s_stg2M0_reg_n_112,
      PCIN(40) => s_stg2M0_reg_n_113,
      PCIN(39) => s_stg2M0_reg_n_114,
      PCIN(38) => s_stg2M0_reg_n_115,
      PCIN(37) => s_stg2M0_reg_n_116,
      PCIN(36) => s_stg2M0_reg_n_117,
      PCIN(35) => s_stg2M0_reg_n_118,
      PCIN(34) => s_stg2M0_reg_n_119,
      PCIN(33) => s_stg2M0_reg_n_120,
      PCIN(32) => s_stg2M0_reg_n_121,
      PCIN(31) => s_stg2M0_reg_n_122,
      PCIN(30) => s_stg2M0_reg_n_123,
      PCIN(29) => s_stg2M0_reg_n_124,
      PCIN(28) => s_stg2M0_reg_n_125,
      PCIN(27) => s_stg2M0_reg_n_126,
      PCIN(26) => s_stg2M0_reg_n_127,
      PCIN(25) => s_stg2M0_reg_n_128,
      PCIN(24) => s_stg2M0_reg_n_129,
      PCIN(23) => s_stg2M0_reg_n_130,
      PCIN(22) => s_stg2M0_reg_n_131,
      PCIN(21) => s_stg2M0_reg_n_132,
      PCIN(20) => s_stg2M0_reg_n_133,
      PCIN(19) => s_stg2M0_reg_n_134,
      PCIN(18) => s_stg2M0_reg_n_135,
      PCIN(17) => s_stg2M0_reg_n_136,
      PCIN(16) => s_stg2M0_reg_n_137,
      PCIN(15) => s_stg2M0_reg_n_138,
      PCIN(14) => s_stg2M0_reg_n_139,
      PCIN(13) => s_stg2M0_reg_n_140,
      PCIN(12) => s_stg2M0_reg_n_141,
      PCIN(11) => s_stg2M0_reg_n_142,
      PCIN(10) => s_stg2M0_reg_n_143,
      PCIN(9) => s_stg2M0_reg_n_144,
      PCIN(8) => s_stg2M0_reg_n_145,
      PCIN(7) => s_stg2M0_reg_n_146,
      PCIN(6) => s_stg2M0_reg_n_147,
      PCIN(5) => s_stg2M0_reg_n_148,
      PCIN(4) => s_stg2M0_reg_n_149,
      PCIN(3) => s_stg2M0_reg_n_150,
      PCIN(2) => s_stg2M0_reg_n_151,
      PCIN(1) => s_stg2M0_reg_n_152,
      PCIN(0) => s_stg2M0_reg_n_153,
      PCOUT(47 downto 0) => NLW_s_dataOut0_reg_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => s_dataIn00,
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => s_stg1Out00,
      RSTINMODE => '0',
      RSTM => s_stg2M00,
      RSTP => s_dataOut00,
      UNDERFLOW => NLW_s_dataOut0_reg_UNDERFLOW_UNCONNECTED
    );
s_dataOut0_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_stage2AEn,
      I1 => res_IBUF,
      O => s_dataOut00
    );
s_dataOut1_reg: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 1,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 1,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 0,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 1,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => true,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29) => dataIn3_IBUF(9),
      A(28) => dataIn3_IBUF(9),
      A(27) => dataIn3_IBUF(9),
      A(26) => dataIn3_IBUF(9),
      A(25) => dataIn3_IBUF(9),
      A(24) => dataIn3_IBUF(9),
      A(23) => dataIn3_IBUF(9),
      A(22) => dataIn3_IBUF(9),
      A(21) => dataIn3_IBUF(9),
      A(20) => dataIn3_IBUF(9),
      A(19) => dataIn3_IBUF(9),
      A(18) => dataIn3_IBUF(9),
      A(17) => dataIn3_IBUF(9),
      A(16) => dataIn3_IBUF(9),
      A(15) => dataIn3_IBUF(9),
      A(14) => dataIn3_IBUF(9),
      A(13) => dataIn3_IBUF(9),
      A(12) => dataIn3_IBUF(9),
      A(11) => dataIn3_IBUF(9),
      A(10) => dataIn3_IBUF(9),
      A(9 downto 0) => dataIn3_IBUF(9 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_s_dataOut1_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 0) => B"000000000011101101",
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_s_dataOut1_reg_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_s_dataOut1_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_s_dataOut1_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => en_IBUF,
      CEAD => s_stage1En,
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => s_stage2MEn,
      CEP => s_stage2AEn,
      CLK => clk_IBUF_BUFG,
      D(24) => s_dataIn0(9),
      D(23) => s_dataIn0(9),
      D(22) => s_dataIn0(9),
      D(21) => s_dataIn0(9),
      D(20) => s_dataIn0(9),
      D(19) => s_dataIn0(9),
      D(18) => s_dataIn0(9),
      D(17) => s_dataIn0(9),
      D(16) => s_dataIn0(9),
      D(15) => s_dataIn0(9),
      D(14) => s_dataIn0(9),
      D(13) => s_dataIn0(9),
      D(12) => s_dataIn0(9),
      D(11) => s_dataIn0(9),
      D(10) => s_dataIn0(9),
      D(9 downto 0) => s_dataIn0(9 downto 0),
      INMODE(4 downto 0) => B"01100",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_s_dataOut1_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0010101",
      OVERFLOW => NLW_s_dataOut1_reg_OVERFLOW_UNCONNECTED,
      P(47 downto 23) => NLW_s_dataOut1_reg_P_UNCONNECTED(47 downto 23),
      P(22) => s_dataOut1_reg_n_83,
      P(21) => s_dataOut1_reg_n_84,
      P(20) => s_dataOut1_reg_n_85,
      P(19) => s_dataOut1_reg_n_86,
      P(18) => s_dataOut1_reg_n_87,
      P(17) => s_dataOut1_reg_n_88,
      P(16) => s_dataOut1_reg_n_89,
      P(15) => s_dataOut1_reg_n_90,
      P(14) => s_dataOut1_reg_n_91,
      P(13) => s_dataOut1_reg_n_92,
      P(12) => s_dataOut1_reg_n_93,
      P(11) => s_dataOut1_reg_n_94,
      P(10) => s_dataOut1_reg_n_95,
      P(9) => s_dataOut1_reg_n_96,
      P(8) => s_dataOut1_reg_n_97,
      P(7) => s_dataOut1_reg_n_98,
      P(6) => s_dataOut1_reg_n_99,
      P(5) => s_dataOut1_reg_n_100,
      P(4) => s_dataOut1_reg_n_101,
      P(3) => s_dataOut1_reg_n_102,
      P(2) => s_dataOut1_reg_n_103,
      P(1) => s_dataOut1_reg_n_104,
      P(0) => s_dataOut1_reg_n_105,
      PATTERNBDETECT => NLW_s_dataOut1_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_s_dataOut1_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47) => s_stg2M21_reg_n_106,
      PCIN(46) => s_stg2M21_reg_n_107,
      PCIN(45) => s_stg2M21_reg_n_108,
      PCIN(44) => s_stg2M21_reg_n_109,
      PCIN(43) => s_stg2M21_reg_n_110,
      PCIN(42) => s_stg2M21_reg_n_111,
      PCIN(41) => s_stg2M21_reg_n_112,
      PCIN(40) => s_stg2M21_reg_n_113,
      PCIN(39) => s_stg2M21_reg_n_114,
      PCIN(38) => s_stg2M21_reg_n_115,
      PCIN(37) => s_stg2M21_reg_n_116,
      PCIN(36) => s_stg2M21_reg_n_117,
      PCIN(35) => s_stg2M21_reg_n_118,
      PCIN(34) => s_stg2M21_reg_n_119,
      PCIN(33) => s_stg2M21_reg_n_120,
      PCIN(32) => s_stg2M21_reg_n_121,
      PCIN(31) => s_stg2M21_reg_n_122,
      PCIN(30) => s_stg2M21_reg_n_123,
      PCIN(29) => s_stg2M21_reg_n_124,
      PCIN(28) => s_stg2M21_reg_n_125,
      PCIN(27) => s_stg2M21_reg_n_126,
      PCIN(26) => s_stg2M21_reg_n_127,
      PCIN(25) => s_stg2M21_reg_n_128,
      PCIN(24) => s_stg2M21_reg_n_129,
      PCIN(23) => s_stg2M21_reg_n_130,
      PCIN(22) => s_stg2M21_reg_n_131,
      PCIN(21) => s_stg2M21_reg_n_132,
      PCIN(20) => s_stg2M21_reg_n_133,
      PCIN(19) => s_stg2M21_reg_n_134,
      PCIN(18) => s_stg2M21_reg_n_135,
      PCIN(17) => s_stg2M21_reg_n_136,
      PCIN(16) => s_stg2M21_reg_n_137,
      PCIN(15) => s_stg2M21_reg_n_138,
      PCIN(14) => s_stg2M21_reg_n_139,
      PCIN(13) => s_stg2M21_reg_n_140,
      PCIN(12) => s_stg2M21_reg_n_141,
      PCIN(11) => s_stg2M21_reg_n_142,
      PCIN(10) => s_stg2M21_reg_n_143,
      PCIN(9) => s_stg2M21_reg_n_144,
      PCIN(8) => s_stg2M21_reg_n_145,
      PCIN(7) => s_stg2M21_reg_n_146,
      PCIN(6) => s_stg2M21_reg_n_147,
      PCIN(5) => s_stg2M21_reg_n_148,
      PCIN(4) => s_stg2M21_reg_n_149,
      PCIN(3) => s_stg2M21_reg_n_150,
      PCIN(2) => s_stg2M21_reg_n_151,
      PCIN(1) => s_stg2M21_reg_n_152,
      PCIN(0) => s_stg2M21_reg_n_153,
      PCOUT(47 downto 0) => NLW_s_dataOut1_reg_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => s_dataIn00,
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => s_stg1Out00,
      RSTINMODE => '0',
      RSTM => s_stg2M00,
      RSTP => s_dataOut00,
      UNDERFLOW => NLW_s_dataOut1_reg_UNDERFLOW_UNCONNECTED
    );
s_dataOut2_reg: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 1,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 1,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 0,
      DREG => 0,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 1,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => true,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29) => dataIn2_IBUF(9),
      A(28) => dataIn2_IBUF(9),
      A(27) => dataIn2_IBUF(9),
      A(26) => dataIn2_IBUF(9),
      A(25) => dataIn2_IBUF(9),
      A(24) => dataIn2_IBUF(9),
      A(23) => dataIn2_IBUF(9),
      A(22) => dataIn2_IBUF(9),
      A(21) => dataIn2_IBUF(9),
      A(20) => dataIn2_IBUF(9),
      A(19) => dataIn2_IBUF(9),
      A(18) => dataIn2_IBUF(9),
      A(17) => dataIn2_IBUF(9),
      A(16) => dataIn2_IBUF(9),
      A(15) => dataIn2_IBUF(9),
      A(14) => dataIn2_IBUF(9),
      A(13) => dataIn2_IBUF(9),
      A(12) => dataIn2_IBUF(9),
      A(11) => dataIn2_IBUF(9),
      A(10) => dataIn2_IBUF(9),
      A(9 downto 0) => dataIn2_IBUF(9 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_s_dataOut2_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0011",
      B(17 downto 0) => B"000000000010110101",
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_s_dataOut2_reg_BCOUT_UNCONNECTED(17 downto 0),
      C(47) => s_stg2M0_reg_n_86,
      C(46) => s_stg2M0_reg_n_86,
      C(45) => s_stg2M0_reg_n_86,
      C(44) => s_stg2M0_reg_n_86,
      C(43) => s_stg2M0_reg_n_86,
      C(42) => s_stg2M0_reg_n_86,
      C(41) => s_stg2M0_reg_n_86,
      C(40) => s_stg2M0_reg_n_86,
      C(39) => s_stg2M0_reg_n_86,
      C(38) => s_stg2M0_reg_n_86,
      C(37) => s_stg2M0_reg_n_86,
      C(36) => s_stg2M0_reg_n_86,
      C(35) => s_stg2M0_reg_n_86,
      C(34) => s_stg2M0_reg_n_86,
      C(33) => s_stg2M0_reg_n_86,
      C(32) => s_stg2M0_reg_n_86,
      C(31) => s_stg2M0_reg_n_86,
      C(30) => s_stg2M0_reg_n_86,
      C(29) => s_stg2M0_reg_n_86,
      C(28) => s_stg2M0_reg_n_86,
      C(27) => s_stg2M0_reg_n_86,
      C(26) => s_stg2M0_reg_n_86,
      C(25) => s_stg2M0_reg_n_86,
      C(24) => s_stg2M0_reg_n_86,
      C(23) => s_stg2M0_reg_n_86,
      C(22) => s_stg2M0_reg_n_86,
      C(21) => s_stg2M0_reg_n_86,
      C(20) => s_stg2M0_reg_n_86,
      C(19) => s_stg2M0_reg_n_86,
      C(18) => s_stg2M0_reg_n_87,
      C(17) => s_stg2M0_reg_n_88,
      C(16) => s_stg2M0_reg_n_89,
      C(15) => s_stg2M0_reg_n_90,
      C(14) => s_stg2M0_reg_n_91,
      C(13) => s_stg2M0_reg_n_92,
      C(12) => s_stg2M0_reg_n_93,
      C(11) => s_stg2M0_reg_n_94,
      C(10) => s_stg2M0_reg_n_95,
      C(9) => s_stg2M0_reg_n_96,
      C(8) => s_stg2M0_reg_n_97,
      C(7) => s_stg2M0_reg_n_98,
      C(6) => s_stg2M0_reg_n_99,
      C(5) => s_stg2M0_reg_n_100,
      C(4) => s_stg2M0_reg_n_101,
      C(3) => s_stg2M0_reg_n_102,
      C(2) => s_stg2M0_reg_n_103,
      C(1) => s_stg2M0_reg_n_104,
      C(0) => s_stg2M0_reg_n_105,
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_s_dataOut2_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_s_dataOut2_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => en_IBUF,
      CEAD => s_stage1En,
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => s_stage2MEn,
      CEP => s_stage2AEn,
      CLK => clk_IBUF_BUFG,
      D(24) => s_dataIn1(9),
      D(23) => s_dataIn1(9),
      D(22) => s_dataIn1(9),
      D(21) => s_dataIn1(9),
      D(20) => s_dataIn1(9),
      D(19) => s_dataIn1(9),
      D(18) => s_dataIn1(9),
      D(17) => s_dataIn1(9),
      D(16) => s_dataIn1(9),
      D(15) => s_dataIn1(9),
      D(14) => s_dataIn1(9),
      D(13) => s_dataIn1(9),
      D(12) => s_dataIn1(9),
      D(11) => s_dataIn1(9),
      D(10) => s_dataIn1(9),
      D(9 downto 0) => s_dataIn1(9 downto 0),
      INMODE(4 downto 0) => B"00100",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_s_dataOut2_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0110101",
      OVERFLOW => NLW_s_dataOut2_reg_OVERFLOW_UNCONNECTED,
      P(47 downto 23) => NLW_s_dataOut2_reg_P_UNCONNECTED(47 downto 23),
      P(22) => s_dataOut2_reg_n_83,
      P(21) => s_dataOut2_reg_n_84,
      P(20) => s_dataOut2_reg_n_85,
      P(19) => s_dataOut2_reg_n_86,
      P(18) => s_dataOut2_reg_n_87,
      P(17) => s_dataOut2_reg_n_88,
      P(16) => s_dataOut2_reg_n_89,
      P(15) => s_dataOut2_reg_n_90,
      P(14) => s_dataOut2_reg_n_91,
      P(13) => s_dataOut2_reg_n_92,
      P(12) => s_dataOut2_reg_n_93,
      P(11) => s_dataOut2_reg_n_94,
      P(10) => s_dataOut2_reg_n_95,
      P(9) => s_dataOut2_reg_n_96,
      P(8) => s_dataOut2_reg_n_97,
      P(7) => s_dataOut2_reg_n_98,
      P(6) => s_dataOut2_reg_n_99,
      P(5) => s_dataOut2_reg_n_100,
      P(4) => s_dataOut2_reg_n_101,
      P(3) => s_dataOut2_reg_n_102,
      P(2) => s_dataOut2_reg_n_103,
      P(1) => s_dataOut2_reg_n_104,
      P(0) => s_dataOut2_reg_n_105,
      PATTERNBDETECT => NLW_s_dataOut2_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_s_dataOut2_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => NLW_s_dataOut2_reg_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => s_dataIn00,
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => s_stg1Out00,
      RSTINMODE => '0',
      RSTM => s_stg2M00,
      RSTP => s_dataOut00,
      UNDERFLOW => NLW_s_dataOut2_reg_UNDERFLOW_UNCONNECTED
    );
s_dataOut3_reg: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 1,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 1,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 0,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 1,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => true,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29) => dataIn2_IBUF(9),
      A(28) => dataIn2_IBUF(9),
      A(27) => dataIn2_IBUF(9),
      A(26) => dataIn2_IBUF(9),
      A(25) => dataIn2_IBUF(9),
      A(24) => dataIn2_IBUF(9),
      A(23) => dataIn2_IBUF(9),
      A(22) => dataIn2_IBUF(9),
      A(21) => dataIn2_IBUF(9),
      A(20) => dataIn2_IBUF(9),
      A(19) => dataIn2_IBUF(9),
      A(18) => dataIn2_IBUF(9),
      A(17) => dataIn2_IBUF(9),
      A(16) => dataIn2_IBUF(9),
      A(15) => dataIn2_IBUF(9),
      A(14) => dataIn2_IBUF(9),
      A(13) => dataIn2_IBUF(9),
      A(12) => dataIn2_IBUF(9),
      A(11) => dataIn2_IBUF(9),
      A(10) => dataIn2_IBUF(9),
      A(9 downto 0) => dataIn2_IBUF(9 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_s_dataOut3_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0011",
      B(17 downto 0) => B"000000000011101101",
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_s_dataOut3_reg_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_s_dataOut3_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_s_dataOut3_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => en_IBUF,
      CEAD => s_stage1En,
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => s_stage2MEn,
      CEP => s_stage2AEn,
      CLK => clk_IBUF_BUFG,
      D(24) => s_dataIn1(9),
      D(23) => s_dataIn1(9),
      D(22) => s_dataIn1(9),
      D(21) => s_dataIn1(9),
      D(20) => s_dataIn1(9),
      D(19) => s_dataIn1(9),
      D(18) => s_dataIn1(9),
      D(17) => s_dataIn1(9),
      D(16) => s_dataIn1(9),
      D(15) => s_dataIn1(9),
      D(14) => s_dataIn1(9),
      D(13) => s_dataIn1(9),
      D(12) => s_dataIn1(9),
      D(11) => s_dataIn1(9),
      D(10) => s_dataIn1(9),
      D(9 downto 0) => s_dataIn1(9 downto 0),
      INMODE(4 downto 0) => B"01100",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_s_dataOut3_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0010101",
      OVERFLOW => NLW_s_dataOut3_reg_OVERFLOW_UNCONNECTED,
      P(47 downto 23) => NLW_s_dataOut3_reg_P_UNCONNECTED(47 downto 23),
      P(22) => s_dataOut3_reg_n_83,
      P(21) => s_dataOut3_reg_n_84,
      P(20) => s_dataOut3_reg_n_85,
      P(19) => s_dataOut3_reg_n_86,
      P(18) => s_dataOut3_reg_n_87,
      P(17) => s_dataOut3_reg_n_88,
      P(16) => s_dataOut3_reg_n_89,
      P(15) => s_dataOut3_reg_n_90,
      P(14) => s_dataOut3_reg_n_91,
      P(13) => s_dataOut3_reg_n_92,
      P(12) => s_dataOut3_reg_n_93,
      P(11) => s_dataOut3_reg_n_94,
      P(10) => s_dataOut3_reg_n_95,
      P(9) => s_dataOut3_reg_n_96,
      P(8) => s_dataOut3_reg_n_97,
      P(7) => s_dataOut3_reg_n_98,
      P(6) => s_dataOut3_reg_n_99,
      P(5) => s_dataOut3_reg_n_100,
      P(4) => s_dataOut3_reg_n_101,
      P(3) => s_dataOut3_reg_n_102,
      P(2) => s_dataOut3_reg_n_103,
      P(1) => s_dataOut3_reg_n_104,
      P(0) => s_dataOut3_reg_n_105,
      PATTERNBDETECT => NLW_s_dataOut3_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_s_dataOut3_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47) => s_stg2M31_reg_n_106,
      PCIN(46) => s_stg2M31_reg_n_107,
      PCIN(45) => s_stg2M31_reg_n_108,
      PCIN(44) => s_stg2M31_reg_n_109,
      PCIN(43) => s_stg2M31_reg_n_110,
      PCIN(42) => s_stg2M31_reg_n_111,
      PCIN(41) => s_stg2M31_reg_n_112,
      PCIN(40) => s_stg2M31_reg_n_113,
      PCIN(39) => s_stg2M31_reg_n_114,
      PCIN(38) => s_stg2M31_reg_n_115,
      PCIN(37) => s_stg2M31_reg_n_116,
      PCIN(36) => s_stg2M31_reg_n_117,
      PCIN(35) => s_stg2M31_reg_n_118,
      PCIN(34) => s_stg2M31_reg_n_119,
      PCIN(33) => s_stg2M31_reg_n_120,
      PCIN(32) => s_stg2M31_reg_n_121,
      PCIN(31) => s_stg2M31_reg_n_122,
      PCIN(30) => s_stg2M31_reg_n_123,
      PCIN(29) => s_stg2M31_reg_n_124,
      PCIN(28) => s_stg2M31_reg_n_125,
      PCIN(27) => s_stg2M31_reg_n_126,
      PCIN(26) => s_stg2M31_reg_n_127,
      PCIN(25) => s_stg2M31_reg_n_128,
      PCIN(24) => s_stg2M31_reg_n_129,
      PCIN(23) => s_stg2M31_reg_n_130,
      PCIN(22) => s_stg2M31_reg_n_131,
      PCIN(21) => s_stg2M31_reg_n_132,
      PCIN(20) => s_stg2M31_reg_n_133,
      PCIN(19) => s_stg2M31_reg_n_134,
      PCIN(18) => s_stg2M31_reg_n_135,
      PCIN(17) => s_stg2M31_reg_n_136,
      PCIN(16) => s_stg2M31_reg_n_137,
      PCIN(15) => s_stg2M31_reg_n_138,
      PCIN(14) => s_stg2M31_reg_n_139,
      PCIN(13) => s_stg2M31_reg_n_140,
      PCIN(12) => s_stg2M31_reg_n_141,
      PCIN(11) => s_stg2M31_reg_n_142,
      PCIN(10) => s_stg2M31_reg_n_143,
      PCIN(9) => s_stg2M31_reg_n_144,
      PCIN(8) => s_stg2M31_reg_n_145,
      PCIN(7) => s_stg2M31_reg_n_146,
      PCIN(6) => s_stg2M31_reg_n_147,
      PCIN(5) => s_stg2M31_reg_n_148,
      PCIN(4) => s_stg2M31_reg_n_149,
      PCIN(3) => s_stg2M31_reg_n_150,
      PCIN(2) => s_stg2M31_reg_n_151,
      PCIN(1) => s_stg2M31_reg_n_152,
      PCIN(0) => s_stg2M31_reg_n_153,
      PCOUT(47 downto 0) => NLW_s_dataOut3_reg_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => s_dataIn00,
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => s_stg1Out00,
      RSTINMODE => '0',
      RSTM => s_stg2M00,
      RSTP => s_dataOut00,
      UNDERFLOW => NLW_s_dataOut3_reg_UNDERFLOW_UNCONNECTED
    );
s_stage1En_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => res_IBUF,
      O => s_stage1En_i_1_n_0
    );
s_stage1En_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => en_IBUF,
      O => s_stage1En_i_2_n_0
    );
s_stage1En_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => s_stage1En_i_2_n_0,
      D => s_stage1En_i_1_n_0,
      Q => s_stage1En
    );
s_stage2AEn_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_stage2MEn,
      O => s_stage2AEn_i_1_n_0
    );
s_stage2AEn_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => s_stage2AEn_i_1_n_0,
      D => s_stage1En_i_1_n_0,
      Q => s_stage2AEn
    );
s_stage2MEn_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_stage1En,
      O => s_stage2MEn_i_1_n_0
    );
s_stage2MEn_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => s_stage2MEn_i_1_n_0,
      D => s_stage1En_i_1_n_0,
      Q => s_stage2MEn
    );
s_stg2M0_reg: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 1,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 1,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 0,
      DREG => 0,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => true,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29) => dataIn0_IBUF(9),
      A(28) => dataIn0_IBUF(9),
      A(27) => dataIn0_IBUF(9),
      A(26) => dataIn0_IBUF(9),
      A(25) => dataIn0_IBUF(9),
      A(24) => dataIn0_IBUF(9),
      A(23) => dataIn0_IBUF(9),
      A(22) => dataIn0_IBUF(9),
      A(21) => dataIn0_IBUF(9),
      A(20) => dataIn0_IBUF(9),
      A(19) => dataIn0_IBUF(9),
      A(18) => dataIn0_IBUF(9),
      A(17) => dataIn0_IBUF(9),
      A(16) => dataIn0_IBUF(9),
      A(15) => dataIn0_IBUF(9),
      A(14) => dataIn0_IBUF(9),
      A(13) => dataIn0_IBUF(9),
      A(12) => dataIn0_IBUF(9),
      A(11) => dataIn0_IBUF(9),
      A(10) => dataIn0_IBUF(9),
      A(9 downto 0) => dataIn0_IBUF(9 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_s_stg2M0_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 0) => B"000000000010110101",
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17) => s_stg2M0_reg_n_6,
      BCOUT(16) => s_stg2M0_reg_n_7,
      BCOUT(15) => s_stg2M0_reg_n_8,
      BCOUT(14) => s_stg2M0_reg_n_9,
      BCOUT(13) => s_stg2M0_reg_n_10,
      BCOUT(12) => s_stg2M0_reg_n_11,
      BCOUT(11) => s_stg2M0_reg_n_12,
      BCOUT(10) => s_stg2M0_reg_n_13,
      BCOUT(9) => s_stg2M0_reg_n_14,
      BCOUT(8) => s_stg2M0_reg_n_15,
      BCOUT(7) => s_stg2M0_reg_n_16,
      BCOUT(6) => s_stg2M0_reg_n_17,
      BCOUT(5) => s_stg2M0_reg_n_18,
      BCOUT(4) => s_stg2M0_reg_n_19,
      BCOUT(3) => s_stg2M0_reg_n_20,
      BCOUT(2) => s_stg2M0_reg_n_21,
      BCOUT(1) => s_stg2M0_reg_n_22,
      BCOUT(0) => s_stg2M0_reg_n_23,
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_s_stg2M0_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_s_stg2M0_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => en_IBUF,
      CEAD => s_stage1En,
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => s_stage2MEn,
      CLK => clk_IBUF_BUFG,
      D(24) => s_dataIn3(9),
      D(23) => s_dataIn3(9),
      D(22) => s_dataIn3(9),
      D(21) => s_dataIn3(9),
      D(20) => s_dataIn3(9),
      D(19) => s_dataIn3(9),
      D(18) => s_dataIn3(9),
      D(17) => s_dataIn3(9),
      D(16) => s_dataIn3(9),
      D(15) => s_dataIn3(9),
      D(14) => s_dataIn3(9),
      D(13) => s_dataIn3(9),
      D(12) => s_dataIn3(9),
      D(11) => s_dataIn3(9),
      D(10) => s_dataIn3(9),
      D(9 downto 0) => s_dataIn3(9 downto 0),
      INMODE(4 downto 0) => B"00100",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_s_stg2M0_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => NLW_s_stg2M0_reg_OVERFLOW_UNCONNECTED,
      P(47 downto 20) => NLW_s_stg2M0_reg_P_UNCONNECTED(47 downto 20),
      P(19) => s_stg2M0_reg_n_86,
      P(18) => s_stg2M0_reg_n_87,
      P(17) => s_stg2M0_reg_n_88,
      P(16) => s_stg2M0_reg_n_89,
      P(15) => s_stg2M0_reg_n_90,
      P(14) => s_stg2M0_reg_n_91,
      P(13) => s_stg2M0_reg_n_92,
      P(12) => s_stg2M0_reg_n_93,
      P(11) => s_stg2M0_reg_n_94,
      P(10) => s_stg2M0_reg_n_95,
      P(9) => s_stg2M0_reg_n_96,
      P(8) => s_stg2M0_reg_n_97,
      P(7) => s_stg2M0_reg_n_98,
      P(6) => s_stg2M0_reg_n_99,
      P(5) => s_stg2M0_reg_n_100,
      P(4) => s_stg2M0_reg_n_101,
      P(3) => s_stg2M0_reg_n_102,
      P(2) => s_stg2M0_reg_n_103,
      P(1) => s_stg2M0_reg_n_104,
      P(0) => s_stg2M0_reg_n_105,
      PATTERNBDETECT => NLW_s_stg2M0_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_s_stg2M0_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47) => s_stg2M0_reg_n_106,
      PCOUT(46) => s_stg2M0_reg_n_107,
      PCOUT(45) => s_stg2M0_reg_n_108,
      PCOUT(44) => s_stg2M0_reg_n_109,
      PCOUT(43) => s_stg2M0_reg_n_110,
      PCOUT(42) => s_stg2M0_reg_n_111,
      PCOUT(41) => s_stg2M0_reg_n_112,
      PCOUT(40) => s_stg2M0_reg_n_113,
      PCOUT(39) => s_stg2M0_reg_n_114,
      PCOUT(38) => s_stg2M0_reg_n_115,
      PCOUT(37) => s_stg2M0_reg_n_116,
      PCOUT(36) => s_stg2M0_reg_n_117,
      PCOUT(35) => s_stg2M0_reg_n_118,
      PCOUT(34) => s_stg2M0_reg_n_119,
      PCOUT(33) => s_stg2M0_reg_n_120,
      PCOUT(32) => s_stg2M0_reg_n_121,
      PCOUT(31) => s_stg2M0_reg_n_122,
      PCOUT(30) => s_stg2M0_reg_n_123,
      PCOUT(29) => s_stg2M0_reg_n_124,
      PCOUT(28) => s_stg2M0_reg_n_125,
      PCOUT(27) => s_stg2M0_reg_n_126,
      PCOUT(26) => s_stg2M0_reg_n_127,
      PCOUT(25) => s_stg2M0_reg_n_128,
      PCOUT(24) => s_stg2M0_reg_n_129,
      PCOUT(23) => s_stg2M0_reg_n_130,
      PCOUT(22) => s_stg2M0_reg_n_131,
      PCOUT(21) => s_stg2M0_reg_n_132,
      PCOUT(20) => s_stg2M0_reg_n_133,
      PCOUT(19) => s_stg2M0_reg_n_134,
      PCOUT(18) => s_stg2M0_reg_n_135,
      PCOUT(17) => s_stg2M0_reg_n_136,
      PCOUT(16) => s_stg2M0_reg_n_137,
      PCOUT(15) => s_stg2M0_reg_n_138,
      PCOUT(14) => s_stg2M0_reg_n_139,
      PCOUT(13) => s_stg2M0_reg_n_140,
      PCOUT(12) => s_stg2M0_reg_n_141,
      PCOUT(11) => s_stg2M0_reg_n_142,
      PCOUT(10) => s_stg2M0_reg_n_143,
      PCOUT(9) => s_stg2M0_reg_n_144,
      PCOUT(8) => s_stg2M0_reg_n_145,
      PCOUT(7) => s_stg2M0_reg_n_146,
      PCOUT(6) => s_stg2M0_reg_n_147,
      PCOUT(5) => s_stg2M0_reg_n_148,
      PCOUT(4) => s_stg2M0_reg_n_149,
      PCOUT(3) => s_stg2M0_reg_n_150,
      PCOUT(2) => s_stg2M0_reg_n_151,
      PCOUT(1) => s_stg2M0_reg_n_152,
      PCOUT(0) => s_stg2M0_reg_n_153,
      RSTA => s_dataIn00,
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => s_stg1Out00,
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => s_stg2M00,
      UNDERFLOW => NLW_s_stg2M0_reg_UNDERFLOW_UNCONNECTED
    );
s_stg2M0_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_stage1En,
      I1 => res_IBUF,
      O => s_stg1Out00
    );
s_stg2M0_reg_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_stage2MEn,
      I1 => res_IBUF,
      O => s_stg2M00
    );
s_stg2M21_reg: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 1,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 1,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 0,
      DREG => 0,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => true,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29) => dataIn2_IBUF(9),
      A(28) => dataIn2_IBUF(9),
      A(27) => dataIn2_IBUF(9),
      A(26) => dataIn2_IBUF(9),
      A(25) => dataIn2_IBUF(9),
      A(24) => dataIn2_IBUF(9),
      A(23) => dataIn2_IBUF(9),
      A(22) => dataIn2_IBUF(9),
      A(21) => dataIn2_IBUF(9),
      A(20) => dataIn2_IBUF(9),
      A(19) => dataIn2_IBUF(9),
      A(18) => dataIn2_IBUF(9),
      A(17) => dataIn2_IBUF(9),
      A(16) => dataIn2_IBUF(9),
      A(15) => dataIn2_IBUF(9),
      A(14) => dataIn2_IBUF(9),
      A(13) => dataIn2_IBUF(9),
      A(12) => dataIn2_IBUF(9),
      A(11) => dataIn2_IBUF(9),
      A(10) => dataIn2_IBUF(9),
      A(9 downto 0) => dataIn2_IBUF(9 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_s_stg2M21_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 0) => B"000000000001100010",
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_s_stg2M21_reg_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_s_stg2M21_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_s_stg2M21_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => en_IBUF,
      CEAD => s_stage1En,
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => s_stage2MEn,
      CLK => clk_IBUF_BUFG,
      D(24) => s_dataIn1(9),
      D(23) => s_dataIn1(9),
      D(22) => s_dataIn1(9),
      D(21) => s_dataIn1(9),
      D(20) => s_dataIn1(9),
      D(19) => s_dataIn1(9),
      D(18) => s_dataIn1(9),
      D(17) => s_dataIn1(9),
      D(16) => s_dataIn1(9),
      D(15) => s_dataIn1(9),
      D(14) => s_dataIn1(9),
      D(13) => s_dataIn1(9),
      D(12) => s_dataIn1(9),
      D(11) => s_dataIn1(9),
      D(10) => s_dataIn1(9),
      D(9 downto 0) => s_dataIn1(9 downto 0),
      INMODE(4 downto 0) => B"01100",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_s_stg2M21_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => NLW_s_stg2M21_reg_OVERFLOW_UNCONNECTED,
      P(47 downto 0) => NLW_s_stg2M21_reg_P_UNCONNECTED(47 downto 0),
      PATTERNBDETECT => NLW_s_stg2M21_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_s_stg2M21_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47) => s_stg2M21_reg_n_106,
      PCOUT(46) => s_stg2M21_reg_n_107,
      PCOUT(45) => s_stg2M21_reg_n_108,
      PCOUT(44) => s_stg2M21_reg_n_109,
      PCOUT(43) => s_stg2M21_reg_n_110,
      PCOUT(42) => s_stg2M21_reg_n_111,
      PCOUT(41) => s_stg2M21_reg_n_112,
      PCOUT(40) => s_stg2M21_reg_n_113,
      PCOUT(39) => s_stg2M21_reg_n_114,
      PCOUT(38) => s_stg2M21_reg_n_115,
      PCOUT(37) => s_stg2M21_reg_n_116,
      PCOUT(36) => s_stg2M21_reg_n_117,
      PCOUT(35) => s_stg2M21_reg_n_118,
      PCOUT(34) => s_stg2M21_reg_n_119,
      PCOUT(33) => s_stg2M21_reg_n_120,
      PCOUT(32) => s_stg2M21_reg_n_121,
      PCOUT(31) => s_stg2M21_reg_n_122,
      PCOUT(30) => s_stg2M21_reg_n_123,
      PCOUT(29) => s_stg2M21_reg_n_124,
      PCOUT(28) => s_stg2M21_reg_n_125,
      PCOUT(27) => s_stg2M21_reg_n_126,
      PCOUT(26) => s_stg2M21_reg_n_127,
      PCOUT(25) => s_stg2M21_reg_n_128,
      PCOUT(24) => s_stg2M21_reg_n_129,
      PCOUT(23) => s_stg2M21_reg_n_130,
      PCOUT(22) => s_stg2M21_reg_n_131,
      PCOUT(21) => s_stg2M21_reg_n_132,
      PCOUT(20) => s_stg2M21_reg_n_133,
      PCOUT(19) => s_stg2M21_reg_n_134,
      PCOUT(18) => s_stg2M21_reg_n_135,
      PCOUT(17) => s_stg2M21_reg_n_136,
      PCOUT(16) => s_stg2M21_reg_n_137,
      PCOUT(15) => s_stg2M21_reg_n_138,
      PCOUT(14) => s_stg2M21_reg_n_139,
      PCOUT(13) => s_stg2M21_reg_n_140,
      PCOUT(12) => s_stg2M21_reg_n_141,
      PCOUT(11) => s_stg2M21_reg_n_142,
      PCOUT(10) => s_stg2M21_reg_n_143,
      PCOUT(9) => s_stg2M21_reg_n_144,
      PCOUT(8) => s_stg2M21_reg_n_145,
      PCOUT(7) => s_stg2M21_reg_n_146,
      PCOUT(6) => s_stg2M21_reg_n_147,
      PCOUT(5) => s_stg2M21_reg_n_148,
      PCOUT(4) => s_stg2M21_reg_n_149,
      PCOUT(3) => s_stg2M21_reg_n_150,
      PCOUT(2) => s_stg2M21_reg_n_151,
      PCOUT(1) => s_stg2M21_reg_n_152,
      PCOUT(0) => s_stg2M21_reg_n_153,
      RSTA => s_dataIn00,
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => s_stg1Out00,
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => s_stg2M00,
      UNDERFLOW => NLW_s_stg2M21_reg_UNDERFLOW_UNCONNECTED
    );
s_stg2M31_reg: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 1,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 1,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 0,
      DREG => 0,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => true,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29) => dataIn3_IBUF(9),
      A(28) => dataIn3_IBUF(9),
      A(27) => dataIn3_IBUF(9),
      A(26) => dataIn3_IBUF(9),
      A(25) => dataIn3_IBUF(9),
      A(24) => dataIn3_IBUF(9),
      A(23) => dataIn3_IBUF(9),
      A(22) => dataIn3_IBUF(9),
      A(21) => dataIn3_IBUF(9),
      A(20) => dataIn3_IBUF(9),
      A(19) => dataIn3_IBUF(9),
      A(18) => dataIn3_IBUF(9),
      A(17) => dataIn3_IBUF(9),
      A(16) => dataIn3_IBUF(9),
      A(15) => dataIn3_IBUF(9),
      A(14) => dataIn3_IBUF(9),
      A(13) => dataIn3_IBUF(9),
      A(12) => dataIn3_IBUF(9),
      A(11) => dataIn3_IBUF(9),
      A(10) => dataIn3_IBUF(9),
      A(9 downto 0) => dataIn3_IBUF(9 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_s_stg2M31_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 0) => B"000000000001100010",
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_s_stg2M31_reg_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_s_stg2M31_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_s_stg2M31_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => en_IBUF,
      CEAD => s_stage1En,
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => s_stage2MEn,
      CLK => clk_IBUF_BUFG,
      D(24) => s_dataIn0(9),
      D(23) => s_dataIn0(9),
      D(22) => s_dataIn0(9),
      D(21) => s_dataIn0(9),
      D(20) => s_dataIn0(9),
      D(19) => s_dataIn0(9),
      D(18) => s_dataIn0(9),
      D(17) => s_dataIn0(9),
      D(16) => s_dataIn0(9),
      D(15) => s_dataIn0(9),
      D(14) => s_dataIn0(9),
      D(13) => s_dataIn0(9),
      D(12) => s_dataIn0(9),
      D(11) => s_dataIn0(9),
      D(10) => s_dataIn0(9),
      D(9 downto 0) => s_dataIn0(9 downto 0),
      INMODE(4 downto 0) => B"01100",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_s_stg2M31_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => NLW_s_stg2M31_reg_OVERFLOW_UNCONNECTED,
      P(47 downto 0) => NLW_s_stg2M31_reg_P_UNCONNECTED(47 downto 0),
      PATTERNBDETECT => NLW_s_stg2M31_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_s_stg2M31_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47) => s_stg2M31_reg_n_106,
      PCOUT(46) => s_stg2M31_reg_n_107,
      PCOUT(45) => s_stg2M31_reg_n_108,
      PCOUT(44) => s_stg2M31_reg_n_109,
      PCOUT(43) => s_stg2M31_reg_n_110,
      PCOUT(42) => s_stg2M31_reg_n_111,
      PCOUT(41) => s_stg2M31_reg_n_112,
      PCOUT(40) => s_stg2M31_reg_n_113,
      PCOUT(39) => s_stg2M31_reg_n_114,
      PCOUT(38) => s_stg2M31_reg_n_115,
      PCOUT(37) => s_stg2M31_reg_n_116,
      PCOUT(36) => s_stg2M31_reg_n_117,
      PCOUT(35) => s_stg2M31_reg_n_118,
      PCOUT(34) => s_stg2M31_reg_n_119,
      PCOUT(33) => s_stg2M31_reg_n_120,
      PCOUT(32) => s_stg2M31_reg_n_121,
      PCOUT(31) => s_stg2M31_reg_n_122,
      PCOUT(30) => s_stg2M31_reg_n_123,
      PCOUT(29) => s_stg2M31_reg_n_124,
      PCOUT(28) => s_stg2M31_reg_n_125,
      PCOUT(27) => s_stg2M31_reg_n_126,
      PCOUT(26) => s_stg2M31_reg_n_127,
      PCOUT(25) => s_stg2M31_reg_n_128,
      PCOUT(24) => s_stg2M31_reg_n_129,
      PCOUT(23) => s_stg2M31_reg_n_130,
      PCOUT(22) => s_stg2M31_reg_n_131,
      PCOUT(21) => s_stg2M31_reg_n_132,
      PCOUT(20) => s_stg2M31_reg_n_133,
      PCOUT(19) => s_stg2M31_reg_n_134,
      PCOUT(18) => s_stg2M31_reg_n_135,
      PCOUT(17) => s_stg2M31_reg_n_136,
      PCOUT(16) => s_stg2M31_reg_n_137,
      PCOUT(15) => s_stg2M31_reg_n_138,
      PCOUT(14) => s_stg2M31_reg_n_139,
      PCOUT(13) => s_stg2M31_reg_n_140,
      PCOUT(12) => s_stg2M31_reg_n_141,
      PCOUT(11) => s_stg2M31_reg_n_142,
      PCOUT(10) => s_stg2M31_reg_n_143,
      PCOUT(9) => s_stg2M31_reg_n_144,
      PCOUT(8) => s_stg2M31_reg_n_145,
      PCOUT(7) => s_stg2M31_reg_n_146,
      PCOUT(6) => s_stg2M31_reg_n_147,
      PCOUT(5) => s_stg2M31_reg_n_148,
      PCOUT(4) => s_stg2M31_reg_n_149,
      PCOUT(3) => s_stg2M31_reg_n_150,
      PCOUT(2) => s_stg2M31_reg_n_151,
      PCOUT(1) => s_stg2M31_reg_n_152,
      PCOUT(0) => s_stg2M31_reg_n_153,
      RSTA => s_dataIn00,
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => s_stg1Out00,
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => s_stg2M00,
      UNDERFLOW => NLW_s_stg2M31_reg_UNDERFLOW_UNCONNECTED
    );
s_valOut_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_stage2AEn,
      O => s_valOut_i_1_n_0
    );
s_valOut_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => s_valOut_i_1_n_0,
      D => s_stage1En_i_1_n_0,
      Q => s_valOut
    );
validOut_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => validOut_OBUF,
      O => validOut
    );
validOut_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => s_valOut,
      D => s_stage1En_i_1_n_0,
      Q => validOut_OBUF,
      R => '0'
    );
end STRUCTURE;
