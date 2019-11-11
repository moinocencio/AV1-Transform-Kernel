----------------------------------------------------------------------------------
-- DCT32 Implementation, with same # bits in input and output and internal integer
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DCT32_1_I is
    port(   -- Data Inputs
            dataIn0      : in    integer;
            dataIn1      : in    integer;
            dataIn2      : in    integer;
            dataIn3      : in    integer;
            dataIn4      : in    integer;
            dataIn5      : in    integer;
            dataIn6      : in    integer;
            dataIn7      : in    integer;
            dataIn8      : in    integer;
            dataIn9      : in    integer;
            dataIn10     : in    integer;
            dataIn11     : in    integer;
            dataIn12     : in    integer;
            dataIn13     : in    integer;
            dataIn14     : in    integer;
            dataIn15     : in    integer;
            dataIn16     : in    integer;
            dataIn17     : in    integer;
            dataIn18     : in    integer;
            dataIn19     : in    integer;
            dataIn20     : in    integer;
            dataIn21     : in    integer;
            dataIn22     : in    integer;
            dataIn23     : in    integer;
            dataIn24     : in    integer;
            dataIn25     : in    integer;
            dataIn26     : in    integer;
            dataIn27     : in    integer;
            dataIn28     : in    integer;
            dataIn29     : in    integer;
            dataIn30     : in    integer;
            dataIn31     : in    integer;
            -- Control Inputs
            res         : in    std_logic;
            en          : in    std_logic;
            clk         : in    std_logic;
            -- Data Outputs
            dataOut0      : out    integer;
            dataOut1      : out    integer;
            dataOut2      : out    integer;
            dataOut3      : out    integer;
            dataOut4      : out    integer;
            dataOut5      : out    integer;
            dataOut6      : out    integer;
            dataOut7      : out    integer;
            dataOut8      : out    integer;
            dataOut9      : out    integer;
            dataOut10     : out    integer;
            dataOut11     : out    integer;
            dataOut12     : out    integer;
            dataOut13     : out    integer;
            dataOut14     : out    integer;
            dataOut15     : out    integer;
            dataOut16     : out    integer;
            dataOut17     : out    integer;
            dataOut18     : out    integer;
            dataOut19     : out    integer;
            dataOut20     : out    integer;
            dataOut21     : out    integer;
            dataOut22     : out    integer;
            dataOut23     : out    integer;
            dataOut24     : out    integer;
            dataOut25     : out    integer;
            dataOut26     : out    integer;
            dataOut27     : out    integer;
            dataOut28     : out    integer;
            dataOut29     : out    integer;
            dataOut30     : out    integer;
            dataOut31     : out    integer;
            -- Control Outputs
            validOut    : out   std_logic
    );
end DCT32_1_I;

architecture Behavioral of DCT32_1_I is
begin
    stage1:     process(clk, res, en)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            dataIn0  <= 0;
                            dataIn1  <= 0;
                            dataIn2  <= 0;
                            dataIn3  <= 0;
                            dataIn4  <= 0;
                            dataIn5  <= 0;
                            dataIn6  <= 0;
                            dataIn7  <= 0;
                            dataIn8  <= 0;
                            dataIn9  <= 0;
                            dataIn10 <= 0;
                            dataIn11 <= 0;
                            dataIn12 <= 0;
                            dataIn13 <= 0;
                            dataIn14 <= 0;
                            dataIn15 <= 0;
                            dataIn16 <= 0;
                            dataIn17 <= 0;
                            dataIn18 <= 0;
                            dataIn19 <= 0;
                            dataIn20 <= 0;
                            dataIn21 <= 0;
                            dataIn22 <= 0;
                            dataIn23 <= 0;
                            dataIn24 <= 0;
                            dataIn25 <= 0;
                            dataIn26 <= 0;
                            dataIn27 <= 0;
                            dataIn28 <= 0;
                            dataIn29 <= 0;
                            dataIn30 <= 0;
                            dataIn31 <= 0;
                            validOut <= '0';
                        elsif(en = '1') then
                            dataOut0  <= dataIn0 + dataIn31;
                            dataOut1  <= dataIn1 + dataIn30;
                            dataOut2  <= dataIn2 + dataIn29;
                            dataOut3  <= dataIn3 + dataIn28;
                            dataOut4  <= dataIn4 + dataIn27;
                            dataOut5  <= dataIn5 + dataIn26;
                            dataOut6  <= dataIn6 + dataIn25;
                            dataOut7  <= dataIn7 + dataIn24;
                            dataOut8  <= dataIn8 + dataIn23;
                            dataOut9  <= dataIn9 + dataIn22;
                            dataOut10 <= dataIn10 + dataIn21;
                            dataOut11 <= dataIn11 + dataIn20;
                            dataOut12 <= dataIn12 + dataIn19;
                            dataOut13 <= dataIn13 + dataIn18;
                            dataOut14 <= dataIn14 + dataIn17;
                            dataOut15 <= dataIn15 + dataIn16;
                            dataOut16 <= dataIn15 - dataIn16;
                            dataOut17 <= dataIn14 - dataIn17;
                            dataOut18 <= dataIn13 - dataIn18;
                            dataOut19 <= dataIn12 - dataIn19;
                            dataOut20 <= dataIn11 - dataIn20;
                            dataOut21 <= dataIn10 - dataIn21;
                            dataOut22 <= dataIn9 - dataIn22;
                            dataOut23 <= dataIn8 - dataIn23;
                            dataOut24 <= dataIn7 - dataIn24;
                            dataOut25 <= dataIn6 - dataIn25;
                            dataOut26 <= dataIn5 - dataIn26;
                            dataOut27 <= dataIn4 - dataIn27;
                            dataOut28 <= dataIn3 - dataIn28;
                            dataOut29 <= dataIn2 - dataIn29;
                            dataOut30 <= dataIn1 - dataIn30;
                            dataOut31 <= dataIn0 - dataIn31;
                            validOut  <= '1';
                        end if;
                    end if;
                end process;
end Behavioral;