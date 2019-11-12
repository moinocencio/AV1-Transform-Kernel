----------------------------------------------------------------------------------
-- DCT832 Test Bench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DCT64_I_TB is
end DCT64_I_TB;

architecture Behavioral of DCT64_I_TB is
    component DCT64_1_I is
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
    end component;

    component DCT64_2_I is
        port(   -- Data Inputs
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
    end component;
    
    component DCT32_2_I is
        port(   -- Data Inputs
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
    end component;

    component DCT32_1_I is
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
    end component;

    component DCT16_1_I is
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
    end component;

    component DCT16_2_I is
        port(   -- Data Inputs
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
    end component;

    component DCT4_I is
        port(   -- Data Inputs
                dataIn0     : in    integer;
                dataIn1     : in    integer;
                dataIn2     : in    integer;
                dataIn3     : in    integer;
                -- Control Inputs
                res         : in    std_logic;
                en          : in    std_logic;
                clk         : in    std_logic;
                -- Data Outputs
                dataOut0    : out    integer;
                dataOut1    : out    integer;
                dataOut2    : out    integer;
                dataOut3    : out    integer;
                -- Control Outputs
                validOut    : out   std_logic
        );
    end component;

    component DCT8_1_I is
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
    end component;

    component DCT8_2_I is
        port(   -- Data Inputs
                dataIn4     : in    integer;
                dataIn5     : in    integer;
                dataIn6     : in    integer;
                dataIn7     : in    integer;
                -- Control Inputs
                res         : in    std_logic;
                en          : in    std_logic;
                clk         : in    std_logic;
                -- Data Outputs
                dataOut4    : out    integer;
                dataOut5    : out    integer;
                dataOut6    : out    integer;
                dataOut7    : out    integer;
                -- Control Outputs
                validOut    : out   std_logic
        );
    end component;

    
    signal reset_tb, en_tb, clock_tb, valoutstg164_tb, valoutstg132_tb, valoutstg116_tb, valoutstg18_tb, valoutdct4_tb, valoutdct8_tb, valoutdct16_tb, valoutdct32_tb, valoutdct64_tb, valout_tb : std_logic;
    signal dataOutStg1640_tb, dataOutStg1641_tb, dataOutStg1642_tb, dataOutStg1643_tb, dataOutStg1644_tb, dataOutStg1645_tb, dataOutStg1646_tb, dataOutStg1647_tb, dataOutStg1648_tb, dataOutStg1649_tb, dataOutStg16410_tb, dataOutStg16411_tb, dataOutStg16412_tb, dataOutStg16413_tb, dataOutStg16414_tb, dataOutStg16415_tb, dataOutStg16416_tb, dataOutStg16417_tb, dataOutStg16418_tb, dataOutStg16419_tb, dataOutStg16420_tb, dataOutStg16421_tb, dataOutStg16422_tb, dataOutStg16423_tb, dataOutStg16424_tb, dataOutStg16425_tb, dataOutStg16426_tb, dataOutStg16427_tb, dataOutStg16428_tb, dataOutStg16429_tb, dataOutStg16430_tb, dataOutStg16431_tb, dataOutStg16432_tb, dataOutStg16433_tb, dataOutStg16434_tb, dataOutStg16435_tb, dataOutStg16436_tb, dataOutStg16437_tb, dataOutStg16438_tb, dataOutStg16439_tb, dataOutStg16440_tb, dataOutStg16441_tb, dataOutStg16442_tb, dataOutStg16443_tb, dataOutStg16444_tb, dataOutStg16445_tb, dataOutStg16446_tb, dataOutStg16447_tb, dataOutStg16448_tb, dataOutStg16449_tb, dataOutStg16450_tb, dataOutStg16451_tb, dataOutStg16452_tb, dataOutStg16453_tb, dataOutStg16454_tb,dataOutStg16455_tb, dataOutStg16456_tb, dataOutStg16457_tb, dataOutStg16458_tb, dataOutStg16459_tb, dataOutStg16460_tb, dataOutStg16461_tb, dataOutStg16462_tb, dataOutStg16463_tb     :   integer;        
    signal dataOutStg1320_tb, dataOutStg1321_tb, dataOutStg1322_tb, dataOutStg1323_tb, dataOutStg1324_tb, dataOutStg1325_tb, dataOutStg1326_tb, dataOutStg1327_tb, dataOutStg1328_tb, dataOutStg1329_tb, dataOutStg13210_tb, dataOutStg13211_tb, dataOutStg13212_tb, dataOutStg13213_tb, dataOutStg13214_tb, dataOutStg13215_tb, dataOutStg13216_tb, dataOutStg13217_tb, dataOutStg13218_tb, dataOutStg13219_tb, dataOutStg13220_tb, dataOutStg13221_tb, dataOutStg13222_tb, dataOutStg13223_tb, dataOutStg13224_tb, dataOutStg13225_tb, dataOutStg13226_tb, dataOutStg13227_tb, dataOutStg13228_tb, dataOutStg13229_tb, dataOutStg13230_tb, dataOutStg13231_tb     :   integer;
    signal dataOutStg1160_tb, dataOutStg1161_tb, dataOutStg1162_tb, dataOutStg1163_tb, dataOutStg1164_tb, dataOutStg1165_tb, dataOutStg1166_tb, dataOutStg1167_tb, dataOutStg1168_tb, dataOutStg1169_tb, dataOutStg11610_tb, dataOutStg11611_tb, dataOutStg11612_tb, dataOutStg11613_tb, dataOutStg11614_tb, dataOutStg11615_tb     : integer;
    signal dataOutStg180_tb, dataOutStg181_tb, dataOutStg182_tb, dataOutStg183_tb, dataOutStg184_tb, dataOutStg185_tb, dataOutStg186_tb, dataOutStg187_tb   : integer;
    
    signal dataIn0_tb, dataIn1_tb, dataIn2_tb, dataIn3_tb, dataIn4_tb, dataIn5_tb, dataIn6_tb, dataIn7_tb, dataIn8_tb, dataIn9_tb, dataIn10_tb, dataIn11_tb, dataIn12_tb, dataIn13_tb, dataIn14_tb, dataIn15_tb, dataIn16_tb, dataIn17_tb, dataIn18_tb, dataIn19_tb, dataIn20_tb, dataIn21_tb, dataIn22_tb, dataIn23_tb, dataIn24_tb, dataIn25_tb, dataIn26_tb, dataIn27_tb, dataIn28_tb, dataIn29_tb, dataIn30_tb, dataIn31_tb, dataIn32_tb, dataIn33_tb, dataIn34_tb, dataIn35_tb, dataIn36_tb, dataIn37_tb, dataIn38_tb, dataIn39_tb, dataIn40_tb, dataIn41_tb, dataIn42_tb, dataIn43_tb, dataIn44_tb, dataIn45_tb, dataIn46_tb, dataIn47_tb, dataIn48_tb, dataIn49_tb, dataIn50_tb, dataIn51_tb, dataIn52_tb, dataIn53_tb, dataIn54_tb,dataIn55_tb, dataIn56_tb, dataIn57_tb, dataIn58_tb, dataIn59_tb, dataIn60_tb, dataIn61_tb, dataIn62_tb, dataIn63_tb     :   integer;
    signal dataOut0_tb, dataOut1_tb, dataOut2_tb, dataOut3_tb, dataOut4_tb, dataOut5_tb, dataOut6_tb, dataOut7_tb, dataOut8_tb, dataOut9_tb, dataOut10_tb, dataOut11_tb, dataOut12_tb, dataOut13_tb, dataOut14_tb, dataOut15_tb, dataOut16_tb, dataOut17_tb, dataOut18_tb, dataOut19_tb, dataOut20_tb, dataOut21_tb, dataOut22_tb, dataOut23_tb, dataOut24_tb, dataOut25_tb, dataOut26_tb, dataOut27_tb, dataOut28_tb, dataOut29_tb, dataOut30_tb, dataOut31_tb, dataOut32_tb, dataOut33_tb, dataOut34_tb, dataOut35_tb, dataOut36_tb, dataOut37_tb, dataOut38_tb, dataOut39_tb, dataOut40_tb, dataOut41_tb, dataOut42_tb, dataOut43_tb, dataOut44_tb, dataOut45_tb, dataOut46_tb, dataOut47_tb, dataOut48_tb, dataOut49_tb, dataOut50_tb, dataOut51_tb, dataOut52_tb, dataOut53_tb, dataOut54_tb,dataOut55_tb, dataOut56_tb, dataOut57_tb, dataOut58_tb, dataOut59_tb, dataOut60_tb, dataOut61_tb, dataOut62_tb, dataOut63_tb     :   integer;
begin
    
    DCT641: DCT64_1_I
            PORT MAP(   dataIn0     =>  dataIn0_tb,
                        dataIn1     =>  dataIn1_tb,
                        dataIn2     =>  dataIn2_tb,
                        dataIn3     =>  dataIn3_tb,
                        dataIn4     =>  dataIn4_tb,
                        dataIn5     =>  dataIn5_tb,
                        dataIn6     =>  dataIn6_tb,
                        dataIn7     =>  dataIn7_tb,
                        dataIn8     =>  dataIn8_tb,
                        dataIn9     =>  dataIn9_tb,
                        dataIn10    =>  dataIn10_tb,
                        dataIn11    =>  dataIn11_tb,
                        dataIn12    =>  dataIn12_tb,
                        dataIn13    =>  dataIn13_tb,
                        dataIn14    =>  dataIn14_tb,
                        dataIn15    =>  dataIn15_tb,
                        dataIn16    =>  dataIn16_tb,
                        dataIn17    =>  dataIn17_tb,
                        dataIn18    =>  dataIn18_tb,
                        dataIn19    =>  dataIn19_tb,
                        dataIn20    =>  dataIn20_tb,
                        dataIn21    =>  dataIn21_tb,
                        dataIn22    =>  dataIn22_tb,
                        dataIn23    =>  dataIn23_tb,
                        dataIn24    =>  dataIn24_tb,
                        dataIn25    =>  dataIn25_tb,
                        dataIn26    =>  dataIn26_tb,
                        dataIn27    =>  dataIn27_tb,
                        dataIn28    =>  dataIn28_tb,
                        dataIn29    =>  dataIn29_tb,
                        dataIn30    =>  dataIn30_tb,
                        dataIn31    =>  dataIn31_tb,
                        dataIn32    =>  dataIn32_tb,
                        dataIn33    =>  dataIn33_tb,
                        dataIn34    =>  dataIn34_tb,
                        dataIn35    =>  dataIn35_tb,
                        dataIn36    =>  dataIn36_tb,
                        dataIn37    =>  dataIn37_tb,
                        dataIn38    =>  dataIn38_tb,
                        dataIn39    =>  dataIn39_tb,
                        dataIn40    =>  dataIn40_tb,
                        dataIn41    =>  dataIn41_tb,
                        dataIn42    =>  dataIn42_tb,
                        dataIn43    =>  dataIn43_tb,
                        dataIn44    =>  dataIn44_tb,
                        dataIn45    =>  dataIn45_tb,
                        dataIn46    =>  dataIn46_tb,
                        dataIn47    =>  dataIn47_tb,
                        dataIn48    =>  dataIn48_tb,
                        dataIn49    =>  dataIn49_tb,
                        dataIn50    =>  dataIn50_tb,
                        dataIn51    =>  dataIn51_tb,
                        dataIn52    =>  dataIn52_tb,
                        dataIn53    =>  dataIn53_tb,
                        dataIn54    =>  dataIn54_tb,
                        dataIn55    =>  dataIn55_tb,
                        dataIn56    =>  dataIn56_tb,
                        dataIn57    =>  dataIn57_tb,
                        dataIn58    =>  dataIn58_tb,
                        dataIn59    =>  dataIn59_tb,
                        dataIn60    =>  dataIn60_tb,
                        dataIn61    =>  dataIn61_tb,
                        dataIn62    =>  dataIn62_tb,
                        dataIn63    =>  dataIn63_tb,
                        res         =>  reset_tb,
                        en          =>  en_tb,
                        clk         =>  clock_tb,
                        dataOut0    =>  dataOutStg1640_tb,
                        dataOut1    =>  dataOutStg1641_tb,
                        dataOut2    =>  dataOutStg1642_tb,
                        dataOut3    =>  dataOutStg1643_tb,
                        dataOut4    =>  dataOutStg1644_tb,
                        dataOut5    =>  dataOutStg1645_tb,
                        dataOut6    =>  dataOutStg1646_tb,
                        dataOut7    =>  dataOutStg1647_tb,
                        dataOut8    =>  dataOutStg1648_tb,
                        dataOut9    =>  dataOutStg1649_tb,
                        dataOut10   =>  dataOutStg16410_tb,
                        dataOut11   =>  dataOutStg16411_tb,
                        dataOut12   =>  dataOutStg16412_tb,
                        dataOut13   =>  dataOutStg16413_tb,
                        dataOut14   =>  dataOutStg16414_tb,
                        dataOut15   =>  dataOutStg16415_tb,
                        dataOut16   =>  dataOutStg16416_tb,
                        dataOut17   =>  dataOutStg16417_tb,
                        dataOut18   =>  dataOutStg16418_tb,
                        dataOut19   =>  dataOutStg16419_tb,
                        dataOut20   =>  dataOutStg16420_tb,
                        dataOut21   =>  dataOutStg16421_tb,
                        dataOut22   =>  dataOutStg16422_tb,
                        dataOut23   =>  dataOutStg16423_tb,
                        dataOut24   =>  dataOutStg16424_tb,
                        dataOut25   =>  dataOutStg16425_tb,
                        dataOut26   =>  dataOutStg16426_tb,
                        dataOut27   =>  dataOutStg16427_tb,
                        dataOut28   =>  dataOutStg16428_tb,
                        dataOut29   =>  dataOutStg16429_tb,
                        dataOut30   =>  dataOutStg16430_tb,
                        dataOut31   =>  dataOutStg16431_tb,
                        dataOut32   =>  dataOutStg16432_tb,
                        dataOut33   =>  dataOutStg16433_tb,
                        dataOut34   =>  dataOutStg16434_tb,
                        dataOut35   =>  dataOutStg16435_tb,
                        dataOut36   =>  dataOutStg16436_tb,
                        dataOut37   =>  dataOutStg16437_tb,
                        dataOut38   =>  dataOutStg16438_tb,
                        dataOut39   =>  dataOutStg16439_tb,
                        dataOut40   =>  dataOutStg16440_tb,
                        dataOut41   =>  dataOutStg16441_tb,
                        dataOut42   =>  dataOutStg16442_tb,
                        dataOut43   =>  dataOutStg16443_tb,
                        dataOut44   =>  dataOutStg16444_tb,
                        dataOut45   =>  dataOutStg16445_tb,
                        dataOut46   =>  dataOutStg16446_tb,
                        dataOut47   =>  dataOutStg16447_tb,
                        dataOut48   =>  dataOutStg16448_tb,
                        dataOut49   =>  dataOutStg16449_tb,
                        dataOut50   =>  dataOutStg16450_tb,
                        dataOut51   =>  dataOutStg16451_tb,
                        dataOut52   =>  dataOutStg16452_tb,
                        dataOut53   =>  dataOutStg16453_tb,
                        dataOut54   =>  dataOutStg16454_tb,
                        dataOut55   =>  dataOutStg16455_tb,
                        dataOut56   =>  dataOutStg16456_tb,
                        dataOut57   =>  dataOutStg16457_tb,
                        dataOut58   =>  dataOutStg16458_tb,
                        dataOut59   =>  dataOutStg16459_tb,
                        dataOut60   =>  dataOutStg16460_tb,
                        dataOut61   =>  dataOutStg16461_tb,
                        dataOut62   =>  dataOutStg16462_tb,
                        dataOut63   =>  dataOutStg16463_tb,
                        validOut    =>  valoutstg164_tb
                    );

    DCT321: DCT32_1_I 
            PORT MAP(   dataIn0     =>  dataOutStg1640_tb,
                        dataIn1     =>  dataOutStg1641_tb,
                        dataIn2     =>  dataOutStg1642_tb,
                        dataIn3     =>  dataOutStg1643_tb,
                        dataIn4     =>  dataOutStg1644_tb,
                        dataIn5     =>  dataOutStg1645_tb,
                        dataIn6     =>  dataOutStg1646_tb,
                        dataIn7     =>  dataOutStg1647_tb,
                        dataIn8     =>  dataOutStg1648_tb,
                        dataIn9     =>  dataOutStg1649_tb,
                        dataIn10    =>  dataOutStg16410_tb,
                        dataIn11    =>  dataOutStg16411_tb,
                        dataIn12    =>  dataOutStg16412_tb,
                        dataIn13    =>  dataOutStg16413_tb,
                        dataIn14    =>  dataOutStg16414_tb,
                        dataIn15    =>  dataOutStg16415_tb,
                        dataIn16    =>  dataOutStg16416_tb,
                        dataIn17    =>  dataOutStg16417_tb,
                        dataIn18    =>  dataOutStg16418_tb,
                        dataIn19    =>  dataOutStg16419_tb,
                        dataIn20    =>  dataOutStg16420_tb,
                        dataIn21    =>  dataOutStg16421_tb,
                        dataIn22    =>  dataOutStg16422_tb,
                        dataIn23    =>  dataOutStg16423_tb,
                        dataIn24    =>  dataOutStg16424_tb,
                        dataIn25    =>  dataOutStg16425_tb,
                        dataIn26    =>  dataOutStg16426_tb,
                        dataIn27    =>  dataOutStg16427_tb,
                        dataIn28    =>  dataOutStg16428_tb,
                        dataIn29    =>  dataOutStg16429_tb,
                        dataIn30    =>  dataOutStg16430_tb,
                        dataIn31    =>  dataOutStg16431_tb,
                        res         =>  reset_tb,
                        en          =>  valoutstg164_tb,
                        clk         =>  clock_tb,
                        dataOut0    =>  dataOutStg1320_tb,
                        dataOut1    =>  dataOutStg1321_tb,
                        dataOut2    =>  dataOutStg1322_tb,
                        dataOut3    =>  dataOutStg1323_tb,
                        dataOut4    =>  dataOutStg1324_tb,
                        dataOut5    =>  dataOutStg1325_tb,
                        dataOut6    =>  dataOutStg1326_tb,
                        dataOut7    =>  dataOutStg1327_tb,
                        dataOut8    =>  dataOutStg1328_tb,
                        dataOut9    =>  dataOutStg1329_tb,
                        dataOut10   =>  dataOutStg13210_tb,
                        dataOut11   =>  dataOutStg13211_tb,
                        dataOut12   =>  dataOutStg13212_tb,
                        dataOut13   =>  dataOutStg13213_tb,
                        dataOut14   =>  dataOutStg13214_tb,
                        dataOut15   =>  dataOutStg13215_tb,
                        dataOut16   =>  dataOutStg13216_tb,
                        dataOut17   =>  dataOutStg13217_tb,
                        dataOut18   =>  dataOutStg13218_tb,
                        dataOut19   =>  dataOutStg13219_tb,
                        dataOut20   =>  dataOutStg13220_tb,
                        dataOut21   =>  dataOutStg13221_tb,
                        dataOut22   =>  dataOutStg13222_tb,
                        dataOut23   =>  dataOutStg13223_tb,
                        dataOut24   =>  dataOutStg13224_tb,
                        dataOut25   =>  dataOutStg13225_tb,
                        dataOut26   =>  dataOutStg13226_tb,
                        dataOut27   =>  dataOutStg13227_tb,
                        dataOut28   =>  dataOutStg13228_tb,
                        dataOut29   =>  dataOutStg13229_tb,
                        dataOut30   =>  dataOutStg13230_tb,
                        dataOut31   =>  dataOutStg13231_tb,
                        validOut    =>  valoutstg132_tb
                    );
    
    DCT161: DCT16_1_I 
            PORT MAP(   dataIn0     =>  dataOutStg1320_tb,
                        dataIn1     =>  dataOutStg1321_tb,
                        dataIn2     =>  dataOutStg1322_tb,
                        dataIn3     =>  dataOutStg1323_tb,
                        dataIn4     =>  dataOutStg1324_tb,
                        dataIn5     =>  dataOutStg1325_tb,
                        dataIn6     =>  dataOutStg1326_tb,
                        dataIn7     =>  dataOutStg1327_tb,
                        dataIn8     =>  dataOutStg1328_tb,
                        dataIn9     =>  dataOutStg1329_tb,
                        dataIn10    =>  dataOutStg13210_tb,
                        dataIn11    =>  dataOutStg13211_tb,
                        dataIn12    =>  dataOutStg13212_tb,
                        dataIn13    =>  dataOutStg13213_tb,
                        dataIn14    =>  dataOutStg13214_tb,
                        dataIn15    =>  dataOutStg13215_tb,
                        res         =>  reset_tb,
                        en          =>  valoutstg132_tb,
                        clk         =>  clock_tb,
                        dataOut0    =>  dataOutStg1160_tb,
                        dataOut1    =>  dataOutStg1161_tb,
                        dataOut2    =>  dataOutStg1162_tb,
                        dataOut3    =>  dataOutStg1163_tb,
                        dataOut4    =>  dataOutStg1164_tb,
                        dataOut5    =>  dataOutStg1165_tb,
                        dataOut6    =>  dataOutStg1166_tb,
                        dataOut7    =>  dataOutStg1167_tb,
                        dataOut8    =>  dataOutStg1168_tb,
                        dataOut9    =>  dataOutStg1169_tb,
                        dataOut10   =>  dataOutStg11610_tb,
                        dataOut11   =>  dataOutStg11611_tb,
                        dataOut12   =>  dataOutStg11612_tb,
                        dataOut13   =>  dataOutStg11613_tb,
                        dataOut14   =>  dataOutStg11614_tb,
                        dataOut15   =>  dataOutStg11615_tb,
                        validOut    =>  valoutstg116_tb
                    );

    DCT81:  DCT8_1_I 
            PORT MAP(   dataIn0     =>  dataOutStg1160_tb,
                        dataIn1     =>  dataOutStg1161_tb,
                        dataIn2     =>  dataOutStg1162_tb,
                        dataIn3     =>  dataOutStg1163_tb,
                        dataIn4     =>  dataOutStg1164_tb,
                        dataIn5     =>  dataOutStg1165_tb,
                        dataIn6     =>  dataOutStg1166_tb,
                        dataIn7     =>  dataOutStg1167_tb,
                        res         =>  reset_tb,
                        en          =>  valoutstg116_tb,
                        clk         =>  clock_tb,
                        dataOut0    =>  dataOutStg180_tb,
                        dataOut1    =>  dataOutStg181_tb,
                        dataOut2    =>  dataOutStg182_tb,
                        dataOut3    =>  dataOutStg183_tb,
                        dataOut4    =>  dataOutStg184_tb,
                        dataOut5    =>  dataOutStg185_tb,
                        dataOut6    =>  dataOutStg186_tb,
                        dataOut7    =>  dataOutStg187_tb,
                        validOut    =>  valoutstg18_tb
            );

    DCT4:   DCT4_I
            PORT MAP(   dataIn0     =>  dataOutStg180_tb,
                        dataIn1     =>  dataOutStg181_tb,
                        dataIn2     =>  dataOutStg182_tb,
                        dataIn3     =>  dataOutStg183_tb,
                        res         =>  reset_tb,
                        en          =>  valoutstg18_tb,
                        clk         =>  clock_tb,
                        dataOut0    =>  dataOut0_tb,
                        dataOut1    =>  dataOut32_tb,
                        dataOut2    =>  dataOut16_tb,
                        dataOut3    =>  dataOut48_tb,
                        validOut    =>  valoutdct4_tb
            );

    DCT82:  DCT8_2_I 
            PORT MAP(   dataIn4     =>  dataOutStg184_tb,
                        dataIn5     =>  dataOutStg185_tb,
                        dataIn6     =>  dataOutStg186_tb,
                        dataIn7     =>  dataOutStg187_tb,
                        res         =>  reset_tb,
                        en          =>  valoutstg18_tb,
                        clk         =>  clock_tb,
                        dataOut4    =>  dataOut8_tb,
                        dataOut5    =>  dataOut40_tb,
                        dataOut6    =>  dataOut24_tb,
                        dataOut7    =>  dataOut56_tb,
                        validOut    =>  valoutdct8_tb
            );

    DCT162: DCT16_2_I 
            PORT MAP(   dataIn8     =>  dataOutStg1168_tb,
                        dataIn9     =>  dataOutStg1169_tb,
                        dataIn10    =>  dataOutStg11610_tb,
                        dataIn11    =>  dataOutStg11611_tb,
                        dataIn12    =>  dataOutStg11612_tb,
                        dataIn13    =>  dataOutStg11613_tb,
                        dataIn14    =>  dataOutStg11614_tb,
                        dataIn15    =>  dataOutStg11615_tb,
                        res         =>  reset_tb,
                        en          =>  valoutstg116_tb,
                        clk         =>  clock_tb,
                        dataOut8    =>  dataOut4_tb,
                        dataOut9    =>  dataOut36_tb,
                        dataOut10   =>  dataOut20_tb,
                        dataOut11   =>  dataOut52_tb,
                        dataOut12   =>  dataOut12_tb,
                        dataOut13   =>  dataOut44_tb,
                        dataOut14   =>  dataOut28_tb,
                        dataOut15   =>  dataOut60_tb,
                        validOut    =>  valoutdct16_tb
                    );
    
    DCT322: DCT32_2_I
            PORT MAP(   dataIn16   => dataOutStg13216_tb,
                        dataIn17   => dataOutStg13217_tb,
                        dataIn18   => dataOutStg13218_tb,
                        dataIn19   => dataOutStg13219_tb,
                        dataIn20   => dataOutStg13220_tb,
                        dataIn21   => dataOutStg13221_tb,
                        dataIn22   => dataOutStg13222_tb,
                        dataIn23   => dataOutStg13223_tb,
                        dataIn24   => dataOutStg13224_tb,
                        dataIn25   => dataOutStg13225_tb,
                        dataIn26   => dataOutStg13226_tb,
                        dataIn27   => dataOutStg13227_tb,
                        dataIn28   => dataOutStg13228_tb,
                        dataIn29   => dataOutStg13229_tb,
                        dataIn30   => dataOutStg13230_tb,
                        dataIn31   => dataOutStg13231_tb,
                        res        => reset_tb,
                        en         => valoutstg132_tb,
                        clk        => clock_tb,
                        dataOut16  => dataOut2_tb,
                        dataOut17  => dataOut34_tb,
                        dataOut18  => dataOut18_tb,
                        dataOut19  => dataOut50_tb,
                        dataOut20  => dataOut10_tb,
                        dataOut21  => dataOut42_tb,
                        dataOut22  => dataOut26_tb,
                        dataOut23  => dataOut58_tb,
                        dataOut24  => dataOut6_tb,
                        dataOut25  => dataOut38_tb,
                        dataOut26  => dataOut22_tb,
                        dataOut27  => dataOut54_tb,
                        dataOut28  => dataOut14_tb,
                        dataOut29  => dataOut46_tb,
                        dataOut30  => dataOut30_tb,
                        dataOut31  => dataOut62_tb,
                        validOut   => valoutdct32_tb
            );

    DCT642: DCT64_2_I
            PORT MAP(   dataIn32    =>  dataOutStg16432_tb,
                        dataIn33    =>  dataOutStg16433_tb,
                        dataIn34    =>  dataOutStg16434_tb,
                        dataIn35    =>  dataOutStg16435_tb,
                        dataIn36    =>  dataOutStg16436_tb,
                        dataIn37    =>  dataOutStg16437_tb,
                        dataIn38    =>  dataOutStg16438_tb,
                        dataIn39    =>  dataOutStg16439_tb,
                        dataIn40    =>  dataOutStg16440_tb,
                        dataIn41    =>  dataOutStg16441_tb,
                        dataIn42    =>  dataOutStg16442_tb,
                        dataIn43    =>  dataOutStg16443_tb,
                        dataIn44    =>  dataOutStg16444_tb,
                        dataIn45    =>  dataOutStg16445_tb,
                        dataIn46    =>  dataOutStg16446_tb,
                        dataIn47    =>  dataOutStg16447_tb,
                        dataIn48    =>  dataOutStg16448_tb,
                        dataIn49    =>  dataOutStg16449_tb,
                        dataIn50    =>  dataOutStg16450_tb,
                        dataIn51    =>  dataOutStg16451_tb,
                        dataIn52    =>  dataOutStg16452_tb,
                        dataIn53    =>  dataOutStg16453_tb,
                        dataIn54    =>  dataOutStg16454_tb,
                        dataIn55    =>  dataOutStg16455_tb,
                        dataIn56    =>  dataOutStg16456_tb,
                        dataIn57    =>  dataOutStg16457_tb,
                        dataIn58    =>  dataOutStg16458_tb,
                        dataIn59    =>  dataOutStg16459_tb,
                        dataIn60    =>  dataOutStg16460_tb,
                        dataIn61    =>  dataOutStg16461_tb,
                        dataIn62    =>  dataOutStg16462_tb,
                        dataIn63    =>  dataOutStg16463_tb,
                        res         =>  reset_tb,
                        en          =>  valoutstg164_tb,
                        clk         =>  clock_tb,
                        dataOut32   =>  dataOut1_tb,
                        dataOut33   =>  dataOut33_tb,
                        dataOut34   =>  dataOut17_tb,
                        dataOut35   =>  dataOut49_tb,
                        dataOut36   =>  dataOut9_tb,
                        dataOut37   =>  dataOut41_tb,
                        dataOut38   =>  dataOut25_tb,
                        dataOut39   =>  dataOut57_tb,
                        dataOut40   =>  dataOut5_tb,
                        dataOut41   =>  dataOut37_tb,
                        dataOut42   =>  dataOut21_tb,
                        dataOut43   =>  dataOut53_tb,
                        dataOut44   =>  dataOut13_tb,
                        dataOut45   =>  dataOut45_tb,
                        dataOut46   =>  dataOut29_tb,
                        dataOut47   =>  dataOut61_tb,
                        dataOut48   =>  dataOut3_tb,
                        dataOut49   =>  dataOut35_tb,
                        dataOut50   =>  dataOut19_tb,
                        dataOut51   =>  dataOut51_tb,
                        dataOut52   =>  dataOut11_tb,
                        dataOut53   =>  dataOut43_tb,
                        dataOut54   =>  dataOut27_tb,
                        dataOut55   =>  dataOut59_tb,
                        dataOut56   =>  dataOut7_tb,
                        dataOut57   =>  dataOut39_tb,
                        dataOut58   =>  dataOut23_tb,
                        dataOut59   =>  dataOut55_tb,
                        dataOut60   =>  dataOut15_tb,
                        dataOut61   =>  dataOut47_tb,
                        dataOut62   =>  dataOut31_tb,
                        dataOut63   =>  dataOut63_tb,
                        validOut    =>  valoutdct64_tb
                    );

    valout_tb   <= valoutdct4_tb and valoutdct8_tb and valoutdct16_tb and valoutdct32_tb and valoutdct64_tb;

    clk:    process	 		
            begin
                clock_tb <= '1';
                wait for 50us;
                clock_tb <= '0';
                wait for 50us;
            end process;
                   
    en:     process
            begin
                en_tb <= '1';       
                wait;
            end process;
                    
    dataIn: process
            begin
                dataIn0_tb      <= 1;
                dataIn1_tb      <= 1;
                dataIn2_tb      <= 1;
                dataIn3_tb      <= 1;
                dataIn4_tb      <= 1;
                dataIn5_tb      <= 1;
                dataIn6_tb      <= 1;
                dataIn7_tb      <= 1;
                dataIn8_tb      <= 1;     
                dataIn9_tb      <= 1;     
                dataIn10_tb     <= 1;            
                dataIn11_tb     <= 1;            
                dataIn12_tb     <= 1;            
                dataIn13_tb     <= 1;            
                dataIn14_tb     <= 1;            
                dataIn15_tb     <= 1;       
                dataIn16_tb     <= 1;
                dataIn17_tb     <= 1;
                dataIn18_tb     <= 1;
                dataIn19_tb     <= 1;
                dataIn20_tb     <= 1;
                dataIn21_tb     <= 1;
                dataIn22_tb     <= 1;
                dataIn23_tb     <= 1;
                dataIn24_tb     <= 1;     
                dataIn25_tb     <= 1;     
                dataIn26_tb     <= 1;            
                dataIn27_tb     <= 1;            
                dataIn28_tb     <= 1;            
                dataIn29_tb     <= 1;            
                dataIn30_tb     <= 1;            
                dataIn31_tb     <= 1;       
                dataIn32_tb      <=1;
                dataIn33_tb      <=1;
                dataIn34_tb      <=1;
                dataIn35_tb      <=1;
                dataIn36_tb      <=1;
                dataIn37_tb      <=1;
                dataIn38_tb      <=1;
                dataIn39_tb      <=1;
                dataIn40_tb      <=1;     
                dataIn41_tb      <=1;     
                dataIn42_tb     <= 1;            
                dataIn43_tb     <= 1;            
                dataIn44_tb     <= 1;            
                dataIn45_tb     <= 1;            
                dataIn46_tb     <= 1;            
                dataIn47_tb     <= 1;       
                dataIn48_tb     <= 1;
                dataIn49_tb     <= 1;
                dataIn50_tb     <= 1;
                dataIn51_tb     <= 1;
                dataIn52_tb     <= 1;
                dataIn53_tb     <= 1;
                dataIn54_tb     <= 1;
                dataIn55_tb     <= 1;
                dataIn56_tb     <= 1;     
                dataIn57_tb     <= 1;     
                dataIn58_tb     <= 1;            
                dataIn59_tb     <= 1;            
                dataIn60_tb     <= 1;            
                dataIn61_tb     <= 1;            
                dataIn62_tb     <= 1;            
                dataIn63_tb     <= 1;       
                reset_tb <= '0';
                wait for 6000us;
                reset_tb <= '1';
                wait for 200us;
                dataIn0_tb      <= -1;
                dataIn1_tb      <= -1;
                dataIn2_tb      <= -1;
                dataIn3_tb      <= -1;
                dataIn4_tb      <= -1;
                dataIn5_tb      <= -1;
                dataIn6_tb      <= -1;
                dataIn7_tb      <= -1;
                dataIn8_tb      <= -1;     
                dataIn9_tb      <= -1;     
                dataIn10_tb     <= -1;            
                dataIn11_tb     <= -1;            
                dataIn12_tb     <= -1;            
                dataIn13_tb     <= -1;            
                dataIn14_tb     <= -1;            
                dataIn15_tb     <= -1;  
                dataIn16_tb     <= -1;
                dataIn17_tb     <= -1;
                dataIn18_tb     <= -1;
                dataIn19_tb     <= -1;
                dataIn20_tb     <= -1;
                dataIn21_tb     <= -1;
                dataIn22_tb     <= -1;
                dataIn23_tb     <= -1;
                dataIn24_tb     <= -1;     
                dataIn25_tb     <= -1;     
                dataIn26_tb     <= -1;            
                dataIn27_tb     <= -1;            
                dataIn28_tb     <= -1;            
                dataIn29_tb     <= -1;            
                dataIn30_tb     <= -1;            
                dataIn31_tb     <= -1; 
                dataIn32_tb      <=-1;
                dataIn33_tb      <=-1;
                dataIn34_tb      <=-1;
                dataIn35_tb      <=-1;
                dataIn36_tb      <=-1;
                dataIn37_tb      <=-1;
                dataIn38_tb      <=-1;
                dataIn39_tb      <=-1;
                dataIn40_tb      <=-1;     
                dataIn41_tb      <=-1;     
                dataIn42_tb     <= -1;            
                dataIn43_tb     <= -1;            
                dataIn44_tb     <= -1;            
                dataIn45_tb     <= -1;            
                dataIn46_tb     <= -1;            
                dataIn47_tb     <= -1;  
                dataIn48_tb     <= -1;
                dataIn49_tb     <= -1;
                dataIn50_tb     <= -1;
                dataIn51_tb     <= -1;
                dataIn52_tb     <= -1;
                dataIn53_tb     <= -1;
                dataIn54_tb     <= -1;
                dataIn55_tb     <= -1;
                dataIn56_tb     <= -1;     
                dataIn57_tb     <= -1;     
                dataIn58_tb     <= -1;            
                dataIn59_tb     <= -1;            
                dataIn60_tb     <= -1;            
                dataIn61_tb     <= -1;            
                dataIn62_tb     <= -1;            
                dataIn63_tb     <= -1;  
                reset_tb <= '0';
                wait for 6000us;
                reset_tb <= '1';
                wait for 250us;
                dataIn0_tb      <= 20;
                dataIn1_tb      <= 65;
                dataIn2_tb      <= -56;
                dataIn3_tb      <= -78;
                dataIn4_tb      <= 61;
                dataIn5_tb      <= -30;
                dataIn6_tb      <= 32;
                dataIn7_tb      <= -52;
                dataIn8_tb      <= -150;     
                dataIn9_tb      <= -7;     
                dataIn10_tb     <= 60;            
                dataIn11_tb     <= 20;            
                dataIn12_tb     <= 5;            
                dataIn13_tb     <= -200;            
                dataIn14_tb     <= -30;            
                dataIn15_tb     <= 5;  
                dataIn16_tb     <= 23;
                dataIn17_tb     <= 63;
                dataIn18_tb     <= -53;
                dataIn19_tb     <= -73;
                dataIn20_tb     <= 63;
                dataIn21_tb     <= -33;
                dataIn22_tb     <= 33;
                dataIn23_tb     <= -53;
                dataIn24_tb     <= -153;     
                dataIn25_tb     <= -3;     
                dataIn26_tb     <= 63;            
                dataIn27_tb     <= 23;            
                dataIn28_tb     <= 3;            
                dataIn29_tb     <= -203;            
                dataIn30_tb     <= -33;            
                dataIn31_tb     <= 3;  
                dataIn32_tb     <= 20;
                dataIn33_tb     <= 65;
                dataIn34_tb     <= -56;
                dataIn35_tb     <= -78;
                dataIn36_tb     <= 61;
                dataIn37_tb     <= -30;
                dataIn38_tb     <= 32;
                dataIn39_tb     <= -52;
                dataIn40_tb     <= -150;     
                dataIn41_tb     <= -7;     
                dataIn42_tb     <= 60;            
                dataIn43_tb     <= 20;            
                dataIn44_tb     <= 5;            
                dataIn45_tb     <= -200;            
                dataIn46_tb     <= -30;            
                dataIn47_tb     <= 5;  
                dataIn48_tb     <= 23;
                dataIn49_tb     <= 63;
                dataIn50_tb     <= -53;
                dataIn51_tb     <= -73;
                dataIn52_tb     <= 63;
                dataIn53_tb     <= -33;
                dataIn54_tb     <= 33;
                dataIn55_tb     <= -53;
                dataIn56_tb     <= -153;     
                dataIn57_tb     <= -3;     
                dataIn58_tb     <= 63;            
                dataIn59_tb     <= 23;            
                dataIn60_tb     <= 3;            
                dataIn61_tb     <= -203;            
                dataIn62_tb     <= -33;            
                dataIn63_tb     <= 3;  
                reset_tb <= '0';
                wait for 6000us;
            end process;
end Behavioral;
