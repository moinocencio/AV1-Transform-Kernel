----------------------------------------------------------------------------------
-- DCT832 Test Bench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DCT32_I_TB is
end DCT32_I_TB;

architecture Behavioral of DCT32_I_TB is
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
    
    signal reset_tb, en_tb, clock_tb, valoutstg132_tb, valoutstg116_tb, valoutstg18_tb, valoutdct4_tb, valoutdct8_tb, valoutdct16_tb, valoutdct32_tb, valout_tb : std_logic;
    signal dataOutStg1320_tb, dataOutStg1321_tb, dataOutStg1322_tb, dataOutStg1323_tb, dataOutStg1324_tb, dataOutStg1325_tb, dataOutStg1326_tb, dataOutStg1327_tb, dataOutStg1328_tb, dataOutStg1329_tb, dataOutStg13210_tb, dataOutStg13211_tb, dataOutStg13212_tb, dataOutStg13213_tb, dataOutStg13214_tb, dataOutStg13215_tb, dataOutStg13216_tb, dataOutStg13217_tb, dataOutStg13218_tb, dataOutStg13219_tb, dataOutStg13220_tb, dataOutStg13221_tb, dataOutStg13222_tb, dataOutStg13223_tb, dataOutStg13224_tb, dataOutStg13225_tb, dataOutStg13226_tb, dataOutStg13227_tb, dataOutStg13228_tb, dataOutStg13229_tb, dataOutStg13230_tb, dataOutStg13231_tb     :   integer;
    signal dataOutStg1160_tb, dataOutStg1161_tb, dataOutStg1162_tb, dataOutStg1163_tb, dataOutStg1164_tb, dataOutStg1165_tb, dataOutStg1166_tb, dataOutStg1167_tb, dataOutStg1168_tb, dataOutStg1169_tb, dataOutStg11610_tb, dataOutStg11611_tb, dataOutStg11612_tb, dataOutStg11613_tb, dataOutStg11614_tb, dataOutStg11615_tb     : integer;
    signal dataOutStg180_tb, dataOutStg181_tb, dataOutStg182_tb, dataOutStg183_tb, dataOutStg184_tb, dataOutStg185_tb, dataOutStg186_tb, dataOutStg187_tb   : integer;

    signal dataIn0_tb, dataIn1_tb, dataIn2_tb, dataIn3_tb, dataIn4_tb, dataIn5_tb, dataIn6_tb, dataIn7_tb, dataIn8_tb, dataIn9_tb, dataIn10_tb, dataIn11_tb, dataIn12_tb, dataIn13_tb, dataIn14_tb, dataIn15_tb, dataIn16_tb, dataIn17_tb, dataIn18_tb, dataIn19_tb, dataIn20_tb, dataIn21_tb, dataIn22_tb, dataIn23_tb, dataIn24_tb, dataIn25_tb, dataIn26_tb, dataIn27_tb, dataIn28_tb, dataIn29_tb, dataIn30_tb, dataIn31_tb     :   integer;
    signal dataOut0_tb, dataOut1_tb, dataOut2_tb, dataOut3_tb, dataOut4_tb, dataOut5_tb, dataOut6_tb, dataOut7_tb, dataOut8_tb, dataOut9_tb, dataOut10_tb, dataOut11_tb, dataOut12_tb, dataOut13_tb, dataOut14_tb, dataOut15_tb, dataOut16_tb, dataOut17_tb, dataOut18_tb, dataOut19_tb, dataOut20_tb, dataOut21_tb, dataOut22_tb, dataOut23_tb, dataOut24_tb, dataOut25_tb, dataOut26_tb, dataOut27_tb, dataOut28_tb, dataOut29_tb, dataOut30_tb, dataOut31_tb     :   integer;
begin
    
    DCT321: DCT32_1_I 
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
                        res         =>  reset_tb,
                        en          =>  en_tb,
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
                        dataOut1    =>  dataOut16_tb,
                        dataOut2    =>  dataOut8_tb,
                        dataOut3    =>  dataOut24_tb,
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
                        dataOut4    =>  dataOut4_tb,
                        dataOut5    =>  dataOut20_tb,
                        dataOut6    =>  dataOut12_tb,
                        dataOut7    =>  dataOut28_tb,
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
                        dataOut8    =>  dataOut2_tb,
                        dataOut9    =>  dataOut18_tb,
                        dataOut10   =>  dataOut10_tb,
                        dataOut11   =>  dataOut26_tb,
                        dataOut12   =>  dataOut6_tb,
                        dataOut13   =>  dataOut22_tb,
                        dataOut14   =>  dataOut14_tb,
                        dataOut15   =>  dataOut30_tb,
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
                        dataOut16  => dataOut1_tb,
                        dataOut17  => dataOut17_tb,
                        dataOut18  => dataOut9_tb,
                        dataOut19  => dataOut25_tb,
                        dataOut20  => dataOut5_tb,
                        dataOut21  => dataOut21_tb,
                        dataOut22  => dataOut13_tb,
                        dataOut23  => dataOut29_tb,
                        dataOut24  => dataOut3_tb,
                        dataOut25  => dataOut19_tb,
                        dataOut26  => dataOut11_tb,
                        dataOut27  => dataOut27_tb,
                        dataOut28  => dataOut7_tb,
                        dataOut29  => dataOut23_tb,
                        dataOut30  => dataOut15_tb,
                        dataOut31  => dataOut31_tb,
                        validOut   => valoutdct32_tb
            );

    valout_tb   <= valoutdct4_tb and valoutdct8_tb and valoutdct16_tb and valoutdct32_tb;
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
                reset_tb <= '0';
                wait for 2000us;
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
                reset_tb <= '0';
                wait for 2000us;
                reset_tb <= '1';
                wait for 200us;
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
                reset_tb <= '0';
                wait for 2000us;
            end process;
end Behavioral;
