----------------------------------------------------------------------------------
-- DCT8 Implementation for inetgration with aggregated architecture
--
-- Input and Output Integers
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DCT8_1_I is
    port(   -- Data Inputs
            dataIn0     : in    integer;
            dataIn1     : in    integer;
            dataIn2     : in    integer;
            dataIn3     : in    integer;
            dataIn4     : in    integer;
            dataIn5     : in    integer;
            dataIn6     : in    integer;
            dataIn7     : in    integer;
            -- Control Inputs
            res         : in    std_logic;
            en          : in    std_logic;
            clk         : in    std_logic;
            -- Data Outputs
            dataOut0    : out    integer;
            dataOut1    : out    integer;
            dataOut2    : out    integer;
            dataOut3    : out    integer;
            dataOut4    : out    integer;
            dataOut5    : out    integer;
            dataOut6    : out    integer;
            dataOut7    : out    integer;
            -- Control Outputs
            validOut    : out   std_logic
    );
end DCT8_1_I;

architecture Behavioral of DCT8_1_I is
begin

    stage1:     process(clk, res, en)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            dataOut0 <= 0;
                            dataOut1 <= 0;
                            dataOut2 <= 0;
                            dataOut3 <= 0;
                            dataOut4 <= 0;
                            dataOut5 <= 0;
                            dataOut6 <= 0;
                            dataOut7 <= 0;
                            validOut <= '0';
                        elsif(en = '1') then
                            dataOut0 <= dataIn0 + dataIn7;
                            dataOut1 <= dataIn1 + dataIn6;
                            dataOut2 <= dataIn2 + dataIn5;
                            dataOut3 <= dataIn3 + dataIn4;
                            dataOut4 <= dataIn3 - dataIn4;
                            dataOut5 <= dataIn2 - dataIn5;
                            dataOut6 <= dataIn1 - dataIn6;
                            dataOut7 <= dataIn0 - dataIn7;
                            validOut <= '1';
                        end if;
                    end if;
                end process;
end Behavioral;