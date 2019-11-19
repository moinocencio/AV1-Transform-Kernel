----------------------------------------------------------------------------------
-- DCT64 Implementation, with same # bits in input and output and internal integer
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DCT64_1_I is
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
            dataIn32     : in    integer;
            dataIn33     : in    integer;
            dataIn34     : in    integer;
            dataIn35     : in    integer;
            dataIn36     : in    integer;
            dataIn37     : in    integer;
            dataIn38     : in    integer;
            dataIn39     : in    integer;
            dataIn40     : in    integer;
            dataIn41     : in    integer;
            dataIn42     : in    integer;
            dataIn43     : in    integer;
            dataIn44     : in    integer;
            dataIn45     : in    integer;
            dataIn46     : in    integer;
            dataIn47     : in    integer;
            dataIn48     : in    integer;
            dataIn49     : in    integer;
            dataIn50     : in    integer;
            dataIn51     : in    integer;
            dataIn52     : in    integer;
            dataIn53     : in    integer;
            dataIn54     : in    integer;
            dataIn55     : in    integer;
            dataIn56     : in    integer;
            dataIn57     : in    integer;
            dataIn58     : in    integer;
            dataIn59     : in    integer;
            dataIn60     : in    integer;
            dataIn61     : in    integer;
            dataIn62     : in    integer;
            dataIn63     : in    integer;
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
            dataOut32     : out    integer;
            dataOut33     : out    integer;
            dataOut34     : out    integer;
            dataOut35     : out    integer;
            dataOut36     : out    integer;
            dataOut37     : out    integer;
            dataOut38     : out    integer;
            dataOut39     : out    integer;
            dataOut40     : out    integer;
            dataOut41     : out    integer;
            dataOut42     : out    integer;
            dataOut43     : out    integer;
            dataOut44     : out    integer;
            dataOut45     : out    integer;
            dataOut46     : out    integer;
            dataOut47     : out    integer;
            dataOut48     : out    integer;
            dataOut49     : out    integer;
            dataOut50     : out    integer;
            dataOut51     : out    integer;
            dataOut52     : out    integer;
            dataOut53     : out    integer;
            dataOut54     : out    integer;
            dataOut55     : out    integer;
            dataOut56     : out    integer;
            dataOut57     : out    integer;
            dataOut58     : out    integer;
            dataOut59     : out    integer;
            dataOut60     : out    integer;
            dataOut61     : out    integer;
            dataOut62     : out    integer;
            dataOut63     : out    integer;
            -- Control Outputs
            validOut    : out   std_logic
    );
end DCT64_1_I;

architecture Behavioral of DCT64_1_I is
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
                            dataOut16 <= 0;
                            dataOut17 <= 0;
                            dataOut18 <= 0;
                            dataOut19 <= 0;
                            dataOut20 <= 0;
                            dataOut21 <= 0;
                            dataOut22 <= 0;
                            dataOut23 <= 0;
                            dataOut24 <= 0;
                            dataOut25 <= 0;
                            dataOut26 <= 0;
                            dataOut27 <= 0;
                            dataOut28 <= 0;
                            dataOut29 <= 0;
                            dataOut30 <= 0;
                            dataOut31 <= 0;
                            dataOut32 <= 0;
                            dataOut33 <= 0;
                            dataOut34 <= 0;
                            dataOut35 <= 0;
                            dataOut36 <= 0;
                            dataOut37 <= 0;
                            dataOut38 <= 0;
                            dataOut39 <= 0;
                            dataOut40 <= 0;
                            dataOut41 <= 0;
                            dataOut42 <= 0;
                            dataOut43 <= 0;
                            dataOut44 <= 0;
                            dataOut45 <= 0;
                            dataOut46 <= 0;
                            dataOut47 <= 0;
                            dataOut48 <= 0;
                            dataOut49 <= 0;
                            dataOut50 <= 0;
                            dataOut51 <= 0;
                            dataOut52 <= 0;
                            dataOut53 <= 0;
                            dataOut54 <= 0;
                            dataOut55 <= 0;
                            dataOut56 <= 0;
                            dataOut57 <= 0;
                            dataOut58 <= 0;
                            dataOut59 <= 0;
                            dataOut60 <= 0;
                            dataOut61 <= 0;
                            dataOut62 <= 0;
                            dataOut63 <= 0;
                            validOut <= '0';
                        elsif(en = '1') then
                            dataOut0  <= dataIn0  + dataIn63;
                            dataOut1  <= dataIn1  + dataIn62;
                            dataOut2  <= dataIn2  + dataIn61;
                            dataOut3  <= dataIn3  + dataIn60;
                            dataOut4  <= dataIn4  + dataIn59;
                            dataOut5  <= dataIn5  + dataIn58;
                            dataOut6  <= dataIn6  + dataIn57;
                            dataOut7  <= dataIn7  + dataIn56;
                            dataOut8  <= dataIn8  + dataIn55;
                            dataOut9  <= dataIn9  + dataIn54;
                            dataOut10 <= dataIn10 + dataIn53;
                            dataOut11 <= dataIn11 + dataIn52;
                            dataOut12 <= dataIn12 + dataIn51;
                            dataOut13 <= dataIn13 + dataIn50;
                            dataOut14 <= dataIn14 + dataIn49;
                            dataOut15 <= dataIn15 + dataIn48;
                            dataOut16 <= dataIn16 + dataIn47;
                            dataOut17 <= dataIn17 + dataIn46;
                            dataOut18 <= dataIn18 + dataIn45;
                            dataOut19 <= dataIn19 + dataIn44;
                            dataOut20 <= dataIn20 + dataIn43;
                            dataOut21 <= dataIn21 + dataIn42;
                            dataOut22 <= dataIn22 + dataIn41;
                            dataOut23 <= dataIn23 + dataIn40;
                            dataOut24 <= dataIn24 + dataIn39;
                            dataOut25 <= dataIn25 + dataIn38;
                            dataOut26 <= dataIn26 + dataIn37;
                            dataOut27 <= dataIn27 + dataIn36;
                            dataOut28 <= dataIn28 + dataIn35;
                            dataOut29 <= dataIn29 + dataIn34;
                            dataOut30 <= dataIn30 + dataIn33;
                            dataOut31 <= dataIn31 + dataIn32;
                            dataOut32 <= dataIn31 - dataIn32;
                            dataOut33 <= dataIn30 - dataIn33;
                            dataOut34 <= dataIn29 - dataIn34;
                            dataOut35 <= dataIn28 - dataIn35;
                            dataOut36 <= dataIn27 - dataIn36;
                            dataOut37 <= dataIn26 - dataIn37;
                            dataOut38 <= dataIn25 - dataIn38;
                            dataOut39 <= dataIn24 - dataIn39;
                            dataOut40 <= dataIn23 - dataIn40;
                            dataOut41 <= dataIn22 - dataIn41;
                            dataOut42 <= dataIn21 - dataIn42;
                            dataOut43 <= dataIn20 - dataIn43;
                            dataOut44 <= dataIn19 - dataIn44;
                            dataOut45 <= dataIn18 - dataIn45;
                            dataOut46 <= dataIn17 - dataIn46;
                            dataOut47 <= dataIn16 - dataIn47;
                            dataOut48 <= dataIn15 - dataIn48;
                            dataOut49 <= dataIn14 - dataIn49;
                            dataOut50 <= dataIn13 - dataIn50;
                            dataOut51 <= dataIn12 - dataIn51;
                            dataOut52 <= dataIn11 - dataIn52;
                            dataOut53 <= dataIn10 - dataIn53;
                            dataOut54 <= dataIn9  - dataIn54;
                            dataOut55 <= dataIn8  - dataIn55;
                            dataOut56 <= dataIn7  - dataIn56;
                            dataOut57 <= dataIn6  - dataIn57;
                            dataOut58 <= dataIn5  - dataIn58;
                            dataOut59 <= dataIn4  - dataIn59;
                            dataOut60 <= dataIn3  - dataIn60;
                            dataOut61 <= dataIn2  - dataIn61;
                            dataOut62 <= dataIn1  - dataIn62;
                            dataOut63 <= dataIn0  - dataIn63;
                            validOut <= '1';
                        end if;
                    end if;
                end process;

end Behavioral;