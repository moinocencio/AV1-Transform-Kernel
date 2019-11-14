----------------------------------------------------------------------------------
-- DCT Kernel Wrapper
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DCT_Wrapper is
    generic(K            : positive := 32);
    port(   -- Data Inputs
            dataIn0      : in    std_logic_vector(K-1 downto 0);
            dataIn1      : in    std_logic_vector(K-1 downto 0);
            dataIn2      : in    std_logic_vector(K-1 downto 0);
            dataIn3      : in    std_logic_vector(K-1 downto 0);
            dataIn4      : in    std_logic_vector(K-1 downto 0);
            dataIn5      : in    std_logic_vector(K-1 downto 0);
            dataIn6      : in    std_logic_vector(K-1 downto 0);
            dataIn7      : in    std_logic_vector(K-1 downto 0);
            dataIn8      : in    std_logic_vector(K-1 downto 0);
            dataIn9      : in    std_logic_vector(K-1 downto 0);
            dataIn10     : in    std_logic_vector(K-1 downto 0);
            dataIn11     : in    std_logic_vector(K-1 downto 0);
            dataIn12     : in    std_logic_vector(K-1 downto 0);
            dataIn13     : in    std_logic_vector(K-1 downto 0);
            dataIn14     : in    std_logic_vector(K-1 downto 0);
            dataIn15     : in    std_logic_vector(K-1 downto 0);
            dataIn16     : in    std_logic_vector(K-1 downto 0);
            dataIn17     : in    std_logic_vector(K-1 downto 0);
            dataIn18     : in    std_logic_vector(K-1 downto 0);
            dataIn19     : in    std_logic_vector(K-1 downto 0);
            dataIn20     : in    std_logic_vector(K-1 downto 0);
            dataIn21     : in    std_logic_vector(K-1 downto 0);
            dataIn22     : in    std_logic_vector(K-1 downto 0);
            dataIn23     : in    std_logic_vector(K-1 downto 0);
            dataIn24     : in    std_logic_vector(K-1 downto 0);
            dataIn25     : in    std_logic_vector(K-1 downto 0);
            dataIn26     : in    std_logic_vector(K-1 downto 0);
            dataIn27     : in    std_logic_vector(K-1 downto 0);
            dataIn28     : in    std_logic_vector(K-1 downto 0);
            dataIn29     : in    std_logic_vector(K-1 downto 0);
            dataIn30     : in    std_logic_vector(K-1 downto 0);
            dataIn31     : in    std_logic_vector(K-1 downto 0);
            dataIn32     : in    std_logic_vector(K-1 downto 0);
            dataIn33     : in    std_logic_vector(K-1 downto 0);
            dataIn34     : in    std_logic_vector(K-1 downto 0);
            dataIn35     : in    std_logic_vector(K-1 downto 0);
            dataIn36     : in    std_logic_vector(K-1 downto 0);
            dataIn37     : in    std_logic_vector(K-1 downto 0);
            dataIn38     : in    std_logic_vector(K-1 downto 0);
            dataIn39     : in    std_logic_vector(K-1 downto 0);
            dataIn40     : in    std_logic_vector(K-1 downto 0);
            dataIn41     : in    std_logic_vector(K-1 downto 0);
            dataIn42     : in    std_logic_vector(K-1 downto 0);
            dataIn43     : in    std_logic_vector(K-1 downto 0);
            dataIn44     : in    std_logic_vector(K-1 downto 0);
            dataIn45     : in    std_logic_vector(K-1 downto 0);
            dataIn46     : in    std_logic_vector(K-1 downto 0);
            dataIn47     : in    std_logic_vector(K-1 downto 0);
            dataIn48     : in    std_logic_vector(K-1 downto 0);
            dataIn49     : in    std_logic_vector(K-1 downto 0);
            dataIn50     : in    std_logic_vector(K-1 downto 0);
            dataIn51     : in    std_logic_vector(K-1 downto 0);
            dataIn52     : in    std_logic_vector(K-1 downto 0);
            dataIn53     : in    std_logic_vector(K-1 downto 0);
            dataIn54     : in    std_logic_vector(K-1 downto 0);
            dataIn55     : in    std_logic_vector(K-1 downto 0);
            dataIn56     : in    std_logic_vector(K-1 downto 0);
            dataIn57     : in    std_logic_vector(K-1 downto 0);
            dataIn58     : in    std_logic_vector(K-1 downto 0);
            dataIn59     : in    std_logic_vector(K-1 downto 0);
            dataIn60     : in    std_logic_vector(K-1 downto 0);
            dataIn61     : in    std_logic_vector(K-1 downto 0);
            dataIn62     : in    std_logic_vector(K-1 downto 0);
            dataIn63     : in    std_logic_vector(K-1 downto 0);
            -- Control Inputs
            res         : in    std_logic;
            en          : in    std_logic;
            clk         : in    std_logic;
            sel         : in    std_logic_vector(2 downto 0);
            -- Data Outputs
            dataOut0      : out    std_logic_vector(K-1 downto 0);
            dataOut1      : out    std_logic_vector(K-1 downto 0);
            dataOut2      : out    std_logic_vector(K-1 downto 0);
            dataOut3      : out    std_logic_vector(K-1 downto 0);
            dataOut4      : out    std_logic_vector(K-1 downto 0);
            dataOut5      : out    std_logic_vector(K-1 downto 0);
            dataOut6      : out    std_logic_vector(K-1 downto 0);
            dataOut7      : out    std_logic_vector(K-1 downto 0);
            dataOut8      : out    std_logic_vector(K-1 downto 0);
            dataOut9      : out    std_logic_vector(K-1 downto 0);
            dataOut10     : out    std_logic_vector(K-1 downto 0);
            dataOut11     : out    std_logic_vector(K-1 downto 0);
            dataOut12     : out    std_logic_vector(K-1 downto 0);
            dataOut13     : out    std_logic_vector(K-1 downto 0);
            dataOut14     : out    std_logic_vector(K-1 downto 0);
            dataOut15     : out    std_logic_vector(K-1 downto 0);
            dataOut16     : out    std_logic_vector(K-1 downto 0);
            dataOut17     : out    std_logic_vector(K-1 downto 0);
            dataOut18     : out    std_logic_vector(K-1 downto 0);
            dataOut19     : out    std_logic_vector(K-1 downto 0);
            dataOut20     : out    std_logic_vector(K-1 downto 0);
            dataOut21     : out    std_logic_vector(K-1 downto 0);
            dataOut22     : out    std_logic_vector(K-1 downto 0);
            dataOut23     : out    std_logic_vector(K-1 downto 0);
            dataOut24     : out    std_logic_vector(K-1 downto 0);
            dataOut25     : out    std_logic_vector(K-1 downto 0);
            dataOut26     : out    std_logic_vector(K-1 downto 0);
            dataOut27     : out    std_logic_vector(K-1 downto 0);
            dataOut28     : out    std_logic_vector(K-1 downto 0);
            dataOut29     : out    std_logic_vector(K-1 downto 0);
            dataOut30     : out    std_logic_vector(K-1 downto 0);
            dataOut31     : out    std_logic_vector(K-1 downto 0);
            dataOut32     : out    std_logic_vector(K-1 downto 0);
            dataOut33     : out    std_logic_vector(K-1 downto 0);
            dataOut34     : out    std_logic_vector(K-1 downto 0);
            dataOut35     : out    std_logic_vector(K-1 downto 0);
            dataOut36     : out    std_logic_vector(K-1 downto 0);
            dataOut37     : out    std_logic_vector(K-1 downto 0);
            dataOut38     : out    std_logic_vector(K-1 downto 0);
            dataOut39     : out    std_logic_vector(K-1 downto 0);
            dataOut40     : out    std_logic_vector(K-1 downto 0);
            dataOut41     : out    std_logic_vector(K-1 downto 0);
            dataOut42     : out    std_logic_vector(K-1 downto 0);
            dataOut43     : out    std_logic_vector(K-1 downto 0);
            dataOut44     : out    std_logic_vector(K-1 downto 0);
            dataOut45     : out    std_logic_vector(K-1 downto 0);
            dataOut46     : out    std_logic_vector(K-1 downto 0);
            dataOut47     : out    std_logic_vector(K-1 downto 0);
            dataOut48     : out    std_logic_vector(K-1 downto 0);
            dataOut49     : out    std_logic_vector(K-1 downto 0);
            dataOut50     : out    std_logic_vector(K-1 downto 0);
            dataOut51     : out    std_logic_vector(K-1 downto 0);
            dataOut52     : out    std_logic_vector(K-1 downto 0);
            dataOut53     : out    std_logic_vector(K-1 downto 0);
            dataOut54     : out    std_logic_vector(K-1 downto 0);
            dataOut55     : out    std_logic_vector(K-1 downto 0);
            dataOut56     : out    std_logic_vector(K-1 downto 0);
            dataOut57     : out    std_logic_vector(K-1 downto 0);
            dataOut58     : out    std_logic_vector(K-1 downto 0);
            dataOut59     : out    std_logic_vector(K-1 downto 0);
            dataOut60     : out    std_logic_vector(K-1 downto 0);
            dataOut61     : out    std_logic_vector(K-1 downto 0);
            dataOut62     : out    std_logic_vector(K-1 downto 0);
            dataOut63     : out    std_logic_vector(K-1 downto 0);
            -- Control Outputs
            validOut    : out   std_logic
    );
end DCT_Wrapper;

architecture Behavioral of DCT_Wrapper is
    signal s_res, s_en, s_clk       :   std_logic := '0';

    -- DCT4
    signal s_DCT4In0, s_DCT4In1, s_DCT4In2, s_DCT4In3   : integer := 0;
    signal s_OutI0, s_OutI1, s_OutI2, s_OutI3   : integer := 0;
    signal s_DCT4En, s_DCT4ValOut   : std_logic := '0';

    -- DCT8 Stage 1
    signal s_DCT8Stg1In0, s_DCT8Stg1In1, s_DCT8Stg1In2, s_DCT8Stg1In3, s_DCT8Stg1In4, s_DCT8Stg1In5, s_DCT8Stg1In6, s_DCT8Stg1In7   : integer := 0;
    signal s_DCT8Stg1Out0, s_DCT8Stg1Out1, s_DCT8Stg1Out2, s_DCT8Stg1Out3, s_DCT8Stg1Out4, s_DCT8Stg1Out5, s_DCT8Stg1Out6, s_DCT8Stg1Out7   : integer := 0;
    signal s_DCT8Stg1En, s_DCT8Stg1ValOut   : std_logic := '0';

    -- DCT8 Stage 2
    signal s_OutI4, s_OutI5, s_OutI6, s_OutI7   : integer := 0;
    signal s_DCT8ValOut     : std_logic := '0';

    -- DCT16 Stage 1
    signal s_DCT16Stg1In0, s_DCT16Stg1In1, s_DCT16Stg1In2, s_DCT16Stg1In3, s_DCT16Stg1In4, s_DCT16Stg1In5, s_DCT16Stg1In6, s_DCT16Stg1In7, s_DCT16Stg1In8, s_DCT16Stg1In9, s_DCT16Stg1In10, s_DCT16Stg1In11, s_DCT16Stg1In12, s_DCT16Stg1In13, s_DCT16Stg1In14, s_DCT16Stg1In15   : integer := 0;
    signal s_DCT16Stg1Out0, s_DCT16Stg1Out1, s_DCT16Stg1Out2, s_DCT16Stg1Out3, s_DCT16Stg1Out4, s_DCT16Stg1Out5, s_DCT16Stg1Out6, s_DCT16Stg1Out7, s_DCT16Stg1Out8, s_DCT16Stg1Out9, s_DCT16Stg1Out10, s_DCT16Stg1Out11, s_DCT16Stg1Out12, s_DCT16Stg1Out13, s_DCT16Stg1Out14, s_DCT16Stg1Out15   : integer := 0;
    signal s_DCT16Stg1En, s_DCT16Stg1ValOut     : std_logic := '0';

    -- DCT16 Stage 2
    signal s_OutIOut8, s_OutIOut9, s_OutIOut10, s_OutIOut11, s_OutIOut12, s_OutIOut13, s_OutIOut14, s_OutIOut15   : integer := 0;
    signal s_DCT16ValOut     : std_logic := '0';

    -- DCT32 Stage 1
    signal s_DCT32Stg1In0, s_DCT32Stg1In1, s_DCT32Stg1In2, s_DCT32Stg1In3, s_DCT32Stg1In4, s_DCT32Stg1In5, s_DCT32Stg1In6, s_DCT32Stg1In7, s_DCT32Stg1In8, s_DCT32Stg1In9, s_DCT32Stg1In10, s_DCT32Stg1In11, s_DCT32Stg1In12, s_DCT32Stg1In13, s_DCT32Stg1In14, s_DCT32Stg1In15, s_DCT32Stg1In16, s_DCT32Stg1In17, s_DCT32Stg1In18, s_DCT32Stg1In19, s_DCT32Stg1In20, s_DCT32Stg1In21, s_DCT32Stg1In22, s_DCT32Stg1In23, s_DCT32Stg1In24, s_DCT32Stg1In25, s_DCT32Stg1In26, s_DCT32Stg1In27, s_DCT32Stg1In28, s_DCT32Stg1In29, s_DCT32Stg1In30, s_DCT32Stg1In31     :   integer := 0;
    signal s_DCT32Stg1Out0, s_DCT32Stg1Out1, s_DCT32Stg1Out2, s_DCT32Stg1Out3, s_DCT32Stg1Out4, s_DCT32Stg1Out5, s_DCT32Stg1Out6, s_DCT32Stg1Out7, s_DCT32Stg1Out8, s_DCT32Stg1Out9, s_DCT32Stg1Out10, s_DCT32Stg1Out11, s_DCT32Stg1Out12, s_DCT32Stg1Out13, s_DCT32Stg1Out14, s_DCT32Stg1Out15, s_DCT32Stg1Out16, s_DCT32Stg1Out17, s_DCT32Stg1Out18, s_DCT32Stg1Out19, s_DCT32Stg1Out20, s_DCT32Stg1Out21, s_DCT32Stg1Out22, s_DCT32Stg1Out23, s_DCT32Stg1Out24, s_DCT32Stg1Out25, s_DCT32Stg1Out26, s_DCT32Stg1Out27, s_DCT32Stg1Out28, s_DCT32Stg1Out29, s_DCT32Stg1Out30, s_DCT32Stg1Out31     :   integer := 0;
    signal s_DCT32Stg1En, s_DCT32Stg1ValOut     : std_logic := '0';

    -- DCT32 Stage 2
    signal s_OutI8, s_OutI9, s_OutI10, s_OutI11, s_OutI12, s_OutI13, s_OutI14, s_OutI15, s_OutI16, s_OutI17, s_OutI18, s_OutI19, s_OutI20, s_OutI21, s_OutI22, s_OutI23, s_OutI24, s_OutI25, s_OutI26, s_OutI27, s_OutI28, s_OutI29, s_OutI30, s_OutI31     :   integer := 0;
    signal s_DCT32ValOut    : std_logic := '0';

    -- DCT64 Stage 1
    signal s_DCT64Stg1In0, s_DCT64Stg1In1, s_DCT64Stg1In2, s_DCT64Stg1In3, s_DCT64Stg1In4, s_DCT64Stg1In5, s_DCT64Stg1In6, s_DCT64Stg1In7, s_DCT64Stg1In8, s_DCT64Stg1In9, s_DCT64Stg1In10, s_DCT64Stg1In11, s_DCT64Stg1In12, s_DCT64Stg1In13, s_DCT64Stg1In14, s_DCT64Stg1In15, s_DCT64Stg1In16, s_DCT64Stg1In17, s_DCT64Stg1In18, s_DCT64Stg1In19, s_DCT64Stg1In20, s_DCT64Stg1In21, s_DCT64Stg1In22, s_DCT64Stg1In23, s_DCT64Stg1In24, s_DCT64Stg1In25, s_DCT64Stg1In26, s_DCT64Stg1In27, s_DCT64Stg1In28, s_DCT64Stg1In29, s_DCT64Stg1In30, s_DCT64Stg1In31, s_DCT64Stg1In32, s_DCT64Stg1In33, s_DCT64Stg1In34, s_DCT64Stg1In35, s_DCT64Stg1In36, s_DCT64Stg1In37, s_DCT64Stg1In38, s_DCT64Stg1In39, s_DCT64Stg1In40, s_DCT64Stg1In41, s_DCT64Stg1In42, s_DCT64Stg1In43, s_DCT64Stg1In44, s_DCT64Stg1In45, s_DCT64Stg1In46, s_DCT64Stg1In47, s_DCT64Stg1In48, s_DCT64Stg1In49, s_DCT64Stg1In50, s_DCT64Stg1In51, s_DCT64Stg1In52, s_DCT64Stg1In53, s_DCT64Stg1In54,s_DCT64Stg1In55, s_DCT64Stg1In56, s_DCT64Stg1In57, s_DCT64Stg1In58, s_DCT64Stg1In59, s_DCT64Stg1In60, s_DCT64Stg1In61, s_DCT64Stg1In62, s_DCT64Stg1In63          :   integer := 0;
    signal s_DCT64Stg1Out0, s_DCT64Stg1Out1, s_DCT64Stg1Out2, s_DCT64Stg1Out3, s_DCT64Stg1Out4, s_DCT64Stg1Out5, s_DCT64Stg1Out6, s_DCT64Stg1Out7, s_DCT64Stg1Out8, s_DCT64Stg1Out9, s_DCT64Stg1Out10, s_DCT64Stg1Out11, s_DCT64Stg1Out12, s_DCT64Stg1Out13, s_DCT64Stg1Out14, s_DCT64Stg1Out15, s_DCT64Stg1Out16, s_DCT64Stg1Out17, s_DCT64Stg1Out18, s_DCT64Stg1Out19, s_DCT64Stg1Out20, s_DCT64Stg1Out21, s_DCT64Stg1Out22, s_DCT64Stg1Out23, s_DCT64Stg1Out24, s_DCT64Stg1Out25, s_DCT64Stg1Out26, s_DCT64Stg1Out27, s_DCT64Stg1Out28, s_DCT64Stg1Out29, s_DCT64Stg1Out30, s_DCT64Stg1Out31, s_DCT64Stg1Out32, s_DCT64Stg1Out33, s_DCT64Stg1Out34, s_DCT64Stg1Out35, s_DCT64Stg1Out36, s_DCT64Stg1Out37, s_DCT64Stg1Out38, s_DCT64Stg1Out39, s_DCT64Stg1Out40, s_DCT64Stg1Out41, s_DCT64Stg1Out42, s_DCT64Stg1Out43, s_DCT64Stg1Out44, s_DCT64Stg1Out45, s_DCT64Stg1Out46, s_DCT64Stg1Out47, s_DCT64Stg1Out48, s_DCT64Stg1Out49, s_DCT64Stg1Out50, s_DCT64Stg1Out51, s_DCT64Stg1Out52, s_DCT64Stg1Out53, s_DCT64Stg1Out54,s_DCT64Stg1Out55, s_DCT64Stg1Out56, s_DCT64Stg1Out57, s_DCT64Stg1Out58, s_DCT64Stg1Out59, s_DCT64Stg1Out60, s_DCT64Stg1Out61, s_DCT64Stg1Out62, s_DCT64Stg1Out63          :   integer := 0;
    signal s_DCT64Stg1En, s_DCT64Stg1ValOut     : std_logic := '0';

    -- DCT64 Stage 2
    signal s_OutI32, s_OutI33, s_OutI34, s_OutI35, s_OutI36, s_OutI37, s_OutI38, s_OutI39, s_OutI40, s_OutI41, s_OutI42, s_OutI43, s_OutI44, s_OutI45, s_OutI46, s_OutI47, s_OutI48, s_OutI49, s_OutI50, s_OutI51, s_OutI52, s_OutI53, s_OutI54,s_OutI55, s_OutI56, s_OutI57, s_OutI58, s_OutI59, s_OutI60, s_OutI61, s_OutI62, s_OutI63          :   integer := 0;
    signal s_DCT64ValOut     : std_logic := '0';
begin

    s_en    <= en;
    s_clk   <= clk;
    s_res   <= res;
    
    DCT4:   entity work.DCT4_I(Behavioral)
            port map(   dataIn0     => s_DCT4In0,
                        dataIn1     => s_DCT4In1,
                        dataIn2     => s_DCT4In2,
                        dataIn3     => s_DCT4In3,
                        res         => s_res,
                        en          => s_DCT4En,
                        clk         => s_clk,
                        dataOut0    => s_OutI0,
                        dataOut1    => s_OutI1,
                        dataOut2    => s_OutI2,
                        dataOut3    => s_OutI3,
                        validOut    => s_DCT4ValOut
                    );

    DCT81:  entity work.DCT8_1_I(Behavioral)
            port map(   dataIn0     => s_DCT8Stg1In0,
                        dataIn1     => s_DCT8Stg1In1,
                        dataIn2     => s_DCT8Stg1In2,
                        dataIn3     => s_DCT8Stg1In3,
                        dataIn4     => s_DCT8Stg1In4,
                        dataIn5     => s_DCT8Stg1In5,
                        dataIn6     => s_DCT8Stg1In6,
                        dataIn7     => s_DCT8Stg1In7,
                        res         => s_res,
                        en          => s_DCT8Stg1En,
                        clk         => s_clk,
                        dataOut0    => s_DCT8Stg1Out0,
                        dataOut1    => s_DCT8Stg1Out1,
                        dataOut2    => s_DCT8Stg1Out2,
                        dataOut3    => s_DCT8Stg1Out3,
                        dataOut4    => s_DCT8Stg1Out4,
                        dataOut5    => s_DCT8Stg1Out5,
                        dataOut6    => s_DCT8Stg1Out6,
                        dataOut7    => s_DCT8Stg1Out7,
                        validOut    => s_DCT8Stg1ValOut
                    );

    DCT82:  entity work.DCT8_2_I(Behavioral)
            port map(   dataIn4     => s_DCT8Stg1Out4,
                        dataIn5     => s_DCT8Stg1Out5,
                        dataIn6     => s_DCT8Stg1Out6,
                        dataIn7     => s_DCT8Stg1Out7,
                        res         => s_res,
                        en          => s_DCT8Stg1ValOut,
                        clk         => s_clk,
                        dataOut4    => s_OutI4,
                        dataOut5    => s_OutI5,
                        dataOut6    => s_OutI6,
                        dataOut7    => s_OutI7,
                        validOut    => s_DCT8ValOut
                    );

    DCT161: entity work.DCT16_1_I(Behavioral)
            port map(   dataIn0     => s_DCT16Stg1In0,
                        dataIn1     => s_DCT16Stg1In1,
                        dataIn2     => s_DCT16Stg1In2,
                        dataIn3     => s_DCT16Stg1In3,
                        dataIn4     => s_DCT16Stg1In4,
                        dataIn5     => s_DCT16Stg1In5,
                        dataIn6     => s_DCT16Stg1In6,
                        dataIn7     => s_DCT16Stg1In7,
                        dataIn8     => s_DCT16Stg1In8,
                        dataIn9     => s_DCT16Stg1In9,
                        dataIn10    => s_DCT16Stg1In10,
                        dataIn11    => s_DCT16Stg1In11,
                        dataIn12    => s_DCT16Stg1In12,
                        dataIn13    => s_DCT16Stg1In13,
                        dataIn14    => s_DCT16Stg1In14,
                        dataIn15    => s_DCT16Stg1In15,
                        res         => s_res,
                        en          => s_DCT16Stg1En,
                        clk         => s_clk,
                        dataOut0    => s_DCT16Stg1Out0,
                        dataOut1    => s_DCT16Stg1Out1,
                        dataOut2    => s_DCT16Stg1Out2,
                        dataOut3    => s_DCT16Stg1Out3,
                        dataOut4    => s_DCT16Stg1Out4,
                        dataOut5    => s_DCT16Stg1Out5,
                        dataOut6    => s_DCT16Stg1Out6,
                        dataOut7    => s_DCT16Stg1Out7,
                        dataOut8    => s_DCT16Stg1Out8,
                        dataOut9    => s_DCT16Stg1Out9,
                        dataOut10   => s_DCT16Stg1Out10,
                        dataOut11   => s_DCT16Stg1Out11,
                        dataOut12   => s_DCT16Stg1Out12,
                        dataOut13   => s_DCT16Stg1Out13,
                        dataOut14   => s_DCT16Stg1Out14,
                        dataOut15   => s_DCT16Stg1Out15,
                        validOut    => s_DCT16Stg1ValOut
                    );

    DCT162: entity work.DCT16_2_I(Behavioral)
            port map(   dataIn8     => s_DCT16Stg1Out8,
                        dataIn9     => s_DCT16Stg1Out9,
                        dataIn10    => s_DCT16Stg1Out10,
                        dataIn11    => s_DCT16Stg1Out11,
                        dataIn12    => s_DCT16Stg1Out12,
                        dataIn13    => s_DCT16Stg1Out13,
                        dataIn14    => s_DCT16Stg1Out14,
                        dataIn15    => s_DCT16Stg1Out15,
                        res         => s_res,
                        en          => s_DCT16Stg1ValOut,
                        clk         => s_clk,
                        dataOut8    => s_OutI8,
                        dataOut9    => s_OutI9,
                        dataOut10   => s_OutI10,
                        dataOut11   => s_OutI11,
                        dataOut12   => s_OutI12,
                        dataOut13   => s_OutI13,
                        dataOut14   => s_OutI14,
                        dataOut15   => s_OutI15,
                        validOut    => s_DCT16ValOut
                    );

    DCT321: entity work.DCT32_1_I(Behavioral)
            port map(   dataIn0     => s_DCT32Stg1In0,
                        dataIn1     => s_DCT32Stg1In1,
                        dataIn2     => s_DCT32Stg1In2,
                        dataIn3     => s_DCT32Stg1In3,
                        dataIn4     => s_DCT32Stg1In4,
                        dataIn5     => s_DCT32Stg1In5,
                        dataIn6     => s_DCT32Stg1In6,
                        dataIn7     => s_DCT32Stg1In7,
                        dataIn8     => s_DCT32Stg1In8,
                        dataIn9     => s_DCT32Stg1In9,
                        dataIn10    => s_DCT32Stg1In10,
                        dataIn11    => s_DCT32Stg1In11,
                        dataIn12    => s_DCT32Stg1In12,
                        dataIn13    => s_DCT32Stg1In13,
                        dataIn14    => s_DCT32Stg1In14,
                        dataIn15    => s_DCT32Stg1In15,
                        dataIn16    => s_DCT32Stg1In16,
                        dataIn17    => s_DCT32Stg1In17,
                        dataIn18    => s_DCT32Stg1In18,
                        dataIn19    => s_DCT32Stg1In19,
                        dataIn20    => s_DCT32Stg1In20,
                        dataIn21    => s_DCT32Stg1In21,
                        dataIn22    => s_DCT32Stg1In22,
                        dataIn23    => s_DCT32Stg1In23,
                        dataIn24    => s_DCT32Stg1In24,
                        dataIn25    => s_DCT32Stg1In25,
                        dataIn26    => s_DCT32Stg1In26,
                        dataIn27    => s_DCT32Stg1In27,
                        dataIn28    => s_DCT32Stg1In28,
                        dataIn29    => s_DCT32Stg1In29,
                        dataIn30    => s_DCT32Stg1In30,
                        dataIn31    => s_DCT32Stg1In31,
                        res         => s_res,
                        en          => s_DCT32Stg1En,
                        clk         => s_clk,
                        dataOut0    => s_DCT32Stg1Out0,
                        dataOut1    => s_DCT32Stg1Out1,
                        dataOut2    => s_DCT32Stg1Out2,
                        dataOut3    => s_DCT32Stg1Out3,
                        dataOut4    => s_DCT32Stg1Out4,
                        dataOut5    => s_DCT32Stg1Out5,
                        dataOut6    => s_DCT32Stg1Out6,
                        dataOut7    => s_DCT32Stg1Out7,
                        dataOut8    => s_DCT32Stg1Out8,
                        dataOut9    => s_DCT32Stg1Out9,
                        dataOut10   => s_DCT32Stg1Out10,
                        dataOut11   => s_DCT32Stg1Out11,
                        dataOut12   => s_DCT32Stg1Out12,
                        dataOut13   => s_DCT32Stg1Out13,
                        dataOut14   => s_DCT32Stg1Out14,
                        dataOut15   => s_DCT32Stg1Out15,
                        dataOut16   => s_DCT32Stg1Out16,
                        dataOut17   => s_DCT32Stg1Out17,
                        dataOut18   => s_DCT32Stg1Out18,
                        dataOut19   => s_DCT32Stg1Out19,
                        dataOut20   => s_DCT32Stg1Out20,
                        dataOut21   => s_DCT32Stg1Out21,
                        dataOut22   => s_DCT32Stg1Out22,
                        dataOut23   => s_DCT32Stg1Out23,
                        dataOut24   => s_DCT32Stg1Out24,
                        dataOut25   => s_DCT32Stg1Out25,
                        dataOut26   => s_DCT32Stg1Out26,
                        dataOut27   => s_DCT32Stg1Out27,
                        dataOut28   => s_DCT32Stg1Out28,
                        dataOut29   => s_DCT32Stg1Out29,
                        dataOut30   => s_DCT32Stg1Out30,
                        dataOut31   => s_DCT32Stg1Out31,
                        validOut    => s_DCT32Stg1ValOut
                    );

    DCT322: entity work.DCT32_2_I(Behavioral)
            port map(   dataIn16    => s_DCT32Stg1Out16,
                        dataIn17    => s_DCT32Stg1Out17,
                        dataIn18    => s_DCT32Stg1Out18,
                        dataIn19    => s_DCT32Stg1Out19,
                        dataIn20    => s_DCT32Stg1Out20,
                        dataIn21    => s_DCT32Stg1Out21,
                        dataIn22    => s_DCT32Stg1Out22,
                        dataIn23    => s_DCT32Stg1Out23,
                        dataIn24    => s_DCT32Stg1Out24,
                        dataIn25    => s_DCT32Stg1Out25,
                        dataIn26    => s_DCT32Stg1Out26,
                        dataIn27    => s_DCT32Stg1Out27,
                        dataIn28    => s_DCT32Stg1Out28,
                        dataIn29    => s_DCT32Stg1Out29,
                        dataIn30    => s_DCT32Stg1Out30,
                        dataIn31    => s_DCT32Stg1Out31,
                        res         => s_res,
                        en          => s_DCT32Stg1ValOut,
                        clk         => s_clk,
                        dataOut16   => s_OutI16,
                        dataOut17   => s_OutI17,
                        dataOut18   => s_OutI18,
                        dataOut19   => s_OutI19,
                        dataOut20   => s_OutI20,
                        dataOut21   => s_OutI21,
                        dataOut22   => s_OutI22,
                        dataOut23   => s_OutI23,
                        dataOut24   => s_OutI24,
                        dataOut25   => s_OutI25,
                        dataOut26   => s_OutI26,
                        dataOut27   => s_OutI27,
                        dataOut28   => s_OutI28,
                        dataOut29   => s_OutI29,
                        dataOut30   => s_OutI30,
                        dataOut31   => s_OutI31,
                        validOut    => s_DCT32ValOut
                    );

    DCT641: entity work.DCT64_1_I(Behavioral)
            port map(   dataIn0     => s_DCT64Stg1In0,
                        dataIn1     => s_DCT64Stg1In1,
                        dataIn2     => s_DCT64Stg1In2,
                        dataIn3     => s_DCT64Stg1In3,
                        dataIn4     => s_DCT64Stg1In4,
                        dataIn5     => s_DCT64Stg1In5,
                        dataIn6     => s_DCT64Stg1In6,
                        dataIn7     => s_DCT64Stg1In7,
                        dataIn8     => s_DCT64Stg1In8,
                        dataIn9     => s_DCT64Stg1In9,
                        dataIn10    => s_DCT64Stg1In10,
                        dataIn11    => s_DCT64Stg1In11,
                        dataIn12    => s_DCT64Stg1In12,
                        dataIn13    => s_DCT64Stg1In13,
                        dataIn14    => s_DCT64Stg1In14,
                        dataIn15    => s_DCT64Stg1In15,
                        dataIn16    => s_DCT64Stg1In16,
                        dataIn17    => s_DCT64Stg1In17,
                        dataIn18    => s_DCT64Stg1In18,
                        dataIn19    => s_DCT64Stg1In19,
                        dataIn20    => s_DCT64Stg1In20,
                        dataIn21    => s_DCT64Stg1In21,
                        dataIn22    => s_DCT64Stg1In22,
                        dataIn23    => s_DCT64Stg1In23,
                        dataIn24    => s_DCT64Stg1In24,
                        dataIn25    => s_DCT64Stg1In25,
                        dataIn26    => s_DCT64Stg1In26,
                        dataIn27    => s_DCT64Stg1In27,
                        dataIn28    => s_DCT64Stg1In28,
                        dataIn29    => s_DCT64Stg1In29,
                        dataIn30    => s_DCT64Stg1In30,
                        dataIn31    => s_DCT64Stg1In31,
                        dataIn32    => s_DCT64Stg1In32,
                        dataIn33    => s_DCT64Stg1In33,
                        dataIn34    => s_DCT64Stg1In34,
                        dataIn35    => s_DCT64Stg1In35,
                        dataIn36    => s_DCT64Stg1In36,
                        dataIn37    => s_DCT64Stg1In37,
                        dataIn38    => s_DCT64Stg1In38,
                        dataIn39    => s_DCT64Stg1In39,
                        dataIn40    => s_DCT64Stg1In40,
                        dataIn41    => s_DCT64Stg1In41,
                        dataIn42    => s_DCT64Stg1In42,
                        dataIn43    => s_DCT64Stg1In43,
                        dataIn44    => s_DCT64Stg1In44,
                        dataIn45    => s_DCT64Stg1In45,
                        dataIn46    => s_DCT64Stg1In46,
                        dataIn47    => s_DCT64Stg1In47,
                        dataIn48    => s_DCT64Stg1In48,
                        dataIn49    => s_DCT64Stg1In49,
                        dataIn50    => s_DCT64Stg1In50,
                        dataIn51    => s_DCT64Stg1In51,
                        dataIn52    => s_DCT64Stg1In52,
                        dataIn53    => s_DCT64Stg1In53,
                        dataIn54    => s_DCT64Stg1In54,
                        dataIn55    => s_DCT64Stg1In55,
                        dataIn56    => s_DCT64Stg1In56,
                        dataIn57    => s_DCT64Stg1In57,
                        dataIn58    => s_DCT64Stg1In58,
                        dataIn59    => s_DCT64Stg1In59,
                        dataIn60    => s_DCT64Stg1In60,
                        dataIn61    => s_DCT64Stg1In61,
                        dataIn62    => s_DCT64Stg1In62,
                        dataIn63    => s_DCT64Stg1In63,
                        res         => s_res,
                        en          => s_DCT64Stg1En,
                        clk         => s_clk,
                        dataOut0    => s_DCT64Stg1Out0,
                        dataOut1    => s_DCT64Stg1Out1,
                        dataOut2    => s_DCT64Stg1Out2,
                        dataOut3    => s_DCT64Stg1Out3,
                        dataOut4    => s_DCT64Stg1Out4,
                        dataOut5    => s_DCT64Stg1Out5,
                        dataOut6    => s_DCT64Stg1Out6,
                        dataOut7    => s_DCT64Stg1Out7,
                        dataOut8    => s_DCT64Stg1Out8,
                        dataOut9    => s_DCT64Stg1Out9,
                        dataOut10   => s_DCT64Stg1Out10,
                        dataOut11   => s_DCT64Stg1Out11,
                        dataOut12   => s_DCT64Stg1Out12,
                        dataOut13   => s_DCT64Stg1Out13,
                        dataOut14   => s_DCT64Stg1Out14,
                        dataOut15   => s_DCT64Stg1Out15,
                        dataOut16   => s_DCT64Stg1Out16,
                        dataOut17   => s_DCT64Stg1Out17,
                        dataOut18   => s_DCT64Stg1Out18,
                        dataOut19   => s_DCT64Stg1Out19,
                        dataOut20   => s_DCT64Stg1Out20,
                        dataOut21   => s_DCT64Stg1Out21,
                        dataOut22   => s_DCT64Stg1Out22,
                        dataOut23   => s_DCT64Stg1Out23,
                        dataOut24   => s_DCT64Stg1Out24,
                        dataOut25   => s_DCT64Stg1Out25,
                        dataOut26   => s_DCT64Stg1Out26,
                        dataOut27   => s_DCT64Stg1Out27,
                        dataOut28   => s_DCT64Stg1Out28,
                        dataOut29   => s_DCT64Stg1Out29,
                        dataOut30   => s_DCT64Stg1Out30,
                        dataOut31   => s_DCT64Stg1Out31,
                        dataOut32   => s_DCT64Stg1Out32,
                        dataOut33   => s_DCT64Stg1Out33,
                        dataOut34   => s_DCT64Stg1Out34,
                        dataOut35   => s_DCT64Stg1Out35,
                        dataOut36   => s_DCT64Stg1Out36,
                        dataOut37   => s_DCT64Stg1Out37,
                        dataOut38   => s_DCT64Stg1Out38,
                        dataOut39   => s_DCT64Stg1Out39,
                        dataOut40   => s_DCT64Stg1Out40,
                        dataOut41   => s_DCT64Stg1Out41,
                        dataOut42   => s_DCT64Stg1Out42,
                        dataOut43   => s_DCT64Stg1Out43,
                        dataOut44   => s_DCT64Stg1Out44,
                        dataOut45   => s_DCT64Stg1Out45,
                        dataOut46   => s_DCT64Stg1Out46,
                        dataOut47   => s_DCT64Stg1Out47,
                        dataOut48   => s_DCT64Stg1Out48,
                        dataOut49   => s_DCT64Stg1Out49,
                        dataOut50   => s_DCT64Stg1Out50,
                        dataOut51   => s_DCT64Stg1Out51,
                        dataOut52   => s_DCT64Stg1Out52,
                        dataOut53   => s_DCT64Stg1Out53,
                        dataOut54   => s_DCT64Stg1Out54,
                        dataOut55   => s_DCT64Stg1Out55,
                        dataOut56   => s_DCT64Stg1Out56,
                        dataOut57   => s_DCT64Stg1Out57,
                        dataOut58   => s_DCT64Stg1Out58,
                        dataOut59   => s_DCT64Stg1Out59,
                        dataOut60   => s_DCT64Stg1Out60,
                        dataOut61   => s_DCT64Stg1Out61,
                        dataOut62   => s_DCT64Stg1Out62,
                        dataOut63   => s_DCT64Stg1Out63,
                        validOut    => s_DCT64Stg1ValOut
                    );

    DCT642: entity work.DCT64_2_I(Behavioral)
            port map(   dataIn32    => s_DCT64Stg1Out32,
                        dataIn33    => s_DCT64Stg1Out33,
                        dataIn34    => s_DCT64Stg1Out34,
                        dataIn35    => s_DCT64Stg1Out35,
                        dataIn36    => s_DCT64Stg1Out36,
                        dataIn37    => s_DCT64Stg1Out37,
                        dataIn38    => s_DCT64Stg1Out38,
                        dataIn39    => s_DCT64Stg1Out39,
                        dataIn40    => s_DCT64Stg1Out40,
                        dataIn41    => s_DCT64Stg1Out41,
                        dataIn42    => s_DCT64Stg1Out42,
                        dataIn43    => s_DCT64Stg1Out43,
                        dataIn44    => s_DCT64Stg1Out44,
                        dataIn45    => s_DCT64Stg1Out45,
                        dataIn46    => s_DCT64Stg1Out46,
                        dataIn47    => s_DCT64Stg1Out47,
                        dataIn48    => s_DCT64Stg1Out48,
                        dataIn49    => s_DCT64Stg1Out49,
                        dataIn50    => s_DCT64Stg1Out50,
                        dataIn51    => s_DCT64Stg1Out51,
                        dataIn52    => s_DCT64Stg1Out52,
                        dataIn53    => s_DCT64Stg1Out53,
                        dataIn54    => s_DCT64Stg1Out54,
                        dataIn55    => s_DCT64Stg1Out55,
                        dataIn56    => s_DCT64Stg1Out56,
                        dataIn57    => s_DCT64Stg1Out57,
                        dataIn58    => s_DCT64Stg1Out58,
                        dataIn59    => s_DCT64Stg1Out59,
                        dataIn60    => s_DCT64Stg1Out60,
                        dataIn61    => s_DCT64Stg1Out61,
                        dataIn62    => s_DCT64Stg1Out62,
                        dataIn63    => s_DCT64Stg1Out63,
                        res         => s_res,
                        en          => s_DCT64Stg1ValOut,
                        clk         => s_clk,
                        dataOut32   => s_OutI32,
                        dataOut33   => s_OutI33,
                        dataOut34   => s_OutI34,
                        dataOut35   => s_OutI35,
                        dataOut36   => s_OutI36,
                        dataOut37   => s_OutI37,
                        dataOut38   => s_OutI38,
                        dataOut39   => s_OutI39,
                        dataOut40   => s_OutI40,
                        dataOut41   => s_OutI41,
                        dataOut42   => s_OutI42,
                        dataOut43   => s_OutI43,
                        dataOut44   => s_OutI44,
                        dataOut45   => s_OutI45,
                        dataOut46   => s_OutI46,
                        dataOut47   => s_OutI47,
                        dataOut48   => s_OutI48,
                        dataOut49   => s_OutI49,
                        dataOut50   => s_OutI50,
                        dataOut51   => s_OutI51,
                        dataOut52   => s_OutI52,
                        dataOut53   => s_OutI53,
                        dataOut54   => s_OutI54,
                        dataOut55   => s_OutI55,
                        dataOut56   => s_OutI56,
                        dataOut57   => s_OutI57,
                        dataOut58   => s_OutI58,
                        dataOut59   => s_OutI59,
                        dataOut60   => s_OutI60,
                        dataOut61   => s_OutI61,
                        dataOut62   => s_OutI62,
                        dataOut63   => s_OutI63,
                        validOut    => s_DCT64ValOut
                    );

    InOutMux:   process(s_clk, s_en, s_res, sel)
                begin
                    if (rising_edge(s_clk)) then
                        if (s_res = '1') then
                            -- DCT4
                            s_DCT4In0           <= 0;
                            s_DCT4In1           <= 0;
                            s_DCT4In2           <= 0;
                            s_DCT4In3           <= 0;
                            s_DCT4En            <= '0';
                            -- DCT8 Stage 1
                            s_DCT8Stg1In0       <= 0;
                            s_DCT8Stg1In1       <= 0;
                            s_DCT8Stg1In2       <= 0;
                            s_DCT8Stg1In3       <= 0;
                            s_DCT8Stg1In4       <= 0;
                            s_DCT8Stg1In5       <= 0;
                            s_DCT8Stg1In6       <= 0;
                            s_DCT8Stg1In7       <= 0;
                            s_DCT8Stg1En        <= '0';
                            -- DCT16 Stage 1
                            s_DCT16Stg1In0      <= 0;
                            s_DCT16Stg1In1      <= 0;
                            s_DCT16Stg1In2      <= 0;
                            s_DCT16Stg1In3      <= 0;
                            s_DCT16Stg1In4      <= 0;
                            s_DCT16Stg1In5      <= 0;
                            s_DCT16Stg1In6      <= 0;
                            s_DCT16Stg1In7      <= 0;
                            s_DCT16Stg1In8      <= 0;
                            s_DCT16Stg1In9      <= 0;
                            s_DCT16Stg1In10     <= 0;
                            s_DCT16Stg1In11     <= 0;
                            s_DCT16Stg1In12     <= 0;
                            s_DCT16Stg1In13     <= 0;
                            s_DCT16Stg1In14     <= 0;
                            s_DCT16Stg1In15     <= 0;
                            s_DCT16Stg1En       <= '0';
                            -- DCT32 Stage 1
                            s_DCT32Stg1In0      <= 0;
                            s_DCT32Stg1In1      <= 0;
                            s_DCT32Stg1In2      <= 0;
                            s_DCT32Stg1In3      <= 0;
                            s_DCT32Stg1In4      <= 0;
                            s_DCT32Stg1In5      <= 0;
                            s_DCT32Stg1In6      <= 0;
                            s_DCT32Stg1In7      <= 0;
                            s_DCT32Stg1In8      <= 0;
                            s_DCT32Stg1In9      <= 0;
                            s_DCT32Stg1In10     <= 0;
                            s_DCT32Stg1In11     <= 0;
                            s_DCT32Stg1In12     <= 0;
                            s_DCT32Stg1In13     <= 0;
                            s_DCT32Stg1In14     <= 0;
                            s_DCT32Stg1In15     <= 0;
                            s_DCT32Stg1In16     <= 0;
                            s_DCT32Stg1In17     <= 0;
                            s_DCT32Stg1In18     <= 0;
                            s_DCT32Stg1In19     <= 0;
                            s_DCT32Stg1In20     <= 0;
                            s_DCT32Stg1In21     <= 0;
                            s_DCT32Stg1In22     <= 0;
                            s_DCT32Stg1In23     <= 0;
                            s_DCT32Stg1In24     <= 0;
                            s_DCT32Stg1In25     <= 0;
                            s_DCT32Stg1In26     <= 0;
                            s_DCT32Stg1In27     <= 0;
                            s_DCT32Stg1In28     <= 0;
                            s_DCT32Stg1In29     <= 0;
                            s_DCT32Stg1In30     <= 0;
                            s_DCT32Stg1In31     <= 0;
                            s_DCT32Stg1En       <= '0';
                            -- DCT64 Stage 1
                            s_DCT64Stg1In0      <= 0;
                            s_DCT64Stg1In1      <= 0;
                            s_DCT64Stg1In2      <= 0;
                            s_DCT64Stg1In3      <= 0;
                            s_DCT64Stg1In4      <= 0;
                            s_DCT64Stg1In5      <= 0;
                            s_DCT64Stg1In6      <= 0;
                            s_DCT64Stg1In7      <= 0;
                            s_DCT64Stg1In8      <= 0;
                            s_DCT64Stg1In9      <= 0;
                            s_DCT64Stg1In10     <= 0;
                            s_DCT64Stg1In11     <= 0;
                            s_DCT64Stg1In12     <= 0;
                            s_DCT64Stg1In13     <= 0;
                            s_DCT64Stg1In14     <= 0;
                            s_DCT64Stg1In15     <= 0;
                            s_DCT64Stg1In16     <= 0;
                            s_DCT64Stg1In17     <= 0;
                            s_DCT64Stg1In18     <= 0;
                            s_DCT64Stg1In19     <= 0;
                            s_DCT64Stg1In20     <= 0;
                            s_DCT64Stg1In21     <= 0;
                            s_DCT64Stg1In22     <= 0;
                            s_DCT64Stg1In23     <= 0;
                            s_DCT64Stg1In24     <= 0;
                            s_DCT64Stg1In25     <= 0;
                            s_DCT64Stg1In26     <= 0;
                            s_DCT64Stg1In27     <= 0;
                            s_DCT64Stg1In28     <= 0;
                            s_DCT64Stg1In29     <= 0;
                            s_DCT64Stg1In30     <= 0;
                            s_DCT64Stg1In31     <= 0;
                            s_DCT64Stg1In32     <= 0;
                            s_DCT64Stg1In33     <= 0;
                            s_DCT64Stg1In34     <= 0;
                            s_DCT64Stg1In35     <= 0;
                            s_DCT64Stg1In36     <= 0;
                            s_DCT64Stg1In37     <= 0;
                            s_DCT64Stg1In38     <= 0;
                            s_DCT64Stg1In39     <= 0;
                            s_DCT64Stg1In40     <= 0;
                            s_DCT64Stg1In41     <= 0;
                            s_DCT64Stg1In42     <= 0;
                            s_DCT64Stg1In43     <= 0;
                            s_DCT64Stg1In44     <= 0;
                            s_DCT64Stg1In45     <= 0;
                            s_DCT64Stg1In46     <= 0;
                            s_DCT64Stg1In47     <= 0;
                            s_DCT64Stg1In48     <= 0;
                            s_DCT64Stg1In49     <= 0;
                            s_DCT64Stg1In50     <= 0;
                            s_DCT64Stg1In51     <= 0;
                            s_DCT64Stg1In52     <= 0;
                            s_DCT64Stg1In53     <= 0;
                            s_DCT64Stg1In54     <= 0;
                            s_DCT64Stg1In55     <= 0;
                            s_DCT64Stg1In56     <= 0;
                            s_DCT64Stg1In57     <= 0;
                            s_DCT64Stg1In58     <= 0;
                            s_DCT64Stg1In59     <= 0;
                            s_DCT64Stg1In60     <= 0;
                            s_DCT64Stg1In61     <= 0;
                            s_DCT64Stg1In62     <= 0;
                            s_DCT64Stg1In63     <= 0;
                            s_DCT64Stg1En       <= '0';
                            -- Data Outputs
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
                            s_DCT4En            <= '0';
                            s_DCT8Stg1En        <= '0';
                            s_DCT16Stg1En       <= '0';
                            s_DCT32Stg1En       <= '0';
                            s_DCT64Stg1En       <= '0';

                            dataOut0            <= (others => '-');
                            dataOut1            <= (others => '-');
                            dataOut2            <= (others => '-');
                            dataOut3            <= (others => '-');
                            dataOut4            <= (others => '-');
                            dataOut5            <= (others => '-');
                            dataOut6            <= (others => '-');
                            dataOut7            <= (others => '-');
                            dataOut8            <= (others => '-');
                            dataOut9            <= (others => '-');
                            dataOut10           <= (others => '-');
                            dataOut11           <= (others => '-');
                            dataOut12           <= (others => '-');
                            dataOut13           <= (others => '-');
                            dataOut14           <= (others => '-');
                            dataOut15           <= (others => '-');
                            dataOut16           <= (others => '-');
                            dataOut17           <= (others => '-');
                            dataOut18           <= (others => '-');
                            dataOut19           <= (others => '-');
                            dataOut20           <= (others => '-');
                            dataOut21           <= (others => '-');
                            dataOut22           <= (others => '-');
                            dataOut23           <= (others => '-');
                            dataOut24           <= (others => '-');
                            dataOut25           <= (others => '-');
                            dataOut26           <= (others => '-');
                            dataOut27           <= (others => '-');
                            dataOut28           <= (others => '-');
                            dataOut29           <= (others => '-');
                            dataOut30           <= (others => '-');
                            dataOut31           <= (others => '-');
                            dataOut32           <= (others => '-');
                            dataOut33           <= (others => '-');
                            dataOut34           <= (others => '-');
                            dataOut35           <= (others => '-');
                            dataOut36           <= (others => '-');
                            dataOut37           <= (others => '-');
                            dataOut38           <= (others => '-');
                            dataOut39           <= (others => '-');
                            dataOut40           <= (others => '-');
                            dataOut41           <= (others => '-');
                            dataOut42           <= (others => '-');
                            dataOut43           <= (others => '-');
                            dataOut44           <= (others => '-');
                            dataOut45           <= (others => '-');
                            dataOut46           <= (others => '-');
                            dataOut47           <= (others => '-');
                            dataOut48           <= (others => '-');
                            dataOut49           <= (others => '-');
                            dataOut50           <= (others => '-');
                            dataOut51           <= (others => '-');
                            dataOut52           <= (others => '-');
                            dataOut53           <= (others => '-');
                            dataOut54           <= (others => '-');
                            dataOut55           <= (others => '-');
                            dataOut56           <= (others => '-');
                            dataOut57           <= (others => '-');
                            dataOut58           <= (others => '-');
                            dataOut59           <= (others => '-');
                            dataOut60           <= (others => '-');
                            dataOut61           <= (others => '-');
                            dataOut62           <= (others => '-');
                            dataOut63           <= (others => '-');
                            validOut            <= '0';
                            case( sel ) is
                                when "000" =>       -- DCT4
                                    s_DCT4En        <= '1';

                                    s_DCT4In0       <= to_integer(signed(dataIn0));
                                    s_DCT4In1       <= to_integer(signed(dataIn1));
                                    s_DCT4In2       <= to_integer(signed(dataIn2));
                                    s_DCT4In3       <= to_integer(signed(dataIn3));
                                    dataOut0        <= std_logic_vector(to_signed(s_OutI0,K));
                                    dataOut1        <= std_logic_vector(to_signed(s_OutI2,K));
                                    dataOut2        <= std_logic_vector(to_signed(s_OutI1,K));
                                    dataOut3        <= std_logic_vector(to_signed(s_OutI3,K));
                                    validOut        <= s_DCT4ValOut;

                                when "001" =>       -- DCT8
                                    s_DCT8Stg1En    <= '1';
                                    s_DCT4En        <= s_DCT8Stg1ValOut;

                                    s_DCT8Stg1In0     <= to_integer(signed(dataIn0));
                                    s_DCT8Stg1In1     <= to_integer(signed(dataIn1));
                                    s_DCT8Stg1In2     <= to_integer(signed(dataIn2));
                                    s_DCT8Stg1In3     <= to_integer(signed(dataIn3));
                                    s_DCT8Stg1In4     <= to_integer(signed(dataIn4));
                                    s_DCT8Stg1In5     <= to_integer(signed(dataIn5));
                                    s_DCT8Stg1In6     <= to_integer(signed(dataIn6));
                                    s_DCT8Stg1In7     <= to_integer(signed(dataIn7));

                                    s_DCT4In0       <= s_DCT8Stg1Out0;
                                    s_DCT4In1       <= s_DCT8Stg1Out1;
                                    s_DCT4In2       <= s_DCT8Stg1Out2;
                                    s_DCT4In3       <= s_DCT8Stg1Out3;

                                    dataOut0        <= std_logic_vector(to_signed(s_OutI0,K));
                                    dataOut1        <= std_logic_vector(to_signed(s_OutI4,K));
                                    dataOut2        <= std_logic_vector(to_signed(s_OutI2,K));
                                    dataOut3        <= std_logic_vector(to_signed(s_OutI6,K));
                                    dataOut4        <= std_logic_vector(to_signed(s_OutI1,K));
                                    dataOut5        <= std_logic_vector(to_signed(s_OutI5,K));
                                    dataOut6        <= std_logic_vector(to_signed(s_OutI3,K));
                                    dataOut7        <= std_logic_vector(to_signed(s_OutI7,K));
                                    validOut        <= s_DCT8ValOut and s_DCT4ValOut;

                                when "010" =>       -- DCT16
                                    s_DCT16Stg1En    <= '1';
                                    s_DCT8Stg1En    <= s_DCT16Stg1ValOut;
                                    s_DCT4En        <= s_DCT8Stg1ValOut;

                                    s_DCT16Stg1In0  <= to_integer(signed(dataIn0));
                                    s_DCT16Stg1In1  <= to_integer(signed(dataIn1));
                                    s_DCT16Stg1In2  <= to_integer(signed(dataIn2));
                                    s_DCT16Stg1In3  <= to_integer(signed(dataIn3));
                                    s_DCT16Stg1In4  <= to_integer(signed(dataIn4));
                                    s_DCT16Stg1In5  <= to_integer(signed(dataIn5));
                                    s_DCT16Stg1In6  <= to_integer(signed(dataIn6));
                                    s_DCT16Stg1In7  <= to_integer(signed(dataIn7));
                                    s_DCT16Stg1In8  <= to_integer(signed(dataIn8));
                                    s_DCT16Stg1In9  <= to_integer(signed(dataIn9));
                                    s_DCT16Stg1In10 <= to_integer(signed(dataIn10));
                                    s_DCT16Stg1In11 <= to_integer(signed(dataIn11));
                                    s_DCT16Stg1In12 <= to_integer(signed(dataIn12));
                                    s_DCT16Stg1In13 <= to_integer(signed(dataIn13));
                                    s_DCT16Stg1In14 <= to_integer(signed(dataIn14));
                                    s_DCT16Stg1In15 <= to_integer(signed(dataIn15));

                                    s_DCT8Stg1In0   <= s_DCT16Stg1Out0;
                                    s_DCT8Stg1In1   <= s_DCT16Stg1Out1;
                                    s_DCT8Stg1In2   <= s_DCT16Stg1Out2;
                                    s_DCT8Stg1In3   <= s_DCT16Stg1Out3;
                                    s_DCT8Stg1In4   <= s_DCT16Stg1Out4;
                                    s_DCT8Stg1In5   <= s_DCT16Stg1Out5;
                                    s_DCT8Stg1In6   <= s_DCT16Stg1Out6;
                                    s_DCT8Stg1In7   <= s_DCT16Stg1Out7;

                                    s_DCT4In0       <= s_DCT8Stg1Out0;
                                    s_DCT4In1       <= s_DCT8Stg1Out1;
                                    s_DCT4In2       <= s_DCT8Stg1Out2;
                                    s_DCT4In3       <= s_DCT8Stg1Out3;

                                    dataOut0        <= std_logic_vector(to_signed(s_OutI0,K));
                                    dataOut1        <= std_logic_vector(to_signed(s_OutI8,K));
                                    dataOut2        <= std_logic_vector(to_signed(s_OutI4,K));
                                    dataOut3        <= std_logic_vector(to_signed(s_OutI12,K));
                                    dataOut4        <= std_logic_vector(to_signed(s_OutI2,K));
                                    dataOut5        <= std_logic_vector(to_signed(s_OutI10,K));
                                    dataOut6        <= std_logic_vector(to_signed(s_OutI6,K));
                                    dataOut7        <= std_logic_vector(to_signed(s_OutI14,K));
                                    dataOut8        <= std_logic_vector(to_signed(s_OutI1,K));
                                    dataOut9        <= std_logic_vector(to_signed(s_OutI9,K));
                                    dataOut10       <= std_logic_vector(to_signed(s_OutI5,K));
                                    dataOut11       <= std_logic_vector(to_signed(s_OutI13,K));
                                    dataOut12       <= std_logic_vector(to_signed(s_OutI3,K));
                                    dataOut13       <= std_logic_vector(to_signed(s_OutI11,K));
                                    dataOut14       <= std_logic_vector(to_signed(s_OutI7,K));
                                    dataOut15       <= std_logic_vector(to_signed(s_OutI15,K));
                                    validOut        <= s_DCT16ValOut and s_DCT8ValOut and s_DCT4ValOut;

                                when "011" =>       -- DCT32
                                    s_DCT32Stg1En   <= '1';
                                    s_DCT16Stg1En   <= s_DCT32Stg1ValOut;
                                    s_DCT8Stg1En    <= s_DCT16Stg1ValOut;
                                    s_DCT4En        <= s_DCT8Stg1ValOut;

                                    s_DCT32Stg1In0  <= to_integer(signed(dataIn0));   
                                    s_DCT32Stg1In1  <= to_integer(signed(dataIn1));   
                                    s_DCT32Stg1In2  <= to_integer(signed(dataIn2));   
                                    s_DCT32Stg1In3  <= to_integer(signed(dataIn3));   
                                    s_DCT32Stg1In4  <= to_integer(signed(dataIn4));   
                                    s_DCT32Stg1In5  <= to_integer(signed(dataIn5));   
                                    s_DCT32Stg1In6  <= to_integer(signed(dataIn6));   
                                    s_DCT32Stg1In7  <= to_integer(signed(dataIn7));   
                                    s_DCT32Stg1In8  <= to_integer(signed(dataIn8));   
                                    s_DCT32Stg1In9  <= to_integer(signed(dataIn9));   
                                    s_DCT32Stg1In10 <= to_integer(signed(dataIn10));      
                                    s_DCT32Stg1In11 <= to_integer(signed(dataIn11));      
                                    s_DCT32Stg1In12 <= to_integer(signed(dataIn12));      
                                    s_DCT32Stg1In13 <= to_integer(signed(dataIn13));      
                                    s_DCT32Stg1In14 <= to_integer(signed(dataIn14));      
                                    s_DCT32Stg1In15 <= to_integer(signed(dataIn15));      
                                    s_DCT32Stg1In16 <= to_integer(signed(dataIn16));      
                                    s_DCT32Stg1In17 <= to_integer(signed(dataIn17));      
                                    s_DCT32Stg1In18 <= to_integer(signed(dataIn18));      
                                    s_DCT32Stg1In19 <= to_integer(signed(dataIn19));      
                                    s_DCT32Stg1In20 <= to_integer(signed(dataIn20));      
                                    s_DCT32Stg1In21 <= to_integer(signed(dataIn21));      
                                    s_DCT32Stg1In22 <= to_integer(signed(dataIn22));      
                                    s_DCT32Stg1In23 <= to_integer(signed(dataIn23));      
                                    s_DCT32Stg1In24 <= to_integer(signed(dataIn24));      
                                    s_DCT32Stg1In25 <= to_integer(signed(dataIn25));      
                                    s_DCT32Stg1In26 <= to_integer(signed(dataIn26));      
                                    s_DCT32Stg1In27 <= to_integer(signed(dataIn27));      
                                    s_DCT32Stg1In28 <= to_integer(signed(dataIn28));      
                                    s_DCT32Stg1In29 <= to_integer(signed(dataIn29));      
                                    s_DCT32Stg1In30 <= to_integer(signed(dataIn30));      
                                    s_DCT32Stg1In31 <= to_integer(signed(dataIn31)); 
                                    
                                    s_DCT16Stg1In0  <= s_DCT32Stg1Out0;
                                    s_DCT16Stg1In1  <= s_DCT32Stg1Out1;
                                    s_DCT16Stg1In2  <= s_DCT32Stg1Out2;
                                    s_DCT16Stg1In3  <= s_DCT32Stg1Out3;
                                    s_DCT16Stg1In4  <= s_DCT32Stg1Out4;
                                    s_DCT16Stg1In5  <= s_DCT32Stg1Out5;
                                    s_DCT16Stg1In6  <= s_DCT32Stg1Out6;
                                    s_DCT16Stg1In7  <= s_DCT32Stg1Out7;
                                    s_DCT16Stg1In8  <= s_DCT32Stg1Out8;
                                    s_DCT16Stg1In9  <= s_DCT32Stg1Out9;
                                    s_DCT16Stg1In10 <= s_DCT32Stg1Out10;
                                    s_DCT16Stg1In11 <= s_DCT32Stg1Out11;
                                    s_DCT16Stg1In12 <= s_DCT32Stg1Out12;
                                    s_DCT16Stg1In13 <= s_DCT32Stg1Out13;
                                    s_DCT16Stg1In14 <= s_DCT32Stg1Out14;
                                    s_DCT16Stg1In15 <= s_DCT32Stg1Out15;

                                    s_DCT8Stg1In0   <= s_DCT16Stg1Out0;
                                    s_DCT8Stg1In1   <= s_DCT16Stg1Out1;
                                    s_DCT8Stg1In2   <= s_DCT16Stg1Out2;
                                    s_DCT8Stg1In3   <= s_DCT16Stg1Out3;
                                    s_DCT8Stg1In4   <= s_DCT16Stg1Out4;
                                    s_DCT8Stg1In5   <= s_DCT16Stg1Out5;
                                    s_DCT8Stg1In6   <= s_DCT16Stg1Out6;
                                    s_DCT8Stg1In7   <= s_DCT16Stg1Out7;

                                    s_DCT4In0       <= s_DCT8Stg1Out0;
                                    s_DCT4In1       <= s_DCT8Stg1Out1;
                                    s_DCT4In2       <= s_DCT8Stg1Out2;
                                    s_DCT4In3       <= s_DCT8Stg1Out3;

                                    dataOut0        <= std_logic_vector(to_signed(s_OutI0,K));
                                    dataOut1        <= std_logic_vector(to_signed(s_OutI16,K));
                                    dataOut2        <= std_logic_vector(to_signed(s_OutI8,K));
                                    dataOut3        <= std_logic_vector(to_signed(s_OutI24,K));
                                    dataOut4        <= std_logic_vector(to_signed(s_OutI4,K));
                                    dataOut5        <= std_logic_vector(to_signed(s_OutI20,K));
                                    dataOut6        <= std_logic_vector(to_signed(s_OutI12,K));
                                    dataOut7        <= std_logic_vector(to_signed(s_OutI28,K));
                                    dataOut8        <= std_logic_vector(to_signed(s_OutI2,K));
                                    dataOut9        <= std_logic_vector(to_signed(s_OutI18,K));
                                    dataOut10       <= std_logic_vector(to_signed(s_OutI10,K));
                                    dataOut11       <= std_logic_vector(to_signed(s_OutI26,K));
                                    dataOut12       <= std_logic_vector(to_signed(s_OutI6,K));
                                    dataOut13       <= std_logic_vector(to_signed(s_OutI22,K));
                                    dataOut14       <= std_logic_vector(to_signed(s_OutI14,K));
                                    dataOut15       <= std_logic_vector(to_signed(s_OutI30,K));
                                    dataOut16       <= std_logic_vector(to_signed(s_OutI1,K));
                                    dataOut17       <= std_logic_vector(to_signed(s_OutI17,K));
                                    dataOut18       <= std_logic_vector(to_signed(s_OutI9,K));
                                    dataOut19       <= std_logic_vector(to_signed(s_OutI25,K));
                                    dataOut20       <= std_logic_vector(to_signed(s_OutI5,K));
                                    dataOut21       <= std_logic_vector(to_signed(s_OutI21,K));
                                    dataOut22       <= std_logic_vector(to_signed(s_OutI13,K));
                                    dataOut23       <= std_logic_vector(to_signed(s_OutI29,K));
                                    dataOut24       <= std_logic_vector(to_signed(s_OutI3,K));
                                    dataOut25       <= std_logic_vector(to_signed(s_OutI19,K));
                                    dataOut26       <= std_logic_vector(to_signed(s_OutI11,K));
                                    dataOut27       <= std_logic_vector(to_signed(s_OutI27,K));
                                    dataOut28       <= std_logic_vector(to_signed(s_OutI7,K));
                                    dataOut29       <= std_logic_vector(to_signed(s_OutI23,K));
                                    dataOut30       <= std_logic_vector(to_signed(s_OutI15,K));
                                    dataOut31       <= std_logic_vector(to_signed(s_OutI31,K));
                                    validOut        <= s_DCT32ValOut and s_DCT16ValOut and s_DCT8ValOut and s_DCT4ValOut;

                                when "100" =>       -- DCT64
                                    s_DCT64Stg1En   <= '1';
                                    s_DCT32Stg1En   <= s_DCT64Stg1ValOut;
                                    s_DCT16Stg1En   <= s_DCT32Stg1ValOut;
                                    s_DCT8Stg1En    <= s_DCT16Stg1ValOut;
                                    s_DCT4En        <= s_DCT8Stg1ValOut;

                                    s_DCT64Stg1In0     <= to_integer(signed(dataIn0));
                                    s_DCT64Stg1In1     <= to_integer(signed(dataIn1));
                                    s_DCT64Stg1In2     <= to_integer(signed(dataIn2));
                                    s_DCT64Stg1In3     <= to_integer(signed(dataIn3));
                                    s_DCT64Stg1In4     <= to_integer(signed(dataIn4));
                                    s_DCT64Stg1In5     <= to_integer(signed(dataIn5));
                                    s_DCT64Stg1In6     <= to_integer(signed(dataIn6));
                                    s_DCT64Stg1In7     <= to_integer(signed(dataIn7));
                                    s_DCT64Stg1In8     <= to_integer(signed(dataIn8));
                                    s_DCT64Stg1In9     <= to_integer(signed(dataIn9));
                                    s_DCT64Stg1In10    <= to_integer(signed(dataIn10));
                                    s_DCT64Stg1In11    <= to_integer(signed(dataIn11));
                                    s_DCT64Stg1In12    <= to_integer(signed(dataIn12));
                                    s_DCT64Stg1In13    <= to_integer(signed(dataIn13));
                                    s_DCT64Stg1In14    <= to_integer(signed(dataIn14));
                                    s_DCT64Stg1In15    <= to_integer(signed(dataIn15));
                                    s_DCT64Stg1In16    <= to_integer(signed(dataIn16));
                                    s_DCT64Stg1In17    <= to_integer(signed(dataIn17));
                                    s_DCT64Stg1In18    <= to_integer(signed(dataIn18));
                                    s_DCT64Stg1In19    <= to_integer(signed(dataIn19));
                                    s_DCT64Stg1In20    <= to_integer(signed(dataIn20));
                                    s_DCT64Stg1In21    <= to_integer(signed(dataIn21));
                                    s_DCT64Stg1In22    <= to_integer(signed(dataIn22));
                                    s_DCT64Stg1In23    <= to_integer(signed(dataIn23));
                                    s_DCT64Stg1In24    <= to_integer(signed(dataIn24));
                                    s_DCT64Stg1In25    <= to_integer(signed(dataIn25));
                                    s_DCT64Stg1In26    <= to_integer(signed(dataIn26));
                                    s_DCT64Stg1In27    <= to_integer(signed(dataIn27));
                                    s_DCT64Stg1In28    <= to_integer(signed(dataIn28));
                                    s_DCT64Stg1In29    <= to_integer(signed(dataIn29));
                                    s_DCT64Stg1In30    <= to_integer(signed(dataIn30));
                                    s_DCT64Stg1In31    <= to_integer(signed(dataIn31));
                                    s_DCT64Stg1In32    <= to_integer(signed(dataIn32));
                                    s_DCT64Stg1In33    <= to_integer(signed(dataIn33));
                                    s_DCT64Stg1In34    <= to_integer(signed(dataIn34));
                                    s_DCT64Stg1In35    <= to_integer(signed(dataIn35));
                                    s_DCT64Stg1In36    <= to_integer(signed(dataIn36));
                                    s_DCT64Stg1In37    <= to_integer(signed(dataIn37));
                                    s_DCT64Stg1In38    <= to_integer(signed(dataIn38));
                                    s_DCT64Stg1In39    <= to_integer(signed(dataIn39));
                                    s_DCT64Stg1In40    <= to_integer(signed(dataIn40));
                                    s_DCT64Stg1In41    <= to_integer(signed(dataIn41));
                                    s_DCT64Stg1In42    <= to_integer(signed(dataIn42));
                                    s_DCT64Stg1In43    <= to_integer(signed(dataIn43));
                                    s_DCT64Stg1In44    <= to_integer(signed(dataIn44));
                                    s_DCT64Stg1In45    <= to_integer(signed(dataIn45));
                                    s_DCT64Stg1In46    <= to_integer(signed(dataIn46));
                                    s_DCT64Stg1In47    <= to_integer(signed(dataIn47));
                                    s_DCT64Stg1In48    <= to_integer(signed(dataIn48));
                                    s_DCT64Stg1In49    <= to_integer(signed(dataIn49));
                                    s_DCT64Stg1In50    <= to_integer(signed(dataIn50));
                                    s_DCT64Stg1In51    <= to_integer(signed(dataIn51));
                                    s_DCT64Stg1In52    <= to_integer(signed(dataIn52));
                                    s_DCT64Stg1In53    <= to_integer(signed(dataIn53));
                                    s_DCT64Stg1In54    <= to_integer(signed(dataIn54));
                                    s_DCT64Stg1In55    <= to_integer(signed(dataIn55));
                                    s_DCT64Stg1In56    <= to_integer(signed(dataIn56));
                                    s_DCT64Stg1In57    <= to_integer(signed(dataIn57));
                                    s_DCT64Stg1In58    <= to_integer(signed(dataIn58));
                                    s_DCT64Stg1In59    <= to_integer(signed(dataIn59));
                                    s_DCT64Stg1In60    <= to_integer(signed(dataIn60));
                                    s_DCT64Stg1In61    <= to_integer(signed(dataIn61));
                                    s_DCT64Stg1In62    <= to_integer(signed(dataIn62));
                                    s_DCT64Stg1In63    <= to_integer(signed(dataIn63));

                                    s_DCT32Stg1In0  <= s_DCT64Stg1Out0;   
                                    s_DCT32Stg1In1  <= s_DCT64Stg1Out1;   
                                    s_DCT32Stg1In2  <= s_DCT64Stg1Out2;   
                                    s_DCT32Stg1In3  <= s_DCT64Stg1Out3;   
                                    s_DCT32Stg1In4  <= s_DCT64Stg1Out4;   
                                    s_DCT32Stg1In5  <= s_DCT64Stg1Out5;   
                                    s_DCT32Stg1In6  <= s_DCT64Stg1Out6;   
                                    s_DCT32Stg1In7  <= s_DCT64Stg1Out7;   
                                    s_DCT32Stg1In8  <= s_DCT64Stg1Out8;   
                                    s_DCT32Stg1In9  <= s_DCT64Stg1Out9;   
                                    s_DCT32Stg1In10 <= s_DCT64Stg1Out10;      
                                    s_DCT32Stg1In11 <= s_DCT64Stg1Out11;      
                                    s_DCT32Stg1In12 <= s_DCT64Stg1Out12;      
                                    s_DCT32Stg1In13 <= s_DCT64Stg1Out13;      
                                    s_DCT32Stg1In14 <= s_DCT64Stg1Out14;      
                                    s_DCT32Stg1In15 <= s_DCT64Stg1Out15;      
                                    s_DCT32Stg1In16 <= s_DCT64Stg1Out16;      
                                    s_DCT32Stg1In17 <= s_DCT64Stg1Out17;      
                                    s_DCT32Stg1In18 <= s_DCT64Stg1Out18;      
                                    s_DCT32Stg1In19 <= s_DCT64Stg1Out19;      
                                    s_DCT32Stg1In20 <= s_DCT64Stg1Out20;      
                                    s_DCT32Stg1In21 <= s_DCT64Stg1Out21;      
                                    s_DCT32Stg1In22 <= s_DCT64Stg1Out22;      
                                    s_DCT32Stg1In23 <= s_DCT64Stg1Out23;      
                                    s_DCT32Stg1In24 <= s_DCT64Stg1Out24;      
                                    s_DCT32Stg1In25 <= s_DCT64Stg1Out25;      
                                    s_DCT32Stg1In26 <= s_DCT64Stg1Out26;      
                                    s_DCT32Stg1In27 <= s_DCT64Stg1Out27;      
                                    s_DCT32Stg1In28 <= s_DCT64Stg1Out28;      
                                    s_DCT32Stg1In29 <= s_DCT64Stg1Out29;      
                                    s_DCT32Stg1In30 <= s_DCT64Stg1Out30;      
                                    s_DCT32Stg1In31 <= s_DCT64Stg1Out31; 

                                    s_DCT16Stg1In0  <= s_DCT32Stg1Out0;
                                    s_DCT16Stg1In1  <= s_DCT32Stg1Out1;
                                    s_DCT16Stg1In2  <= s_DCT32Stg1Out2;
                                    s_DCT16Stg1In3  <= s_DCT32Stg1Out3;
                                    s_DCT16Stg1In4  <= s_DCT32Stg1Out4;
                                    s_DCT16Stg1In5  <= s_DCT32Stg1Out5;
                                    s_DCT16Stg1In6  <= s_DCT32Stg1Out6;
                                    s_DCT16Stg1In7  <= s_DCT32Stg1Out7;
                                    s_DCT16Stg1In8  <= s_DCT32Stg1Out8;
                                    s_DCT16Stg1In9  <= s_DCT32Stg1Out9;
                                    s_DCT16Stg1In10 <= s_DCT32Stg1Out10;
                                    s_DCT16Stg1In11 <= s_DCT32Stg1Out11;
                                    s_DCT16Stg1In12 <= s_DCT32Stg1Out12;
                                    s_DCT16Stg1In13 <= s_DCT32Stg1Out13;
                                    s_DCT16Stg1In14 <= s_DCT32Stg1Out14;
                                    s_DCT16Stg1In15 <= s_DCT32Stg1Out15;

                                    s_DCT8Stg1In0   <= s_DCT16Stg1Out0;
                                    s_DCT8Stg1In1   <= s_DCT16Stg1Out1;
                                    s_DCT8Stg1In2   <= s_DCT16Stg1Out2;
                                    s_DCT8Stg1In3   <= s_DCT16Stg1Out3;
                                    s_DCT8Stg1In4   <= s_DCT16Stg1Out4;
                                    s_DCT8Stg1In5   <= s_DCT16Stg1Out5;
                                    s_DCT8Stg1In6   <= s_DCT16Stg1Out6;
                                    s_DCT8Stg1In7   <= s_DCT16Stg1Out7;

                                    s_DCT4In0       <= s_DCT8Stg1Out0;
                                    s_DCT4In1       <= s_DCT8Stg1Out1;
                                    s_DCT4In2       <= s_DCT8Stg1Out2;
                                    s_DCT4In3       <= s_DCT8Stg1Out3;

                                    dataOut0           <= std_logic_vector(to_signed(s_OutI0,K));
                                    dataOut1           <= std_logic_vector(to_signed(s_OutI32,K));
                                    dataOut2           <= std_logic_vector(to_signed(s_OutI16,K));
                                    dataOut3           <= std_logic_vector(to_signed(s_OutI48,K));
                                    dataOut4           <= std_logic_vector(to_signed(s_OutI8,K));
                                    dataOut5           <= std_logic_vector(to_signed(s_OutI40,K));
                                    dataOut6           <= std_logic_vector(to_signed(s_OutI24,K));
                                    dataOut7           <= std_logic_vector(to_signed(s_OutI56,K));
                                    dataOut8           <= std_logic_vector(to_signed(s_OutI4,K));
                                    dataOut9           <= std_logic_vector(to_signed(s_OutI36,K));
                                    dataOut10          <= std_logic_vector(to_signed(s_OutI20,K));
                                    dataOut11          <= std_logic_vector(to_signed(s_OutI52,K));
                                    dataOut12          <= std_logic_vector(to_signed(s_OutI12,K));
                                    dataOut13          <= std_logic_vector(to_signed(s_OutI44,K));
                                    dataOut14          <= std_logic_vector(to_signed(s_OutI28,K));
                                    dataOut15          <= std_logic_vector(to_signed(s_OutI60,K));
                                    dataOut16          <= std_logic_vector(to_signed(s_OutI2,K));
                                    dataOut17          <= std_logic_vector(to_signed(s_OutI34,K));
                                    dataOut18          <= std_logic_vector(to_signed(s_OutI18,K));
                                    dataOut19          <= std_logic_vector(to_signed(s_OutI50,K));
                                    dataOut20          <= std_logic_vector(to_signed(s_OutI10,K));
                                    dataOut21          <= std_logic_vector(to_signed(s_OutI42,K));
                                    dataOut22          <= std_logic_vector(to_signed(s_OutI26,K));
                                    dataOut23          <= std_logic_vector(to_signed(s_OutI58,K));
                                    dataOut24          <= std_logic_vector(to_signed(s_OutI6,K));
                                    dataOut25          <= std_logic_vector(to_signed(s_OutI38,K));
                                    dataOut26          <= std_logic_vector(to_signed(s_OutI22,K));
                                    dataOut27          <= std_logic_vector(to_signed(s_OutI54,K));
                                    dataOut28          <= std_logic_vector(to_signed(s_OutI14,K));
                                    dataOut29          <= std_logic_vector(to_signed(s_OutI46,K));
                                    dataOut30          <= std_logic_vector(to_signed(s_OutI30,K));
                                    dataOut31          <= std_logic_vector(to_signed(s_OutI62,K));
                                    dataOut32          <= std_logic_vector(to_signed(s_OutI1,K));
                                    dataOut33          <= std_logic_vector(to_signed(s_OutI33,K));
                                    dataOut34          <= std_logic_vector(to_signed(s_OutI17,K));
                                    dataOut35          <= std_logic_vector(to_signed(s_OutI49,K));
                                    dataOut36          <= std_logic_vector(to_signed(s_OutI9,K));
                                    dataOut37          <= std_logic_vector(to_signed(s_OutI41,K));
                                    dataOut38          <= std_logic_vector(to_signed(s_OutI25,K));
                                    dataOut39          <= std_logic_vector(to_signed(s_OutI57,K));
                                    dataOut40          <= std_logic_vector(to_signed(s_OutI5,K));
                                    dataOut41          <= std_logic_vector(to_signed(s_OutI37,K));
                                    dataOut42          <= std_logic_vector(to_signed(s_OutI21,K));
                                    dataOut43          <= std_logic_vector(to_signed(s_OutI53,K));
                                    dataOut44          <= std_logic_vector(to_signed(s_OutI13,K));
                                    dataOut45          <= std_logic_vector(to_signed(s_OutI45,K));
                                    dataOut46          <= std_logic_vector(to_signed(s_OutI29,K));
                                    dataOut47          <= std_logic_vector(to_signed(s_OutI61,K));
                                    dataOut48          <= std_logic_vector(to_signed(s_OutI3,K));
                                    dataOut49          <= std_logic_vector(to_signed(s_OutI35,K));
                                    dataOut50          <= std_logic_vector(to_signed(s_OutI19,K));
                                    dataOut51          <= std_logic_vector(to_signed(s_OutI51,K));
                                    dataOut52          <= std_logic_vector(to_signed(s_OutI11,K));
                                    dataOut53          <= std_logic_vector(to_signed(s_OutI43,K));
                                    dataOut54          <= std_logic_vector(to_signed(s_OutI27,K));
                                    dataOut55          <= std_logic_vector(to_signed(s_OutI59,K));
                                    dataOut56          <= std_logic_vector(to_signed(s_OutI7,K));
                                    dataOut57          <= std_logic_vector(to_signed(s_OutI39,K));
                                    dataOut58          <= std_logic_vector(to_signed(s_OutI23,K));
                                    dataOut59          <= std_logic_vector(to_signed(s_OutI55,K));
                                    dataOut60          <= std_logic_vector(to_signed(s_OutI15,K));
                                    dataOut61          <= std_logic_vector(to_signed(s_OutI47,K));
                                    dataOut62          <= std_logic_vector(to_signed(s_OutI31,K));
                                    dataOut63          <= std_logic_vector(to_signed(s_OutI63,K));
                                    validOut           <= s_DCT64ValOut and s_DCT32ValOut and s_DCT16ValOut and s_DCT8ValOut and s_DCT4ValOut;

                                when others =>
                                    -- DCT4
                                    s_DCT4In0           <= 0;
                                    s_DCT4In1           <= 0;
                                    s_DCT4In2           <= 0;
                                    s_DCT4In3           <= 0;
                                    s_DCT4En            <= '0';
                                    -- DCT8 Stage 1
                                    s_DCT8Stg1In0       <= 0;
                                    s_DCT8Stg1In1       <= 0;
                                    s_DCT8Stg1In2       <= 0;
                                    s_DCT8Stg1In3       <= 0;
                                    s_DCT8Stg1In4       <= 0;
                                    s_DCT8Stg1In5       <= 0;
                                    s_DCT8Stg1In6       <= 0;
                                    s_DCT8Stg1In7       <= 0;
                                    s_DCT8Stg1En        <= '0';
                                    -- DCT16 Stage 1
                                    s_DCT16Stg1In0      <= 0;
                                    s_DCT16Stg1In1      <= 0;
                                    s_DCT16Stg1In2      <= 0;
                                    s_DCT16Stg1In3      <= 0;
                                    s_DCT16Stg1In4      <= 0;
                                    s_DCT16Stg1In5      <= 0;
                                    s_DCT16Stg1In6      <= 0;
                                    s_DCT16Stg1In7      <= 0;
                                    s_DCT16Stg1In8      <= 0;
                                    s_DCT16Stg1In9      <= 0;
                                    s_DCT16Stg1In10     <= 0;
                                    s_DCT16Stg1In11     <= 0;
                                    s_DCT16Stg1In12     <= 0;
                                    s_DCT16Stg1In13     <= 0;
                                    s_DCT16Stg1In14     <= 0;
                                    s_DCT16Stg1In15     <= 0;
                                    s_DCT16Stg1En       <= '0';
                                    -- DCT32 Stage 1
                                    s_DCT32Stg1In0      <= 0;
                                    s_DCT32Stg1In1      <= 0;
                                    s_DCT32Stg1In2      <= 0;
                                    s_DCT32Stg1In3      <= 0;
                                    s_DCT32Stg1In4      <= 0;
                                    s_DCT32Stg1In5      <= 0;
                                    s_DCT32Stg1In6      <= 0;
                                    s_DCT32Stg1In7      <= 0;
                                    s_DCT32Stg1In8      <= 0;
                                    s_DCT32Stg1In9      <= 0;
                                    s_DCT32Stg1In10     <= 0;
                                    s_DCT32Stg1In11     <= 0;
                                    s_DCT32Stg1In12     <= 0;
                                    s_DCT32Stg1In13     <= 0;
                                    s_DCT32Stg1In14     <= 0;
                                    s_DCT32Stg1In15     <= 0;
                                    s_DCT32Stg1In16     <= 0;
                                    s_DCT32Stg1In17     <= 0;
                                    s_DCT32Stg1In18     <= 0;
                                    s_DCT32Stg1In19     <= 0;
                                    s_DCT32Stg1In20     <= 0;
                                    s_DCT32Stg1In21     <= 0;
                                    s_DCT32Stg1In22     <= 0;
                                    s_DCT32Stg1In23     <= 0;
                                    s_DCT32Stg1In24     <= 0;
                                    s_DCT32Stg1In25     <= 0;
                                    s_DCT32Stg1In26     <= 0;
                                    s_DCT32Stg1In27     <= 0;
                                    s_DCT32Stg1In28     <= 0;
                                    s_DCT32Stg1In29     <= 0;
                                    s_DCT32Stg1In30     <= 0;
                                    s_DCT32Stg1In31     <= 0;
                                    s_DCT32Stg1En       <= '0';
                                    -- DCT64 Stage 1
                                    s_DCT64Stg1In0      <= 0;
                                    s_DCT64Stg1In1      <= 0;
                                    s_DCT64Stg1In2      <= 0;
                                    s_DCT64Stg1In3      <= 0;
                                    s_DCT64Stg1In4      <= 0;
                                    s_DCT64Stg1In5      <= 0;
                                    s_DCT64Stg1In6      <= 0;
                                    s_DCT64Stg1In7      <= 0;
                                    s_DCT64Stg1In8      <= 0;
                                    s_DCT64Stg1In9      <= 0;
                                    s_DCT64Stg1In10     <= 0;
                                    s_DCT64Stg1In11     <= 0;
                                    s_DCT64Stg1In12     <= 0;
                                    s_DCT64Stg1In13     <= 0;
                                    s_DCT64Stg1In14     <= 0;
                                    s_DCT64Stg1In15     <= 0;
                                    s_DCT64Stg1In16     <= 0;
                                    s_DCT64Stg1In17     <= 0;
                                    s_DCT64Stg1In18     <= 0;
                                    s_DCT64Stg1In19     <= 0;
                                    s_DCT64Stg1In20     <= 0;
                                    s_DCT64Stg1In21     <= 0;
                                    s_DCT64Stg1In22     <= 0;
                                    s_DCT64Stg1In23     <= 0;
                                    s_DCT64Stg1In24     <= 0;
                                    s_DCT64Stg1In25     <= 0;
                                    s_DCT64Stg1In26     <= 0;
                                    s_DCT64Stg1In27     <= 0;
                                    s_DCT64Stg1In28     <= 0;
                                    s_DCT64Stg1In29     <= 0;
                                    s_DCT64Stg1In30     <= 0;
                                    s_DCT64Stg1In31     <= 0;
                                    s_DCT64Stg1In32     <= 0;
                                    s_DCT64Stg1In33     <= 0;
                                    s_DCT64Stg1In34     <= 0;
                                    s_DCT64Stg1In35     <= 0;
                                    s_DCT64Stg1In36     <= 0;
                                    s_DCT64Stg1In37     <= 0;
                                    s_DCT64Stg1In38     <= 0;
                                    s_DCT64Stg1In39     <= 0;
                                    s_DCT64Stg1In40     <= 0;
                                    s_DCT64Stg1In41     <= 0;
                                    s_DCT64Stg1In42     <= 0;
                                    s_DCT64Stg1In43     <= 0;
                                    s_DCT64Stg1In44     <= 0;
                                    s_DCT64Stg1In45     <= 0;
                                    s_DCT64Stg1In46     <= 0;
                                    s_DCT64Stg1In47     <= 0;
                                    s_DCT64Stg1In48     <= 0;
                                    s_DCT64Stg1In49     <= 0;
                                    s_DCT64Stg1In50     <= 0;
                                    s_DCT64Stg1In51     <= 0;
                                    s_DCT64Stg1In52     <= 0;
                                    s_DCT64Stg1In53     <= 0;
                                    s_DCT64Stg1In54     <= 0;
                                    s_DCT64Stg1In55     <= 0;
                                    s_DCT64Stg1In56     <= 0;
                                    s_DCT64Stg1In57     <= 0;
                                    s_DCT64Stg1In58     <= 0;
                                    s_DCT64Stg1In59     <= 0;
                                    s_DCT64Stg1In60     <= 0;
                                    s_DCT64Stg1In61     <= 0;
                                    s_DCT64Stg1In62     <= 0;
                                    s_DCT64Stg1In63     <= 0;
                                    s_DCT64Stg1En       <= '0';
                                    -- Data Outputs
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
end Behavioral;