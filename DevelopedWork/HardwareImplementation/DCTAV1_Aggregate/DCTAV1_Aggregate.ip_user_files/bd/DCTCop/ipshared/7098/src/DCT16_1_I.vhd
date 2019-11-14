----------------------------------------------------------------------------------
-- DCT16 Implementation, with same # bits in input and output and internal integer
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DCT16_1_I is
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
            -- Control Outputs
            validOut    : out   std_logic
    );
end DCT16_1_I;

architecture Behavioral of DCT16_1_I is
begin

    stage1:     process(clk, res, en)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            dataOut0  <= 0;
                            dataOut1  <= 0;
                            dataOut2  <= 0;
                            dataOut3  <= 0;
                            dataOut4  <= 0;
                            dataOut5  <= 0;
                            dataOut6  <= 0;
                            dataOut7  <= 0;
                            dataOut8  <= 0;
                            dataOut9  <= 0;
                            dataOut10 <= 0;
                            dataOut11 <= 0;
                            dataOut12 <= 0;
                            dataOut13 <= 0;
                            dataOut14 <= 0;
                            dataOut15 <= 0;
                            validOut <= '0';
                        elsif(en = '1') then
                            dataOut0  <= dataIn0 + dataIn15;
                            dataOut1  <= dataIn1 + dataIn14;
                            dataOut2  <= dataIn2 + dataIn13;
                            dataOut3  <= dataIn3 + dataIn12;
                            dataOut4  <= dataIn4 + dataIn11;
                            dataOut5  <= dataIn5 + dataIn10;
                            dataOut6  <= dataIn6 + dataIn9;
                            dataOut7  <= dataIn7 + dataIn8;
                            dataOut8  <= dataIn7 - dataIn8;
                            dataOut9  <= dataIn6 - dataIn9;
                            dataOut10 <= dataIn5 - dataIn10;
                            dataOut11 <= dataIn4 - dataIn11;
                            dataOut12 <= dataIn3 - dataIn12;
                            dataOut13 <= dataIn2 - dataIn13;
                            dataOut14 <= dataIn1 - dataIn14;
                            dataOut15 <= dataIn0 - dataIn15;
                            validOut <= '1';
                        end if;
                    end if;
                end process;
end Behavioral;