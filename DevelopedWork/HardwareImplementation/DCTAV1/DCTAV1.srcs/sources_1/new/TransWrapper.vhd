----------------------------------------------------------------------------------
-- Top Level Wrapper for DCT kernels
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TransWrapper is
    port(   -- Data Inputs
            dataIn0      : in    std_logic_vector(32 - 1 downto 0);
            dataIn1      : in    std_logic_vector(32 - 1 downto 0);
            dataIn2      : in    std_logic_vector(32 - 1 downto 0);
            dataIn3      : in    std_logic_vector(32 - 1 downto 0);
            dataIn4      : in    std_logic_vector(32 - 1 downto 0);
            dataIn5      : in    std_logic_vector(32 - 1 downto 0);
            dataIn6      : in    std_logic_vector(32 - 1 downto 0);
            dataIn7      : in    std_logic_vector(32 - 1 downto 0);
            dataIn8      : in    std_logic_vector(32 - 1 downto 0);
            dataIn9      : in    std_logic_vector(32 - 1 downto 0);
            dataIn10     : in    std_logic_vector(32 - 1 downto 0);
            dataIn11     : in    std_logic_vector(32 - 1 downto 0);
            dataIn12     : in    std_logic_vector(32 - 1 downto 0);
            dataIn13     : in    std_logic_vector(32 - 1 downto 0);
            dataIn14     : in    std_logic_vector(32 - 1 downto 0);
            dataIn15     : in    std_logic_vector(32 - 1 downto 0);
            dataIn16     : in    std_logic_vector(32 - 1 downto 0);
            dataIn17     : in    std_logic_vector(32 - 1 downto 0);
            dataIn18     : in    std_logic_vector(32 - 1 downto 0);
            dataIn19     : in    std_logic_vector(32 - 1 downto 0);
            dataIn20     : in    std_logic_vector(32 - 1 downto 0);
            dataIn21     : in    std_logic_vector(32 - 1 downto 0);
            dataIn22     : in    std_logic_vector(32 - 1 downto 0);
            dataIn23     : in    std_logic_vector(32 - 1 downto 0);
            dataIn24     : in    std_logic_vector(32 - 1 downto 0);
            dataIn25     : in    std_logic_vector(32 - 1 downto 0);
            dataIn26     : in    std_logic_vector(32 - 1 downto 0);
            dataIn27     : in    std_logic_vector(32 - 1 downto 0);
            dataIn28     : in    std_logic_vector(32 - 1 downto 0);
            dataIn29     : in    std_logic_vector(32 - 1 downto 0);
            dataIn30     : in    std_logic_vector(32 - 1 downto 0);
            dataIn31     : in    std_logic_vector(32 - 1 downto 0);
            dataIn32     : in    std_logic_vector(32 - 1 downto 0);
            dataIn33     : in    std_logic_vector(32 - 1 downto 0);
            dataIn34     : in    std_logic_vector(32 - 1 downto 0);
            dataIn35     : in    std_logic_vector(32 - 1 downto 0);
            dataIn36     : in    std_logic_vector(32 - 1 downto 0);
            dataIn37     : in    std_logic_vector(32 - 1 downto 0);
            dataIn38     : in    std_logic_vector(32 - 1 downto 0);
            dataIn39     : in    std_logic_vector(32 - 1 downto 0);
            dataIn40     : in    std_logic_vector(32 - 1 downto 0);
            dataIn41     : in    std_logic_vector(32 - 1 downto 0);
            dataIn42     : in    std_logic_vector(32 - 1 downto 0);
            dataIn43     : in    std_logic_vector(32 - 1 downto 0);
            dataIn44     : in    std_logic_vector(32 - 1 downto 0);
            dataIn45     : in    std_logic_vector(32 - 1 downto 0);
            dataIn46     : in    std_logic_vector(32 - 1 downto 0);
            dataIn47     : in    std_logic_vector(32 - 1 downto 0);
            dataIn48     : in    std_logic_vector(32 - 1 downto 0);
            dataIn49     : in    std_logic_vector(32 - 1 downto 0);
            dataIn50     : in    std_logic_vector(32 - 1 downto 0);
            dataIn51     : in    std_logic_vector(32 - 1 downto 0);
            dataIn52     : in    std_logic_vector(32 - 1 downto 0);
            dataIn53     : in    std_logic_vector(32 - 1 downto 0);
            dataIn54     : in    std_logic_vector(32 - 1 downto 0);
            dataIn55     : in    std_logic_vector(32 - 1 downto 0);
            dataIn56     : in    std_logic_vector(32 - 1 downto 0);
            dataIn57     : in    std_logic_vector(32 - 1 downto 0);
            dataIn58     : in    std_logic_vector(32 - 1 downto 0);
            dataIn59     : in    std_logic_vector(32 - 1 downto 0);
            dataIn60     : in    std_logic_vector(32 - 1 downto 0);
            dataIn61     : in    std_logic_vector(32 - 1 downto 0);
            dataIn62     : in    std_logic_vector(32 - 1 downto 0);
            dataIn63     : in    std_logic_vector(32 - 1 downto 0);
            -- Control Inputs
            res          : in    std_logic;
            en           : in    std_logic;
            clk          : in    std_logic;
            sel          : in    std_logic_vector(2 downto 0);
            -- Data Outputs
            dataOut0      : out    std_logic_vector(32 - 1 downto 0);
            dataOut1      : out    std_logic_vector(32 - 1 downto 0);
            dataOut2      : out    std_logic_vector(32 - 1 downto 0);
            dataOut3      : out    std_logic_vector(32 - 1 downto 0);
            dataOut4      : out    std_logic_vector(32 - 1 downto 0);
            dataOut5      : out    std_logic_vector(32 - 1 downto 0);
            dataOut6      : out    std_logic_vector(32 - 1 downto 0);
            dataOut7      : out    std_logic_vector(32 - 1 downto 0);
            dataOut8      : out    std_logic_vector(32 - 1 downto 0);
            dataOut9      : out    std_logic_vector(32 - 1 downto 0);
            dataOut10     : out    std_logic_vector(32 - 1 downto 0);
            dataOut11     : out    std_logic_vector(32 - 1 downto 0);
            dataOut12     : out    std_logic_vector(32 - 1 downto 0);
            dataOut13     : out    std_logic_vector(32 - 1 downto 0);
            dataOut14     : out    std_logic_vector(32 - 1 downto 0);
            dataOut15     : out    std_logic_vector(32 - 1 downto 0);
            dataOut16     : out    std_logic_vector(32 - 1 downto 0);
            dataOut17     : out    std_logic_vector(32 - 1 downto 0);
            dataOut18     : out    std_logic_vector(32 - 1 downto 0);
            dataOut19     : out    std_logic_vector(32 - 1 downto 0);
            dataOut20     : out    std_logic_vector(32 - 1 downto 0);
            dataOut21     : out    std_logic_vector(32 - 1 downto 0);
            dataOut22     : out    std_logic_vector(32 - 1 downto 0);
            dataOut23     : out    std_logic_vector(32 - 1 downto 0);
            dataOut24     : out    std_logic_vector(32 - 1 downto 0);
            dataOut25     : out    std_logic_vector(32 - 1 downto 0);
            dataOut26     : out    std_logic_vector(32 - 1 downto 0);
            dataOut27     : out    std_logic_vector(32 - 1 downto 0);
            dataOut28     : out    std_logic_vector(32 - 1 downto 0);
            dataOut29     : out    std_logic_vector(32 - 1 downto 0);
            dataOut30     : out    std_logic_vector(32 - 1 downto 0);
            dataOut31     : out    std_logic_vector(32 - 1 downto 0);
            dataOut32     : out    std_logic_vector(32 - 1 downto 0);
            dataOut33     : out    std_logic_vector(32 - 1 downto 0);
            dataOut34     : out    std_logic_vector(32 - 1 downto 0);
            dataOut35     : out    std_logic_vector(32 - 1 downto 0);
            dataOut36     : out    std_logic_vector(32 - 1 downto 0);
            dataOut37     : out    std_logic_vector(32 - 1 downto 0);
            dataOut38     : out    std_logic_vector(32 - 1 downto 0);
            dataOut39     : out    std_logic_vector(32 - 1 downto 0);
            dataOut40     : out    std_logic_vector(32 - 1 downto 0);
            dataOut41     : out    std_logic_vector(32 - 1 downto 0);
            dataOut42     : out    std_logic_vector(32 - 1 downto 0);
            dataOut43     : out    std_logic_vector(32 - 1 downto 0);
            dataOut44     : out    std_logic_vector(32 - 1 downto 0);
            dataOut45     : out    std_logic_vector(32 - 1 downto 0);
            dataOut46     : out    std_logic_vector(32 - 1 downto 0);
            dataOut47     : out    std_logic_vector(32 - 1 downto 0);
            dataOut48     : out    std_logic_vector(32 - 1 downto 0);
            dataOut49     : out    std_logic_vector(32 - 1 downto 0);
            dataOut50     : out    std_logic_vector(32 - 1 downto 0);
            dataOut51     : out    std_logic_vector(32 - 1 downto 0);
            dataOut52     : out    std_logic_vector(32 - 1 downto 0);
            dataOut53     : out    std_logic_vector(32 - 1 downto 0);
            dataOut54     : out    std_logic_vector(32 - 1 downto 0);
            dataOut55     : out    std_logic_vector(32 - 1 downto 0);
            dataOut56     : out    std_logic_vector(32 - 1 downto 0);
            dataOut57     : out    std_logic_vector(32 - 1 downto 0);
            dataOut58     : out    std_logic_vector(32 - 1 downto 0);
            dataOut59     : out    std_logic_vector(32 - 1 downto 0);
            dataOut60     : out    std_logic_vector(32 - 1 downto 0);
            dataOut61     : out    std_logic_vector(32 - 1 downto 0);
            dataOut62     : out    std_logic_vector(32 - 1 downto 0);
            dataOut63     : out    std_logic_vector(32 - 1 downto 0);
            -- Control Outputs
            validOut    : out   std_logic
    );
end TransWrapper;

architecture TopLevelWrapper of TransWrapper is
    signal s_DCT4En, s_DCT8En, s_DCT16En, s_DCT32En, s_DCT64En      : std_logic := '0';
    signal s_DCT4Out0, s_DCT4Out1, s_DCT4Out2, s_DCT4Out3       : std_logic_vector(31 downto 0) := (others => '0');
    signal s_DCT8Out0, s_DCT8Out1, s_DCT8Out2, s_DCT8Out3, s_DCT8Out4, s_DCT8Out5, s_DCT8Out6, s_DCT8Out7       : std_logic_vector(31 downto 0) := (others => '0');
    signal s_DCT16Out0, s_DCT16Out1, s_DCT16Out2, s_DCT16Out3, s_DCT16Out4, s_DCT16Out5, s_DCT16Out6,s_DCT16Out7, s_DCT16Out8, s_DCT16Out9, s_DCT16Out10, s_DCT16Out11, s_DCT16Out12, s_DCT16Out13, s_DCT16Out14, s_DCT16Out15       : std_logic_vector(31 downto 0) := (others => '0');
    signal s_DCT32Out0, s_DCT32Out1, s_DCT32Out2, s_DCT32Out3, s_DCT32Out4, s_DCT32Out5, s_DCT32Out6, s_DCT32Out7, s_DCT32Out8, s_DCT32Out9, s_DCT32Out10, s_DCT32Out11, s_DCT32Out12, s_DCT32Out13, s_DCT32Out14, s_DCT32Out15, s_DCT32Out16, s_DCT32Out17, s_DCT32Out18, s_DCT32Out19, s_DCT32Out20, s_DCT32Out21, s_DCT32Out22, s_DCT32Out23, s_DCT32Out24, s_DCT32Out25, s_DCT32Out26, s_DCT32Out27, s_DCT32Out28, s_DCT32Out29, s_DCT32Out30, s_DCT32Out31       : std_logic_vector(31 downto 0) := (others => '0');
    signal s_DCT64Out0, s_DCT64Out1, s_DCT64Out2, s_DCT64Out3, s_DCT64Out4, s_DCT64Out5, s_DCT64Out6, s_DCT64Out7, s_DCT64Out8, s_DCT64Out9, s_DCT64Out10, s_DCT64Out11, s_DCT64Out12, s_DCT64Out13, s_DCT64Out14, s_DCT64Out15, s_DCT64Out16, s_DCT64Out17, s_DCT64Out18, s_DCT64Out19, s_DCT64Out20, s_DCT64Out21, s_DCT64Out22, s_DCT64Out23, s_DCT64Out24, s_DCT64Out25, s_DCT64Out26, s_DCT64Out27, s_DCT64Out28, s_DCT64Out29, s_DCT64Out30, s_DCT64Out31, s_DCT64Out32, s_DCT64Out33, s_DCT64Out34, s_DCT64Out35, s_DCT64Out36, s_DCT64Out37, s_DCT64Out38, s_DCT64Out39, s_DCT64Out40, s_DCT64Out41, s_DCT64Out42, s_DCT64Out43, s_DCT64Out44, s_DCT64Out45, s_DCT64Out46, s_DCT64Out47, s_DCT64Out48, s_DCT64Out49, s_DCT64Out50, s_DCT64Out51, s_DCT64Out52, s_DCT64Out53, s_DCT64Out54,s_DCT64Out55, s_DCT64Out56, s_DCT64Out57, s_DCT64Out58, s_DCT64Out59, s_DCT64Out60, s_DCT64Out61, s_DCT64Out62, s_DCT64Out63       : std_logic_vector(31 downto 0) := (others => '0');
    signal s_DCT4ValOut, s_DCT8ValOut, s_DCT16ValOut, s_DCT32ValOut, s_DCT64ValOut      : std_logic := '0';
begin

    selector:   process(clk, en, res, sel)
                begin
                    if (rising_edge(clk)) then
                        if (res = '1') then
                            s_DCT4En   <= '0';
                            s_DCT8En   <= '0';
                            s_DCT16En  <= '0';
                            s_DCT32En  <= '0';
                            s_DCT64En  <= '0';
                            dataOut0   <= (others => '0');
                            dataOut1   <= (others => '0');
                            dataOut2   <= (others => '0');
                            dataOut3   <= (others => '0');
                            dataOut4   <= (others => '0');
                            dataOut5   <= (others => '0');
                            dataOut6   <= (others => '0');
                            dataOut7   <= (others => '0');
                            dataOut8   <= (others => '0');
                            dataOut9   <= (others => '0');
                            dataOut10  <= (others => '0');
                            dataOut11  <= (others => '0');
                            dataOut12  <= (others => '0');
                            dataOut13  <= (others => '0');
                            dataOut14  <= (others => '0');
                            dataOut15  <= (others => '0');
                            dataOut16  <= (others => '0');
                            dataOut17  <= (others => '0');
                            dataOut18  <= (others => '0');
                            dataOut19  <= (others => '0');
                            dataOut20  <= (others => '0');
                            dataOut21  <= (others => '0');
                            dataOut22  <= (others => '0');
                            dataOut23  <= (others => '0');
                            dataOut24  <= (others => '0');
                            dataOut25  <= (others => '0');
                            dataOut26  <= (others => '0');
                            dataOut27  <= (others => '0');
                            dataOut28  <= (others => '0');
                            dataOut29  <= (others => '0');
                            dataOut30  <= (others => '0');
                            dataOut31  <= (others => '0');
                            dataOut32  <= (others => '0');
                            dataOut33  <= (others => '0');
                            dataOut34  <= (others => '0');
                            dataOut35  <= (others => '0');
                            dataOut36  <= (others => '0');
                            dataOut37  <= (others => '0');
                            dataOut38  <= (others => '0');
                            dataOut39  <= (others => '0');
                            dataOut40  <= (others => '0');
                            dataOut41  <= (others => '0');
                            dataOut42  <= (others => '0');
                            dataOut43  <= (others => '0');
                            dataOut44  <= (others => '0');
                            dataOut45  <= (others => '0');
                            dataOut46  <= (others => '0');
                            dataOut47  <= (others => '0');
                            dataOut48  <= (others => '0');
                            dataOut49  <= (others => '0');
                            dataOut50  <= (others => '0');
                            dataOut51  <= (others => '0');
                            dataOut52  <= (others => '0');
                            dataOut53  <= (others => '0');
                            dataOut54  <= (others => '0');
                            dataOut55  <= (others => '0');
                            dataOut56  <= (others => '0');
                            dataOut57  <= (others => '0');
                            dataOut58  <= (others => '0');
                            dataOut59  <= (others => '0');
                            dataOut60  <= (others => '0');
                            dataOut61  <= (others => '0');
                            dataOut62  <= (others => '0');
                            dataOut63  <= (others => '0');
                            validOut   <= '0';
                        elsif (en = '1') then
                            dataOut0   <= (others => '-');
                            dataOut1   <= (others => '-');
                            dataOut2   <= (others => '-');
                            dataOut3   <= (others => '-');
                            dataOut4   <= (others => '-');
                            dataOut5   <= (others => '-');
                            dataOut6   <= (others => '-');
                            dataOut7   <= (others => '-');
                            dataOut8   <= (others => '-');
                            dataOut9   <= (others => '-');
                            dataOut10  <= (others => '-');
                            dataOut11  <= (others => '-');
                            dataOut12  <= (others => '-');
                            dataOut13  <= (others => '-');
                            dataOut14  <= (others => '-');
                            dataOut15  <= (others => '-');
                            dataOut16  <= (others => '-');
                            dataOut17  <= (others => '-');
                            dataOut18  <= (others => '-');
                            dataOut19  <= (others => '-');
                            dataOut20  <= (others => '-');
                            dataOut21  <= (others => '-');
                            dataOut22  <= (others => '-');
                            dataOut23  <= (others => '-');
                            dataOut24  <= (others => '-');
                            dataOut25  <= (others => '-');
                            dataOut26  <= (others => '-');
                            dataOut27  <= (others => '-');
                            dataOut28  <= (others => '-');
                            dataOut29  <= (others => '-');
                            dataOut30  <= (others => '-');
                            dataOut31  <= (others => '-');
                            dataOut32  <= (others => '-');
                            dataOut33  <= (others => '-');
                            dataOut34  <= (others => '-');
                            dataOut35  <= (others => '-');
                            dataOut36  <= (others => '-');
                            dataOut37  <= (others => '-');
                            dataOut38  <= (others => '-');
                            dataOut39  <= (others => '-');
                            dataOut40  <= (others => '-');
                            dataOut41  <= (others => '-');
                            dataOut42  <= (others => '-');
                            dataOut43  <= (others => '-');
                            dataOut44  <= (others => '-');
                            dataOut45  <= (others => '-');
                            dataOut46  <= (others => '-');
                            dataOut47  <= (others => '-');
                            dataOut48  <= (others => '-');
                            dataOut49  <= (others => '-');
                            dataOut50  <= (others => '-');
                            dataOut51  <= (others => '-');
                            dataOut52  <= (others => '-');
                            dataOut53  <= (others => '-');
                            dataOut54  <= (others => '-');
                            dataOut55  <= (others => '-');
                            dataOut56  <= (others => '-');
                            dataOut57  <= (others => '-');
                            dataOut58  <= (others => '-');
                            dataOut59  <= (others => '-');
                            dataOut60  <= (others => '-');
                            dataOut61  <= (others => '-');
                            dataOut62  <= (others => '-');
                            dataOut63  <= (others => '-');
                            validOut   <= '-';
                            case( sel ) is
                                when "000" =>       -- DCT4
                                    dataOut0  <= s_DCT4Out0;
                                    dataOut1  <= s_DCT4Out1;
                                    dataOut2  <= s_DCT4Out2;
                                    dataOut3  <= s_DCT4Out3;
                                    s_DCT4En  <= '1';
                                    validOut  <= s_DCT4ValOut;
                                when "001" =>       -- DCT8
                                    dataOut0  <= s_DCT8Out0;
                                    dataOut1  <= s_DCT8Out1;
                                    dataOut2  <= s_DCT8Out2;
                                    dataOut3  <= s_DCT8Out3;
                                    dataOut4  <= s_DCT8Out4;
                                    dataOut5  <= s_DCT8Out5;
                                    dataOut6  <= s_DCT8Out6;
                                    dataOut7  <= s_DCT8Out7;
                                    s_DCT8En  <= '1';
                                    validOut  <= s_DCT8ValOut;
                                when "010" =>       -- DCT16
                                    dataOut0  <= s_DCT16Out0;
                                    dataOut1  <= s_DCT16Out1;
                                    dataOut2  <= s_DCT16Out2;
                                    dataOut3  <= s_DCT16Out3;
                                    dataOut4  <= s_DCT16Out4;
                                    dataOut5  <= s_DCT16Out5;
                                    dataOut6  <= s_DCT16Out6;
                                    dataOut7  <= s_DCT16Out7;
                                    dataOut8  <= s_DCT16Out8;
                                    dataOut9  <= s_DCT16Out9;
                                    dataOut10 <= s_DCT16Out10;
                                    dataOut11 <= s_DCT16Out11;
                                    dataOut12 <= s_DCT16Out12;
                                    dataOut13 <= s_DCT16Out13;
                                    dataOut14 <= s_DCT16Out14;
                                    dataOut15 <= s_DCT16Out15;
                                    s_DCT16En <= '1';
                                    validOut  <= s_DCT16ValOut;
                                when "011" =>       -- DCT32
                                    dataOut0   <= s_DCT32Out0;
                                    dataOut1   <= s_DCT32Out1;
                                    dataOut2   <= s_DCT32Out2;
                                    dataOut3   <= s_DCT32Out3;
                                    dataOut4   <= s_DCT32Out4;
                                    dataOut5   <= s_DCT32Out5;
                                    dataOut6   <= s_DCT32Out6;
                                    dataOut7   <= s_DCT32Out7;
                                    dataOut8   <= s_DCT32Out8;
                                    dataOut9   <= s_DCT32Out9;
                                    dataOut10  <= s_DCT32Out10;
                                    dataOut11  <= s_DCT32Out11;
                                    dataOut12  <= s_DCT32Out12;
                                    dataOut13  <= s_DCT32Out13;
                                    dataOut14  <= s_DCT32Out14;
                                    dataOut15  <= s_DCT32Out15;
                                    dataOut16  <= s_DCT32Out16;
                                    dataOut17  <= s_DCT32Out17;
                                    dataOut18  <= s_DCT32Out18;
                                    dataOut19  <= s_DCT32Out19;
                                    dataOut20  <= s_DCT32Out20;
                                    dataOut21  <= s_DCT32Out21;
                                    dataOut22  <= s_DCT32Out22;
                                    dataOut23  <= s_DCT32Out23;
                                    dataOut24  <= s_DCT32Out24;
                                    dataOut25  <= s_DCT32Out25;
                                    dataOut26  <= s_DCT32Out26;
                                    dataOut27  <= s_DCT32Out27;
                                    dataOut28  <= s_DCT32Out28;
                                    dataOut29  <= s_DCT32Out29;
                                    dataOut30  <= s_DCT32Out30;
                                    dataOut31  <= s_DCT32Out31;
                                    s_DCT32En  <= '1';
                                    validOut   <= s_DCT32ValOut;
                                when "100" =>
                                    dataOut0   <= s_DCT64Out0;
                                    dataOut1   <= s_DCT64Out1;
                                    dataOut2   <= s_DCT64Out2;
                                    dataOut3   <= s_DCT64Out3;
                                    dataOut4   <= s_DCT64Out4;
                                    dataOut5   <= s_DCT64Out5;
                                    dataOut6   <= s_DCT64Out6;
                                    dataOut7   <= s_DCT64Out7;
                                    dataOut8   <= s_DCT64Out8;
                                    dataOut9   <= s_DCT64Out9;
                                    dataOut10  <= s_DCT64Out10;
                                    dataOut11  <= s_DCT64Out11;
                                    dataOut12  <= s_DCT64Out12;
                                    dataOut13  <= s_DCT64Out13;
                                    dataOut14  <= s_DCT64Out14;
                                    dataOut15  <= s_DCT64Out15;
                                    dataOut16  <= s_DCT64Out16;
                                    dataOut17  <= s_DCT64Out17;
                                    dataOut18  <= s_DCT64Out18;
                                    dataOut19  <= s_DCT64Out19;
                                    dataOut20  <= s_DCT64Out20;
                                    dataOut21  <= s_DCT64Out21;
                                    dataOut22  <= s_DCT64Out22;
                                    dataOut23  <= s_DCT64Out23;
                                    dataOut24  <= s_DCT64Out24;
                                    dataOut25  <= s_DCT64Out25;
                                    dataOut26  <= s_DCT64Out26;
                                    dataOut27  <= s_DCT64Out27;
                                    dataOut28  <= s_DCT64Out28;
                                    dataOut29  <= s_DCT64Out29;
                                    dataOut30  <= s_DCT64Out30;
                                    dataOut31  <= s_DCT64Out31;
                                    dataOut32  <= s_DCT64Out32;
                                    dataOut33  <= s_DCT64Out33;
                                    dataOut34  <= s_DCT64Out34;
                                    dataOut35  <= s_DCT64Out35;
                                    dataOut36  <= s_DCT64Out36;
                                    dataOut37  <= s_DCT64Out37;
                                    dataOut38  <= s_DCT64Out38;
                                    dataOut39  <= s_DCT64Out39;
                                    dataOut40  <= s_DCT64Out40;
                                    dataOut41  <= s_DCT64Out41;
                                    dataOut42  <= s_DCT64Out42;
                                    dataOut43  <= s_DCT64Out43;
                                    dataOut44  <= s_DCT64Out44;
                                    dataOut45  <= s_DCT64Out45;
                                    dataOut46  <= s_DCT64Out46;
                                    dataOut47  <= s_DCT64Out47;
                                    dataOut48  <= s_DCT64Out48;
                                    dataOut49  <= s_DCT64Out49;
                                    dataOut50  <= s_DCT64Out50;
                                    dataOut51  <= s_DCT64Out51;
                                    dataOut52  <= s_DCT64Out52;
                                    dataOut53  <= s_DCT64Out53;
                                    dataOut54  <= s_DCT64Out54;
                                    dataOut55  <= s_DCT64Out55;
                                    dataOut56  <= s_DCT64Out56;
                                    dataOut57  <= s_DCT64Out57;
                                    dataOut58  <= s_DCT64Out58;
                                    dataOut59  <= s_DCT64Out59;
                                    dataOut60  <= s_DCT64Out60;
                                    dataOut61  <= s_DCT64Out61;
                                    dataOut62  <= s_DCT64Out62;
                                    dataOut63  <= s_DCT64Out63;
                                    s_DCT64En  <= '1';
                                    validOut   <= s_DCT64ValOut;
                                when others =>
                                    s_DCT4En   <= '0';
                                    s_DCT8En   <= '0';
                                    s_DCT16En  <= '0';
                                    s_DCT32En  <= '0';
                                    s_DCT64En  <= '0';
                                    dataOut0   <= (others => '0');
                                    dataOut1   <= (others => '0');
                                    dataOut2   <= (others => '0');
                                    dataOut3   <= (others => '0');
                                    dataOut4   <= (others => '0');
                                    dataOut5   <= (others => '0');
                                    dataOut6   <= (others => '0');
                                    dataOut7   <= (others => '0');
                                    dataOut8   <= (others => '0');
                                    dataOut9   <= (others => '0');
                                    dataOut10  <= (others => '0');
                                    dataOut11  <= (others => '0');
                                    dataOut12  <= (others => '0');
                                    dataOut13  <= (others => '0');
                                    dataOut14  <= (others => '0');
                                    dataOut15  <= (others => '0');
                                    dataOut16  <= (others => '0');
                                    dataOut17  <= (others => '0');
                                    dataOut18  <= (others => '0');
                                    dataOut19  <= (others => '0');
                                    dataOut20  <= (others => '0');
                                    dataOut21  <= (others => '0');
                                    dataOut22  <= (others => '0');
                                    dataOut23  <= (others => '0');
                                    dataOut24  <= (others => '0');
                                    dataOut25  <= (others => '0');
                                    dataOut26  <= (others => '0');
                                    dataOut27  <= (others => '0');
                                    dataOut28  <= (others => '0');
                                    dataOut29  <= (others => '0');
                                    dataOut30  <= (others => '0');
                                    dataOut31  <= (others => '0');
                                    dataOut32  <= (others => '0');
                                    dataOut33  <= (others => '0');
                                    dataOut34  <= (others => '0');
                                    dataOut35  <= (others => '0');
                                    dataOut36  <= (others => '0');
                                    dataOut37  <= (others => '0');
                                    dataOut38  <= (others => '0');
                                    dataOut39  <= (others => '0');
                                    dataOut40  <= (others => '0');
                                    dataOut41  <= (others => '0');
                                    dataOut42  <= (others => '0');
                                    dataOut43  <= (others => '0');
                                    dataOut44  <= (others => '0');
                                    dataOut45  <= (others => '0');
                                    dataOut46  <= (others => '0');
                                    dataOut47  <= (others => '0');
                                    dataOut48  <= (others => '0');
                                    dataOut49  <= (others => '0');
                                    dataOut50  <= (others => '0');
                                    dataOut51  <= (others => '0');
                                    dataOut52  <= (others => '0');
                                    dataOut53  <= (others => '0');
                                    dataOut54  <= (others => '0');
                                    dataOut55  <= (others => '0');
                                    dataOut56  <= (others => '0');
                                    dataOut57  <= (others => '0');
                                    dataOut58  <= (others => '0');
                                    dataOut59  <= (others => '0');
                                    dataOut60  <= (others => '0');
                                    dataOut61  <= (others => '0');
                                    dataOut62  <= (others => '0');
                                    dataOut63  <= (others => '0');
                                    validOut   <= '0';
                            end case ;
                        end if ;
                    end if ;
                end process;
    
    DCT4:   entity work.DCT432(Behavioral)
            generic map(K           =>  32)
            port map(   dataIn0     =>  dataIn0,
                        dataIn1     =>  dataIn1,
                        dataIn2     =>  dataIn2,
                        dataIn3     =>  dataIn3,
                        res         =>  res,
                        en          =>  s_DCT4En,
                        clk         =>  clk,
                        dataOut0    =>  s_DCT4Out0,
                        dataOut1    =>  s_DCT4Out1,
                        dataOut2    =>  s_DCT4Out2,
                        dataOut3    =>  s_DCT4Out3,
                        validOut    =>  s_DCT4ValOut
                    );

    DCT8:       entity work.DCT832(Behavioral)
                generic map(K           =>  32)
                port map(   dataIn0     =>  dataIn0,
                            dataIn1     =>  dataIn1,
                            dataIn2     =>  dataIn2,
                            dataIn3     =>  dataIn3,
                            dataIn4     =>  dataIn4,
                            dataIn5     =>  dataIn5,
                            dataIn6     =>  dataIn6,
                            dataIn7     =>  dataIn7,
                            res         =>  res,
                            en          =>  s_DCT8En,
                            clk         =>  clk,
                            dataOut0    =>  s_DCT8Out0,
                            dataOut1    =>  s_DCT8Out1,
                            dataOut2    =>  s_DCT8Out2,
                            dataOut3    =>  s_DCT8Out3,
                            dataOut4    =>  s_DCT8Out4,
                            dataOut5    =>  s_DCT8Out5,
                            dataOut6    =>  s_DCT8Out6,
                            dataOut7    =>  s_DCT8Out7,
                            validOut    =>  s_DCT8ValOut
                        );

    DCT16:      entity work.DCT1632(Behavioral)
                generic map(K           =>  32)
                port map(   dataIn0     =>  dataIn0,
                            dataIn1     =>  dataIn1,
                            dataIn2     =>  dataIn2,
                            dataIn3     =>  dataIn3,
                            dataIn4     =>  dataIn4,
                            dataIn5     =>  dataIn5,
                            dataIn6     =>  dataIn6,
                            dataIn7     =>  dataIn7,
                            dataIn8     =>  dataIn8,
                            dataIn9     =>  dataIn9,
                            dataIn10    =>  dataIn10,
                            dataIn11    =>  dataIn11,
                            dataIn12    =>  dataIn12,
                            dataIn13    =>  dataIn13,
                            dataIn14    =>  dataIn14,
                            dataIn15    =>  dataIn15,
                            res         =>  res,
                            en          =>  s_DCT16En,
                            clk         =>  clk,
                            dataOut0    =>  s_DCT16Out0,
                            dataOut1    =>  s_DCT16Out1,
                            dataOut2    =>  s_DCT16Out2,
                            dataOut3    =>  s_DCT16Out3,
                            dataOut4    =>  s_DCT16Out4,
                            dataOut5    =>  s_DCT16Out5,
                            dataOut6    =>  s_DCT16Out6,
                            dataOut7    =>  s_DCT16Out7,
                            dataOut8    =>  s_DCT16Out8,
                            dataOut9    =>  s_DCT16Out9,
                            dataOut10   =>  s_DCT16Out10,
                            dataOut11   =>  s_DCT16Out11,
                            dataOut12   =>  s_DCT16Out12,
                            dataOut13   =>  s_DCT16Out13,
                            dataOut14   =>  s_DCT16Out14,
                            dataOut15   =>  s_DCT16Out15,
                            validOut    =>  s_DCT16ValOut
                        );

    DCT32:      entity work.DCT3232(Behavioral)
                generic map(K           =>  32)
                port map(   dataIn0   =>  dataIn0,
                            dataIn1   =>  dataIn1,
                            dataIn2   =>  dataIn2,
                            dataIn3   =>  dataIn3,
                            dataIn4   =>  dataIn4,
                            dataIn5   =>  dataIn5,
                            dataIn6   =>  dataIn6,
                            dataIn7   =>  dataIn7,
                            dataIn8   =>  dataIn8,
                            dataIn9   =>  dataIn9,
                            dataIn10  =>  dataIn10,
                            dataIn11  =>  dataIn11,
                            dataIn12  =>  dataIn12,
                            dataIn13  =>  dataIn13,
                            dataIn14  =>  dataIn14,
                            dataIn15  =>  dataIn15,
                            dataIn16  =>  dataIn16,
                            dataIn17  =>  dataIn17,
                            dataIn18  =>  dataIn18,
                            dataIn19  =>  dataIn19,
                            dataIn20  =>  dataIn20,
                            dataIn21  =>  dataIn21,
                            dataIn22  =>  dataIn22,
                            dataIn23  =>  dataIn23,
                            dataIn24  =>  dataIn24,
                            dataIn25  =>  dataIn25,
                            dataIn26  =>  dataIn26,
                            dataIn27  =>  dataIn27,
                            dataIn28  =>  dataIn28,
                            dataIn29  =>  dataIn29,
                            dataIn30  =>  dataIn30,
                            dataIn31  =>  dataIn31,
                            res       =>  res,
                            en        =>  s_DCT32En,
                            clk       =>  clk,
                            dataOut0  =>  s_DCT32Out0,
                            dataOut1  =>  s_DCT32Out1,
                            dataOut2  =>  s_DCT32Out2,
                            dataOut3  =>  s_DCT32Out3,
                            dataOut4  =>  s_DCT32Out4,
                            dataOut5  =>  s_DCT32Out5,
                            dataOut6  =>  s_DCT32Out6,
                            dataOut7  =>  s_DCT32Out7,
                            dataOut8  =>  s_DCT32Out8,
                            dataOut9  =>  s_DCT32Out9,
                            dataOut10 =>  s_DCT32Out10,
                            dataOut11 =>  s_DCT32Out11,
                            dataOut12 =>  s_DCT32Out12,
                            dataOut13 =>  s_DCT32Out13,
                            dataOut14 =>  s_DCT32Out14,
                            dataOut15 =>  s_DCT32Out15,
                            dataOut16 =>  s_DCT32Out16,
                            dataOut17 =>  s_DCT32Out17,
                            dataOut18 =>  s_DCT32Out18,
                            dataOut19 =>  s_DCT32Out19,
                            dataOut20 =>  s_DCT32Out20,
                            dataOut21 =>  s_DCT32Out21,
                            dataOut22 =>  s_DCT32Out22,
                            dataOut23 =>  s_DCT32Out23,
                            dataOut24 =>  s_DCT32Out24,
                            dataOut25 =>  s_DCT32Out25,
                            dataOut26 =>  s_DCT32Out26,
                            dataOut27 =>  s_DCT32Out27,
                            dataOut28 =>  s_DCT32Out28,
                            dataOut29 =>  s_DCT32Out29,
                            dataOut30 =>  s_DCT32Out30,
                            dataOut31 =>  s_DCT32Out31,
                            validOut  =>  s_DCT32ValOut
                        );                      
                        
    DCT64:      entity work.DCT6432(Behavioral)
                generic map(K           =>  32)
                port map(   dataIn0   =>  dataIn0,
                            dataIn1   =>  dataIn1,
                            dataIn2   =>  dataIn2,
                            dataIn3   =>  dataIn3,
                            dataIn4   =>  dataIn4,
                            dataIn5   =>  dataIn5,
                            dataIn6   =>  dataIn6,
                            dataIn7   =>  dataIn7,
                            dataIn8   =>  dataIn8,
                            dataIn9   =>  dataIn9,
                            dataIn10  =>  dataIn10,
                            dataIn11  =>  dataIn11,
                            dataIn12  =>  dataIn12,
                            dataIn13  =>  dataIn13,
                            dataIn14  =>  dataIn14,
                            dataIn15  =>  dataIn15,
                            dataIn16  =>  dataIn16,
                            dataIn17  =>  dataIn17,
                            dataIn18  =>  dataIn18,
                            dataIn19  =>  dataIn19,
                            dataIn20  =>  dataIn20,
                            dataIn21  =>  dataIn21,
                            dataIn22  =>  dataIn22,
                            dataIn23  =>  dataIn23,
                            dataIn24  =>  dataIn24,
                            dataIn25  =>  dataIn25,
                            dataIn26  =>  dataIn26,
                            dataIn27  =>  dataIn27,
                            dataIn28  =>  dataIn28,
                            dataIn29  =>  dataIn29,
                            dataIn30  =>  dataIn30,
                            dataIn31  =>  dataIn31,
                            dataIn32  =>  dataIn32,
                            dataIn33  =>  dataIn33,
                            dataIn34  =>  dataIn34,
                            dataIn35  =>  dataIn35,
                            dataIn36  =>  dataIn36,
                            dataIn37  =>  dataIn37,
                            dataIn38  =>  dataIn38,
                            dataIn39  =>  dataIn39,
                            dataIn40  =>  dataIn40,
                            dataIn41  =>  dataIn41,
                            dataIn42  =>  dataIn42,
                            dataIn43  =>  dataIn43,
                            dataIn44  =>  dataIn44,
                            dataIn45  =>  dataIn45,
                            dataIn46  =>  dataIn46,
                            dataIn47  =>  dataIn47,
                            dataIn48  =>  dataIn48,
                            dataIn49  =>  dataIn49,
                            dataIn50  =>  dataIn50,
                            dataIn51  =>  dataIn51,
                            dataIn52  =>  dataIn52,
                            dataIn53  =>  dataIn53,
                            dataIn54  =>  dataIn54,
                            dataIn55  =>  dataIn55,
                            dataIn56  =>  dataIn56,
                            dataIn57  =>  dataIn57,
                            dataIn58  =>  dataIn58,
                            dataIn59  =>  dataIn59,
                            dataIn60  =>  dataIn60,
                            dataIn61  =>  dataIn61,
                            dataIn62  =>  dataIn62,
                            dataIn63  =>  dataIn63,
                            res       =>  res,
                            en        =>  s_DCT64En,
                            clk       =>  clk,
                            dataOut0  =>  s_DCT64Out0,
                            dataOut1  =>  s_DCT64Out1,
                            dataOut2  =>  s_DCT64Out2,
                            dataOut3  =>  s_DCT64Out3,
                            dataOut4  =>  s_DCT64Out4,
                            dataOut5  =>  s_DCT64Out5,
                            dataOut6  =>  s_DCT64Out6,
                            dataOut7  =>  s_DCT64Out7,
                            dataOut8  =>  s_DCT64Out8,
                            dataOut9  =>  s_DCT64Out9,
                            dataOut10 =>  s_DCT64Out10,
                            dataOut11 =>  s_DCT64Out11,
                            dataOut12 =>  s_DCT64Out12,
                            dataOut13 =>  s_DCT64Out13,
                            dataOut14 =>  s_DCT64Out14,
                            dataOut15 =>  s_DCT64Out15,
                            dataOut16 =>  s_DCT64Out16,
                            dataOut17 =>  s_DCT64Out17,
                            dataOut18 =>  s_DCT64Out18,
                            dataOut19 =>  s_DCT64Out19,
                            dataOut20 =>  s_DCT64Out20,
                            dataOut21 =>  s_DCT64Out21,
                            dataOut22 =>  s_DCT64Out22,
                            dataOut23 =>  s_DCT64Out23,
                            dataOut24 =>  s_DCT64Out24,
                            dataOut25 =>  s_DCT64Out25,
                            dataOut26 =>  s_DCT64Out26,
                            dataOut27 =>  s_DCT64Out27,
                            dataOut28 =>  s_DCT64Out28,
                            dataOut29 =>  s_DCT64Out29,
                            dataOut30 =>  s_DCT64Out30,
                            dataOut31 =>  s_DCT64Out31,
                            dataOut32 =>  s_DCT64Out32,
                            dataOut33 =>  s_DCT64Out33,
                            dataOut34 =>  s_DCT64Out34,
                            dataOut35 =>  s_DCT64Out35,
                            dataOut36 =>  s_DCT64Out36,
                            dataOut37 =>  s_DCT64Out37,
                            dataOut38 =>  s_DCT64Out38,
                            dataOut39 =>  s_DCT64Out39,
                            dataOut40 =>  s_DCT64Out40,
                            dataOut41 =>  s_DCT64Out41,
                            dataOut42 =>  s_DCT64Out42,
                            dataOut43 =>  s_DCT64Out43,
                            dataOut44 =>  s_DCT64Out44,
                            dataOut45 =>  s_DCT64Out45,
                            dataOut46 =>  s_DCT64Out46,
                            dataOut47 =>  s_DCT64Out47,
                            dataOut48 =>  s_DCT64Out48,
                            dataOut49 =>  s_DCT64Out49,
                            dataOut50 =>  s_DCT64Out50,
                            dataOut51 =>  s_DCT64Out51,
                            dataOut52 =>  s_DCT64Out52,
                            dataOut53 =>  s_DCT64Out53,
                            dataOut54 =>  s_DCT64Out54,
                            dataOut55 =>  s_DCT64Out55,
                            dataOut56 =>  s_DCT64Out56,
                            dataOut57 =>  s_DCT64Out57,
                            dataOut58 =>  s_DCT64Out58,
                            dataOut59 =>  s_DCT64Out59,
                            dataOut60 =>  s_DCT64Out60,
                            dataOut61 =>  s_DCT64Out61,
                            dataOut62 =>  s_DCT64Out62,
                            dataOut63 =>  s_DCT64Out63,
                            validOut  =>  s_DCT64ValOut
                        );                      
                
end TopLevelWrapper;