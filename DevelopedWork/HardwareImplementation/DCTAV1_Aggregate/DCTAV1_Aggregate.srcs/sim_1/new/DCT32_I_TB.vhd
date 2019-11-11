----------------------------------------------------------------------------------
-- DCT832 Test Bench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DCT3232_TB is
end DCT3232_TB;

architecture Behavioral of DCT3232_TB is
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
    
    signal reset_tb, en_tb, clock_tb, valoutstg1_tb, valout8stg1_tb, valoutdct4_tb, valoutdct8_tb, valoutdct16_tb, valout_tb : std_logic;
    signal dataOutStg10_tb, dataOutStg11_tb, dataOutStg12_tb, dataOutStg13_tb, dataOutStg14_tb, dataOutStg15_tb, dataOutStg16_tb, dataOutStg17_tb, dataOutStg18_tb, dataOutStg19_tb, dataOutStg110_tb, dataOutStg111_tb, dataOutStg112_tb, dataOutStg113_tb, dataOutStg114_tb, dataOutStg115_tb, dataOutStg116_tb, dataOutStg117_tb, dataOutStg118_tb, dataOutStg119_tb, dataOutStg120_tb, dataOutStg121_tb, dataOutStg122_tb, dataOutStg123_tb, dataOutStg124_tb, dataOutStg125_tb, dataOutStg126_tb, dataOutStg127_tb, dataOutStg128_tb, dataOutStg129_tb, dataOutStg130_tb, dataOutStg131_tb     :   integer;
    signal dataOut8Stg10_tb, dataOut8Stg11_tb, dataOut8Stg12_tb, dataOut8Stg13_tb, dataOut8Stg14_tb, dataOut8Stg15_tb, dataOut8Stg16_tb, dataOut8Stg17_tb   : integer := 0;
    signal dataOut0_tb, dataOut1_tb, dataOut2_tb, dataOut3_tb, dataOut4_tb, dataOut5_tb, dataOut6_tb, dataOut7_tb, dataOut8_tb, dataOut9_tb, dataOut10_tb, dataOut11_tb, dataOut12_tb, dataOut13_tb, dataOut14_tb, dataOut15_tb           :   integer;

    
    signal reset_tb, en_tb, clock_tb, valout_tb : std_logic;
    signal dataIn0_tb, dataIn1_tb, dataIn2_tb, dataIn3_tb, dataIn4_tb, dataIn5_tb, dataIn6_tb, dataIn7_tb, dataIn8_tb, dataIn9_tb, dataIn10_tb, dataIn11_tb, dataIn12_tb, dataIn13_tb, dataIn14_tb, dataIn15_tb, dataIn16_tb, dataIn17_tb, dataIn18_tb, dataIn19_tb, dataIn20_tb, dataIn21_tb, dataIn22_tb, dataIn23_tb, dataIn24_tb, dataIn25_tb, dataIn26_tb, dataIn27_tb, dataIn28_tb, dataIn29_tb, dataIn30_tb, dataIn31_tb     :   integer;
    signal dataOut0_tb, dataOut1_tb, dataOut2_tb, dataOut3_tb, dataOut4_tb, dataOut5_tb, dataOut6_tb, dataOut7_tb, dataOut8_tb, dataOut9_tb, dataOut10_tb, dataOut11_tb, dataOut12_tb, dataOut13_tb, dataOut14_tb, dataOut15_tb, dataOut16_tb, dataOut17_tb, dataOut18_tb, dataOut19_tb, dataOut20_tb, dataOut21_tb, dataOut22_tb, dataOut23_tb, dataOut24_tb, dataOut25_tb, dataOut26_tb, dataOut27_tb, dataOut28_tb, dataOut29_tb, dataOut30_tb, dataOut31_tb     :   integer;
begin
    
    uut:    DCT3232 
            Generic Map (K => 32)
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
                        validOut    =>  valout_tb
                    );
    
    clk:    process	 		
            begin
                clock_tb <= '1';
                wait for 50us;
                clock_tb <= '0';
                wait for 50us;
            end process;
                    
    --res:    process
    --        begin
    --           reset_tb <= '0';       
    --           wait for 800us;               
    --           reset_tb <= '1';       
    --           wait for 200us;       
    --           reset_tb <= '0';   
    --           wait for 200us;          
    --        end process;
                   
    en:     process
            begin
                en_tb <= '1';       
                wait;
            end process;
                    
    dataIn: process
            begin
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
                reset_tb <= '0';
                wait for 2000us;
                reset_tb <= '1';
                wait for 200us;
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
                reset_tb <= '0';
                wait for 2000us;
                reset_tb <= '1';
                wait for 200us;
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
                reset_tb <= '0';
                wait for 2000us;
            end process;
end Behavioral;
