----------------------------------------------------------------------------------
-- DCT832 Test Bench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TransWrapper_TB is
end TransWrapper_TB;

architecture Behavioral of TransWrapper_TB is
    component TransWrapper is
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
    end component;
    
    signal reset_tb, en_tb, clock_tb, valout_tb : std_logic;
    signal sel_tb   : std_logic_vector(2 downto 0);
    signal dataIn0_tb, dataIn1_tb, dataIn2_tb, dataIn3_tb, dataIn4_tb, dataIn5_tb, dataIn6_tb, dataIn7_tb, dataIn8_tb, dataIn9_tb, dataIn10_tb, dataIn11_tb, dataIn12_tb, dataIn13_tb, dataIn14_tb, dataIn15_tb, dataIn16_tb, dataIn17_tb, dataIn18_tb, dataIn19_tb, dataIn20_tb, dataIn21_tb, dataIn22_tb, dataIn23_tb, dataIn24_tb, dataIn25_tb, dataIn26_tb, dataIn27_tb, dataIn28_tb, dataIn29_tb, dataIn30_tb, dataIn31_tb, dataIn32_tb, dataIn33_tb, dataIn34_tb, dataIn35_tb, dataIn36_tb, dataIn37_tb, dataIn38_tb, dataIn39_tb, dataIn40_tb, dataIn41_tb, dataIn42_tb, dataIn43_tb, dataIn44_tb, dataIn45_tb, dataIn46_tb, dataIn47_tb, dataIn48_tb, dataIn49_tb, dataIn50_tb, dataIn51_tb, dataIn52_tb, dataIn53_tb, dataIn54_tb,dataIn55_tb, dataIn56_tb, dataIn57_tb, dataIn58_tb, dataIn59_tb, dataIn60_tb, dataIn61_tb, dataIn62_tb, dataIn63_tb     :   std_logic_vector(31 downto 0);
    signal dataOut0_tb, dataOut1_tb, dataOut2_tb, dataOut3_tb, dataOut4_tb, dataOut5_tb, dataOut6_tb, dataOut7_tb, dataOut8_tb, dataOut9_tb, dataOut10_tb, dataOut11_tb, dataOut12_tb, dataOut13_tb, dataOut14_tb, dataOut15_tb, dataOut16_tb, dataOut17_tb, dataOut18_tb, dataOut19_tb, dataOut20_tb, dataOut21_tb, dataOut22_tb, dataOut23_tb, dataOut24_tb, dataOut25_tb, dataOut26_tb, dataOut27_tb, dataOut28_tb, dataOut29_tb, dataOut30_tb, dataOut31_tb, dataOut32_tb, dataOut33_tb, dataOut34_tb, dataOut35_tb, dataOut36_tb, dataOut37_tb, dataOut38_tb, dataOut39_tb, dataOut40_tb, dataOut41_tb, dataOut42_tb, dataOut43_tb, dataOut44_tb, dataOut45_tb, dataOut46_tb, dataOut47_tb, dataOut48_tb, dataOut49_tb, dataOut50_tb, dataOut51_tb, dataOut52_tb, dataOut53_tb, dataOut54_tb,dataOut55_tb, dataOut56_tb, dataOut57_tb, dataOut58_tb, dataOut59_tb, dataOut60_tb, dataOut61_tb, dataOut62_tb, dataOut63_tb     :   std_logic_vector(31 downto 0);
begin
    
    uut:    TransWrapper 
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
                        sel         =>  sel_tb,
                        dataOut0    =>  dataOut0_tb,
                        dataOut1    =>  dataOut1_tb,
                        dataOut2    =>  dataOut2_tb,
                        dataOut3    =>  dataOut3_tb,
                        dataOut4    =>  dataOut4_tb,
                        dataOut5    =>  dataOut5_tb,
                        dataOut6    =>  dataOut6_tb,
                        dataOut7    =>  dataOut7_tb,
                        dataOut8    =>  dataOut8_tb,
                        dataOut9    =>  dataOut9_tb,
                        dataOut10   =>  dataOut10_tb,
                        dataOut11   =>  dataOut11_tb,
                        dataOut12   =>  dataOut12_tb,
                        dataOut13   =>  dataOut13_tb,
                        dataOut14   =>  dataOut14_tb,
                        dataOut15   =>  dataOut15_tb,
                        dataOut16   =>  dataOut16_tb,
                        dataOut17   =>  dataOut17_tb,
                        dataOut18   =>  dataOut18_tb,
                        dataOut19   =>  dataOut19_tb,
                        dataOut20   =>  dataOut20_tb,
                        dataOut21   =>  dataOut21_tb,
                        dataOut22   =>  dataOut22_tb,
                        dataOut23   =>  dataOut23_tb,
                        dataOut24   =>  dataOut24_tb,
                        dataOut25   =>  dataOut25_tb,
                        dataOut26   =>  dataOut26_tb,
                        dataOut27   =>  dataOut27_tb,
                        dataOut28   =>  dataOut28_tb,
                        dataOut29   =>  dataOut29_tb,
                        dataOut30   =>  dataOut30_tb,
                        dataOut31   =>  dataOut31_tb,
                        dataOut32   =>  dataOut32_tb,
                        dataOut33   =>  dataOut33_tb,
                        dataOut34   =>  dataOut34_tb,
                        dataOut35   =>  dataOut35_tb,
                        dataOut36   =>  dataOut36_tb,
                        dataOut37   =>  dataOut37_tb,
                        dataOut38   =>  dataOut38_tb,
                        dataOut39   =>  dataOut39_tb,
                        dataOut40   =>  dataOut40_tb,
                        dataOut41   =>  dataOut41_tb,
                        dataOut42   =>  dataOut42_tb,
                        dataOut43   =>  dataOut43_tb,
                        dataOut44   =>  dataOut44_tb,
                        dataOut45   =>  dataOut45_tb,
                        dataOut46   =>  dataOut46_tb,
                        dataOut47   =>  dataOut47_tb,
                        dataOut48   =>  dataOut48_tb,
                        dataOut49   =>  dataOut49_tb,
                        dataOut50   =>  dataOut50_tb,
                        dataOut51   =>  dataOut51_tb,
                        dataOut52   =>  dataOut52_tb,
                        dataOut53   =>  dataOut53_tb,
                        dataOut54   =>  dataOut54_tb,
                        dataOut55   =>  dataOut55_tb,
                        dataOut56   =>  dataOut56_tb,
                        dataOut57   =>  dataOut57_tb,
                        dataOut58   =>  dataOut58_tb,
                        dataOut59   =>  dataOut59_tb,
                        dataOut60   =>  dataOut60_tb,
                        dataOut61   =>  dataOut61_tb,
                        dataOut62   =>  dataOut62_tb,
                        dataOut63   =>  dataOut63_tb,
                        validOut    =>  valout_tb
                    );
    
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
                sel_tb          <= "001";
                dataIn0_tb      <= X"FFFFFFFF";
                dataIn1_tb      <= X"FFFFFFFF";
                dataIn2_tb      <= X"FFFFFFFF";
                dataIn3_tb      <= X"FFFFFFFF";
                dataIn4_tb      <= X"00000001";
                dataIn5_tb      <= X"00000001";
                dataIn6_tb      <= X"00000001";
                dataIn7_tb      <= X"00000001";
                dataIn8_tb      <= X"FFFFFFFF";     
                dataIn9_tb      <= X"FFFFFFFF";     
                dataIn10_tb     <= X"FFFFFFFF";            
                dataIn11_tb     <= X"FFFFFFFF";            
                dataIn12_tb     <= X"00000001";            
                dataIn13_tb     <= X"00000001";            
                dataIn14_tb     <= X"00000001";            
                dataIn15_tb     <= X"00000001";       
                dataIn16_tb     <= X"FFFFFFFF";
                dataIn17_tb     <= X"FFFFFFFF";
                dataIn18_tb     <= X"FFFFFFFF";
                dataIn19_tb     <= X"FFFFFFFF";
                dataIn20_tb     <= X"00000001";
                dataIn21_tb     <= X"00000001";
                dataIn22_tb     <= X"00000001";
                dataIn23_tb     <= X"00000001";
                dataIn24_tb     <= X"FFFFFFFF";     
                dataIn25_tb     <= X"FFFFFFFF";     
                dataIn26_tb     <= X"FFFFFFFF";            
                dataIn27_tb     <= X"FFFFFFFF";            
                dataIn28_tb     <= X"00000001";            
                dataIn29_tb     <= X"00000001";            
                dataIn30_tb     <= X"00000001";            
                dataIn31_tb     <= X"00000001";       
                dataIn32_tb      <= X"FFFFFFFF";
                dataIn33_tb      <= X"FFFFFFFF";
                dataIn34_tb      <= X"FFFFFFFF";
                dataIn35_tb      <= X"FFFFFFFF";
                dataIn36_tb      <= X"00000001";
                dataIn37_tb      <= X"00000001";
                dataIn38_tb      <= X"00000001";
                dataIn39_tb      <= X"00000001";
                dataIn40_tb      <= X"FFFFFFFF";     
                dataIn41_tb      <= X"FFFFFFFF";     
                dataIn42_tb     <= X"FFFFFFFF";            
                dataIn43_tb     <= X"FFFFFFFF";            
                dataIn44_tb     <= X"00000001";            
                dataIn45_tb     <= X"00000001";            
                dataIn46_tb     <= X"00000001";            
                dataIn47_tb     <= X"00000001";       
                dataIn48_tb     <= X"FFFFFFFF";
                dataIn49_tb     <= X"FFFFFFFF";
                dataIn50_tb     <= X"FFFFFFFF";
                dataIn51_tb     <= X"FFFFFFFF";
                dataIn52_tb     <= X"00000001";
                dataIn53_tb     <= X"00000001";
                dataIn54_tb     <= X"00000001";
                dataIn55_tb     <= X"00000001";
                dataIn56_tb     <= X"FFFFFFFF";     
                dataIn57_tb     <= X"FFFFFFFF";     
                dataIn58_tb     <= X"FFFFFFFF";            
                dataIn59_tb     <= X"FFFFFFFF";            
                dataIn60_tb     <= X"00000001";            
                dataIn61_tb     <= X"00000001";            
                dataIn62_tb     <= X"00000001";            
                dataIn63_tb     <= X"00000001";       
                reset_tb <= '0';
                wait for 6000us;
                reset_tb <= '1';
                wait for 200us;
                sel_tb             <= "011";
                dataIn0_tb      <= X"FFFFFFFF";
                dataIn1_tb      <= X"FFFFFFFF";
                dataIn2_tb      <= X"FFFFFFFF";
                dataIn3_tb      <= X"FFFFFFFF";
                dataIn4_tb      <= X"FFFFFFFF";
                dataIn5_tb      <= X"FFFFFFFF";
                dataIn6_tb      <= X"FFFFFFFF";
                dataIn7_tb      <= X"FFFFFFFF";
                dataIn8_tb      <= X"FFFFFFFF";     
                dataIn9_tb      <= X"FFFFFFFF";     
                dataIn10_tb     <= X"FFFFFFFF";            
                dataIn11_tb     <= X"FFFFFFFF";            
                dataIn12_tb     <= X"FFFFFFFF";            
                dataIn13_tb     <= X"FFFFFFFF";            
                dataIn14_tb     <= X"FFFFFFFF";            
                dataIn15_tb     <= X"FFFFFFFF";  
                dataIn16_tb     <= X"FFFFFFFF";
                dataIn17_tb     <= X"FFFFFFFF";
                dataIn18_tb     <= X"FFFFFFFF";
                dataIn19_tb     <= X"FFFFFFFF";
                dataIn20_tb     <= X"FFFFFFFF";
                dataIn21_tb     <= X"FFFFFFFF";
                dataIn22_tb     <= X"FFFFFFFF";
                dataIn23_tb     <= X"FFFFFFFF";
                dataIn24_tb     <= X"FFFFFFFF";     
                dataIn25_tb     <= X"FFFFFFFF";     
                dataIn26_tb     <= X"FFFFFFFF";            
                dataIn27_tb     <= X"FFFFFFFF";            
                dataIn28_tb     <= X"FFFFFFFF";            
                dataIn29_tb     <= X"FFFFFFFF";            
                dataIn30_tb     <= X"FFFFFFFF";            
                dataIn31_tb     <= X"FFFFFFFF"; 
                dataIn32_tb      <= X"FFFFFFFF";
                dataIn33_tb      <= X"FFFFFFFF";
                dataIn34_tb      <= X"FFFFFFFF";
                dataIn35_tb      <= X"FFFFFFFF";
                dataIn36_tb      <= X"FFFFFFFF";
                dataIn37_tb      <= X"FFFFFFFF";
                dataIn38_tb      <= X"FFFFFFFF";
                dataIn39_tb      <= X"FFFFFFFF";
                dataIn40_tb      <= X"FFFFFFFF";     
                dataIn41_tb      <= X"FFFFFFFF";     
                dataIn42_tb     <= X"FFFFFFFF";            
                dataIn43_tb     <= X"FFFFFFFF";            
                dataIn44_tb     <= X"FFFFFFFF";            
                dataIn45_tb     <= X"FFFFFFFF";            
                dataIn46_tb     <= X"FFFFFFFF";            
                dataIn47_tb     <= X"FFFFFFFF";  
                dataIn48_tb     <= X"FFFFFFFF";
                dataIn49_tb     <= X"FFFFFFFF";
                dataIn50_tb     <= X"FFFFFFFF";
                dataIn51_tb     <= X"FFFFFFFF";
                dataIn52_tb     <= X"FFFFFFFF";
                dataIn53_tb     <= X"FFFFFFFF";
                dataIn54_tb     <= X"FFFFFFFF";
                dataIn55_tb     <= X"FFFFFFFF";
                dataIn56_tb     <= X"FFFFFFFF";     
                dataIn57_tb     <= X"FFFFFFFF";     
                dataIn58_tb     <= X"FFFFFFFF";            
                dataIn59_tb     <= X"FFFFFFFF";            
                dataIn60_tb     <= X"FFFFFFFF";            
                dataIn61_tb     <= X"FFFFFFFF";            
                dataIn62_tb     <= X"FFFFFFFF";            
                dataIn63_tb     <= X"FFFFFFFF";  
                reset_tb <= '0';
                wait for 6000us;
                reset_tb <= '1';
                wait for 250us;
                sel_tb             <= "001";
                dataIn0_tb      <= X"00000035";
                dataIn1_tb      <= X"FFFFFF65";
                dataIn2_tb      <= X"FFFFFF51";
                dataIn3_tb      <= X"FFFFFF32";
                dataIn4_tb      <= X"FFFFFF24";
                dataIn5_tb      <= X"00000069";
                dataIn6_tb      <= X"00000096";
                dataIn7_tb      <= X"00000012";
                dataIn8_tb      <= X"00000038";     
                dataIn9_tb      <= X"FFFFFF68";     
                dataIn10_tb     <= X"FFFFFF58";            
                dataIn11_tb     <= X"FFFFFF38";            
                dataIn12_tb     <= X"FFFFFF28";            
                dataIn13_tb     <= X"00000068";            
                dataIn14_tb     <= X"00000098";            
                dataIn15_tb     <= X"00000018";  
                dataIn16_tb     <= X"00000031";
                dataIn17_tb     <= X"FFFFFF61";
                dataIn18_tb     <= X"FFFFFF51";
                dataIn19_tb     <= X"FFFFFF32";
                dataIn20_tb     <= X"FFFFFF21";
                dataIn21_tb     <= X"00000069";
                dataIn22_tb     <= X"00000091";
                dataIn23_tb     <= X"00000011";
                dataIn24_tb     <= X"00000037";     
                dataIn25_tb     <= X"FFFFFF67";     
                dataIn26_tb     <= X"FFFFFF53";            
                dataIn27_tb     <= X"FFFFFF37";            
                dataIn28_tb     <= X"FFFFFF27";            
                dataIn29_tb     <= X"00000067";            
                dataIn30_tb     <= X"00000095";            
                dataIn31_tb     <= X"00000017";  
                dataIn32_tb     <= X"00000035";
                dataIn33_tb     <= X"FFFFFF65";
                dataIn34_tb     <= X"FFFFFF51";
                dataIn35_tb     <= X"FFFFFF32";
                dataIn36_tb     <= X"FFFFFF24";
                dataIn37_tb     <= X"00000069";
                dataIn38_tb     <= X"00000096";
                dataIn39_tb     <= X"00000012";
                dataIn40_tb     <= X"00000038";     
                dataIn41_tb     <= X"FFFFFF65";     
                dataIn42_tb     <= X"FFFFFF55";            
                dataIn43_tb     <= X"FFFFFF35";            
                dataIn44_tb     <= X"FFFFFF28";            
                dataIn45_tb     <= X"00000064";            
                dataIn46_tb     <= X"00000094";            
                dataIn47_tb     <= X"00000014";  
                dataIn48_tb     <= X"00000034";
                dataIn49_tb     <= X"FFFFFF62";
                dataIn50_tb     <= X"FFFFFF52";
                dataIn51_tb     <= X"FFFFFF32";
                dataIn52_tb     <= X"FFFFFF27";
                dataIn53_tb     <= X"00000061";
                dataIn54_tb     <= X"00000090";
                dataIn55_tb     <= X"00000012";
                dataIn56_tb     <= X"00000037";     
                dataIn57_tb     <= X"FFFFFF68";     
                dataIn58_tb     <= X"FFFFFF54";            
                dataIn59_tb     <= X"FFFFFF12";            
                dataIn60_tb     <= X"FFFFFF22";            
                dataIn61_tb     <= X"00000066";            
                dataIn62_tb     <= X"00000095";            
                dataIn63_tb     <= X"00000014";  
                reset_tb <= '0';
                wait for 6000us;
            end process;
end Behavioral;
