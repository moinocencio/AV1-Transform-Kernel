----------------------------------------------------------------------------------
-- DCT4 Test Bench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DCT4_TB is
end DCT4_TB;

architecture Behavioral of DCT4_TB is
    component DCT4 is
        generic(K   : positive := 8);
        port(   -- Data Inputs
                dataIn0     : in    std_logic_vector((K+2) - 1 downto 0);
                dataIn1     : in    std_logic_vector((K+2) - 1 downto 0);
                dataIn2     : in    std_logic_vector((K+2) - 1 downto 0);
                dataIn3     : in    std_logic_vector((K+2) - 1 downto 0);
                -- Control Inputs
                res         : in    std_logic;
                en          : in    std_logic;
                clk         : in    std_logic;
                -- Data Outputs
                dataOut0    : out    std_logic_vector((K+7) - 1 downto 0);
                dataOut1    : out    std_logic_vector((K+7) - 1 downto 0);
                dataOut2    : out    std_logic_vector((K+7) - 1 downto 0);
                dataOut3    : out    std_logic_vector((K+7) - 1 downto 0);
                -- Control Outputs
                validOut    : out   std_logic
        );
    end component;
    
    signal reset_tb, en_tb, clock_tb, valout_tb : std_logic;
    signal dataIn0_tb, dataIn1_tb, dataIn2_tb, dataIn3_tb       :   std_logic_vector(9 downto 0);
    signal dataOut0_tb, dataOut1_tb, dataOut2_tb, dataOut3_tb   :   std_logic_vector(14 downto 0);
begin
    
    uut:    DCT4 
            Generic Map (K => 8)
            PORT MAP(   dataIn0     =>  dataIn0_tb,
                        dataIn1     =>  dataIn1_tb,
                        dataIn2     =>  dataIn2_tb,
                        dataIn3     =>  dataIn3_tb,
                        res         =>  reset_tb,
                        en          =>  en_tb,
                        clk         =>  clock_tb,
                        dataOut0    =>  dataOut0_tb,
                        dataOut1    =>  dataOut1_tb,
                        dataOut2    =>  dataOut2_tb,
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
                    
    res:    process
            begin
               reset_tb <= '0';       
               wait;               
            end process;
                   
    en:     process
            begin
                en_tb <= '1';       
                wait;
            end process;
                    
    dataIn: process
            begin
                dataIn0_tb <= "1000000000";
                dataIn1_tb <= "0111111111";              
                dataIn2_tb <= "1000000000";              
                dataIn3_tb <= "0111111111";              
                wait;
            end process;
                


end Behavioral;
