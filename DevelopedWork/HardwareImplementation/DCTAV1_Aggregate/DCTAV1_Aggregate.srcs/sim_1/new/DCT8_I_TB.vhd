----------------------------------------------------------------------------------
-- DCT8 Test Bench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DCT8_I_TB is
end DCT8_I_TB;

architecture Behavioral of DCT8_I_TB is
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
    
    signal reset_tb, en_tb, clock_tb, valoutstg1_tb, valoutdct4_tb, valoutdct8_tb, valout_tb : std_logic;
    signal dataIn0_tb, dataIn1_tb, dataIn2_tb, dataIn3_tb, dataIn4_tb, dataIn5_tb, dataIn6_tb, dataIn7_tb           :   integer := 0;
    signal dataOutStg10_tb, dataOutStg11_tb, dataOutStg12_tb, dataOutStg13_tb, dataOutStg14_tb, dataOutStg15_tb, dataOutStg16_tb, dataOutStg17_tb   :   integer := 0;
    signal dataOut0_tb, dataOut1_tb, dataOut2_tb, dataOut3_tb, dataOut4_tb, dataOut5_tb, dataOut6_tb, dataOut7_tb   :   integer := 0;
begin
    
    DCT81:  DCT8_1_I 
            PORT MAP(   dataIn0     =>  dataIn0_tb,
                        dataIn1     =>  dataIn1_tb,
                        dataIn2     =>  dataIn2_tb,
                        dataIn3     =>  dataIn3_tb,
                        dataIn4     =>  dataIn4_tb,
                        dataIn5     =>  dataIn5_tb,
                        dataIn6     =>  dataIn6_tb,
                        dataIn7     =>  dataIn7_tb,
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
                        validOut    =>  valoutstg1_tb
                    );
    DCT4:   DCT4_I
            PORT MAP(   dataIn0     =>  dataOutStg10_tb,
                        dataIn1     =>  dataOutStg11_tb,
                        dataIn2     =>  dataOutStg12_tb,
                        dataIn3     =>  dataOutStg13_tb,
                        res         =>  reset_tb,
                        en          =>  valoutstg1_tb,
                        clk         =>  clock_tb,
                        dataOut0    =>  dataOut0_tb,
                        dataOut1    =>  dataOut4_tb,
                        dataOut2    =>  dataOut2_tb,
                        dataOut3    =>  dataOut6_tb,
                        validOut    =>  valoutdct4_tb
            );

    DCT82:  DCT8_2_I 
            PORT MAP(   dataIn4     =>  dataOutStg14_tb,
                        dataIn5     =>  dataOutStg15_tb,
                        dataIn6     =>  dataOutStg16_tb,
                        dataIn7     =>  dataOutStg17_tb,
                        res         =>  reset_tb,
                        en          =>  valoutstg1_tb,
                        clk         =>  clock_tb,
                        dataOut4    =>  dataOut1_tb,
                        dataOut5    =>  dataOut5_tb,
                        dataOut6    =>  dataOut3_tb,
                        dataOut7    =>  dataOut7_tb,
                        validOut    =>  valoutdct8_tb
            );

    valout_tb <= valoutdct4_tb and valoutdct8_tb;

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
                dataIn0_tb <= 1;
                dataIn1_tb <= 1;
                dataIn2_tb <= 1;
                dataIn3_tb <= 1;
                dataIn4_tb <= 1;
                dataIn5_tb <= 1;
                dataIn6_tb <= 1;
                dataIn7_tb <= 1;
                reset_tb <= '0';
                wait for 1200us;
                reset_tb <= '1';
                wait for 200us;
                dataIn0_tb <= -1;
                dataIn1_tb <= -1;
                dataIn2_tb <= -1;
                dataIn3_tb <= -1;
                dataIn4_tb <= -1;
                dataIn5_tb <= -1;
                dataIn6_tb <= -1;
                dataIn7_tb <= -1;
                reset_tb <= '0';
                wait for 1200us;
                reset_tb <= '1';
                wait for 200us;
                dataIn0_tb <= 5;
                dataIn1_tb <= 21;
                dataIn2_tb <= 87;
                dataIn3_tb <= -68;
                dataIn4_tb <= -6;
                dataIn5_tb <= -78;
                dataIn6_tb <= 23;
                dataIn7_tb <= 54;
                reset_tb <= '0';
                wait for 1200us;
            end process;
                


end Behavioral;
