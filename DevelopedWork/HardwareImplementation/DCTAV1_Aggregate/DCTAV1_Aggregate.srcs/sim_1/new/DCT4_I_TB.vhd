----------------------------------------------------------------------------------
-- DCT432 Test Bench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DCT4_I_TB is
end DCT4_I_TB;

architecture Behavioral of DCT4_I_TB is
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
    
    signal reset_tb, en_tb, clock_tb, valout_tb : std_logic;
    signal dataIn0_tb, dataIn1_tb, dataIn2_tb, dataIn3_tb       :   integer;
    signal dataOut0_tb, dataOut1_tb, dataOut2_tb, dataOut3_tb   :   integer;
begin
    
    uut:    DCT4_I 
            PORT MAP(   dataIn0     =>  dataIn0_tb,
                        dataIn1     =>  dataIn1_tb,
                        dataIn2     =>  dataIn2_tb,
                        dataIn3     =>  dataIn3_tb,
                        res         =>  reset_tb,
                        en          =>  en_tb,
                        clk         =>  clock_tb,
                        dataOut0    =>  dataOut0_tb,
                        dataOut1    =>  dataOut2_tb,
                        dataOut2    =>  dataOut1_tb,
                        dataOut3    =>  dataOut3_tb,
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
                dataIn0_tb <= 1;
                dataIn1_tb <= 1;
                dataIn2_tb <= 1;
                dataIn3_tb <= 1;
                reset_tb <= '0';
                wait for 1200us;
                reset_tb <= '1';
                wait for 200us;
                dataIn0_tb <= -1;
                dataIn1_tb <= -1;
                dataIn2_tb <= -1;
                dataIn3_tb <= -1;
                reset_tb <= '0';
                wait for 1200us;
                reset_tb <= '1';
                wait for 200us;
                dataIn0_tb <= 3;
                dataIn1_tb <= 60;
                dataIn2_tb <= -52;
                dataIn3_tb <= -10;
                reset_tb <= '0';
                wait for 1200us;
            end process;
                


end Behavioral;
