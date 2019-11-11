----------------------------------------------------------------------------------
-- DCT16 Test Bench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DCT16_I_TB is
end DCT16_I_TB;

architecture Behavioral of DCT16_I_TB is
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
    signal dataIn0_tb, dataIn1_tb, dataIn2_tb, dataIn3_tb, dataIn4_tb, dataIn5_tb, dataIn6_tb, dataIn7_tb, dataIn8_tb, dataIn9_tb, dataIn10_tb, dataIn11_tb, dataIn12_tb, dataIn13_tb, dataIn14_tb, dataIn15_tb           :   integer;
    signal dataOutStg10_tb, dataOutStg11_tb, dataOutStg12_tb, dataOutStg13_tb, dataOutStg14_tb, dataOutStg15_tb, dataOutStg16_tb, dataOutStg17_tb, dataOutStg18_tb, dataOutStg19_tb, dataOutStg110_tb, dataOutStg111_tb, dataOutStg112_tb, dataOutStg113_tb, dataOutStg114_tb, dataOutStg115_tb           :   integer;
    signal dataOut8Stg10_tb, dataOut8Stg11_tb, dataOut8Stg12_tb, dataOut8Stg13_tb, dataOut8Stg14_tb, dataOut8Stg15_tb, dataOut8Stg16_tb, dataOut8Stg17_tb   : integer := 0;
    signal dataOut0_tb, dataOut1_tb, dataOut2_tb, dataOut3_tb, dataOut4_tb, dataOut5_tb, dataOut6_tb, dataOut7_tb, dataOut8_tb, dataOut9_tb, dataOut10_tb, dataOut11_tb, dataOut12_tb, dataOut13_tb, dataOut14_tb, dataOut15_tb           :   integer;
begin
    
    DCT161: DCT16_1_I 
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
                        res         =>  reset_tb,
                        en          =>  en_tb,
                        clk         =>  clock_tb,
                        dataOut0    =>  dataOutStg10_tb,
                        dataOut1    =>  dataOutStg11_tb,
                        dataOut2    =>  dataOutStg12_tb,
                        dataOut3    =>  dataOutStg13_tb,
                        dataOut4    =>  dataOutStg14_tb,
                        dataOut5    =>  dataOutStg15_tb,
                        dataOut6    =>  dataOutStg16_tb,
                        dataOut7    =>  dataOutStg17_tb,
                        dataOut8    =>  dataOutStg18_tb,
                        dataOut9    =>  dataOutStg19_tb,
                        dataOut10   =>  dataOutStg110_tb,
                        dataOut11   =>  dataOutStg111_tb,
                        dataOut12   =>  dataOutStg112_tb,
                        dataOut13   =>  dataOutStg113_tb,
                        dataOut14   =>  dataOutStg114_tb,
                        dataOut15   =>  dataOutStg115_tb,
                        validOut    =>  valoutstg1_tb
                    );

    DCT81:  DCT8_1_I 
            PORT MAP(   dataIn0     =>  dataOutStg10_tb,
                        dataIn1     =>  dataOutStg11_tb,
                        dataIn2     =>  dataOutStg12_tb,
                        dataIn3     =>  dataOutStg13_tb,
                        dataIn4     =>  dataOutStg14_tb,
                        dataIn5     =>  dataOutStg15_tb,
                        dataIn6     =>  dataOutStg16_tb,
                        dataIn7     =>  dataOutStg17_tb,
                        res         =>  reset_tb,
                        en          =>  valoutstg1_tb,
                        clk         =>  clock_tb,
                        dataOut0    =>  dataOut8Stg10_tb,
                        dataOut1    =>  dataOut8Stg11_tb,
                        dataOut2    =>  dataOut8Stg12_tb,
                        dataOut3    =>  dataOut8Stg13_tb,
                        dataOut4    =>  dataOut8Stg14_tb,
                        dataOut5    =>  dataOut8Stg15_tb,
                        dataOut6    =>  dataOut8Stg16_tb,
                        dataOut7    =>  dataOut8Stg17_tb,
                        validOut    =>  valout8stg1_tb
            );

    DCT4:   DCT4_I
            PORT MAP(   dataIn0     =>  dataOut8Stg10_tb,
                        dataIn1     =>  dataOut8Stg11_tb,
                        dataIn2     =>  dataOut8Stg12_tb,
                        dataIn3     =>  dataOut8Stg13_tb,
                        res         =>  reset_tb,
                        en          =>  valout8stg1_tb,
                        clk         =>  clock_tb,
                        dataOut0    =>  dataOut0_tb,
                        dataOut1    =>  dataOut8_tb,
                        dataOut2    =>  dataOut4_tb,
                        dataOut3    =>  dataOut12_tb,
                        validOut    =>  valoutdct4_tb
            );

    DCT82:  DCT8_2_I 
            PORT MAP(   dataIn4     =>  dataOut8Stg14_tb,
                        dataIn5     =>  dataOut8Stg15_tb,
                        dataIn6     =>  dataOut8Stg16_tb,
                        dataIn7     =>  dataOut8Stg17_tb,
                        res         =>  reset_tb,
                        en          =>  valout8stg1_tb,
                        clk         =>  clock_tb,
                        dataOut4    =>  dataOut2_tb,
                        dataOut5    =>  dataOut10_tb,
                        dataOut6    =>  dataOut6_tb,
                        dataOut7    =>  dataOut14_tb,
                        validOut    =>  valoutdct8_tb
            );

    DCT162: DCT16_2_I 
            PORT MAP(   dataIn8     =>  dataOutStg18_tb,
                        dataIn9     =>  dataOutStg19_tb,
                        dataIn10    =>  dataOutStg110_tb,
                        dataIn11    =>  dataOutStg111_tb,
                        dataIn12    =>  dataOutStg112_tb,
                        dataIn13    =>  dataOutStg113_tb,
                        dataIn14    =>  dataOutStg114_tb,
                        dataIn15    =>  dataOutStg115_tb,
                        res         =>  reset_tb,
                        en          =>  valoutstg1_tb,
                        clk         =>  clock_tb,
                        dataOut8    =>  dataOut1_tb,
                        dataOut9    =>  dataOut9_tb,
                        dataOut10   =>  dataOut5_tb,
                        dataOut11   =>  dataOut13_tb,
                        dataOut12   =>  dataOut3_tb,
                        dataOut13   =>  dataOut11_tb,
                        dataOut14   =>  dataOut7_tb,
                        dataOut15   =>  dataOut15_tb,
                        validOut    =>  valoutdct16_tb
                    );

    valout_tb <= valoutdct4_tb and valoutdct16_tb and valoutdct8_tb;

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
                reset_tb <= '0';
                wait for 2000us;
            end process;
end Behavioral;
