----------------------------------------------------------------------------------
-- DCT832 Test Bench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DCT832_TB is
end DCT832_TB;

architecture Behavioral of DCT832_TB is
    component DCT832 is
        generic(K   : positive := 32);
        port(   -- Data Inputs
                dataIn0     : in    std_logic_vector(K - 1 downto 0);
                dataIn1     : in    std_logic_vector(K - 1 downto 0);
                dataIn2     : in    std_logic_vector(K - 1 downto 0);
                dataIn3     : in    std_logic_vector(K - 1 downto 0);
                dataIn4     : in    std_logic_vector(K - 1 downto 0);
                dataIn5     : in    std_logic_vector(K - 1 downto 0);
                dataIn6     : in    std_logic_vector(K - 1 downto 0);
                dataIn7     : in    std_logic_vector(K - 1 downto 0);
                -- Control Inputs
                res         : in    std_logic;
                en          : in    std_logic;
                clk         : in    std_logic;
                -- Data Outputs
                dataOut0    : out    std_logic_vector(K - 1 downto 0);
                dataOut1    : out    std_logic_vector(K - 1 downto 0);
                dataOut2    : out    std_logic_vector(K - 1 downto 0);
                dataOut3    : out    std_logic_vector(K - 1 downto 0);
                dataOut4    : out    std_logic_vector(K - 1 downto 0);
                dataOut5    : out    std_logic_vector(K - 1 downto 0);
                dataOut6    : out    std_logic_vector(K - 1 downto 0);
                dataOut7    : out    std_logic_vector(K - 1 downto 0);
                -- Control Outputs
                validOut    : out   std_logic
        );
    end component;
    
    signal reset_tb, en_tb, clock_tb, valout_tb : std_logic;
    signal dataIn0_tb, dataIn1_tb, dataIn2_tb, dataIn3_tb, dataIn4_tb, dataIn5_tb, dataIn6_tb, dataIn7_tb           :   std_logic_vector(31 downto 0);
    signal dataOut0_tb, dataOut1_tb, dataOut2_tb, dataOut3_tb, dataOut4_tb, dataOut5_tb, dataOut6_tb, dataOut7_tb   :   std_logic_vector(31 downto 0);
begin
    
    uut:    DCT832 
            Generic Map (K => 32)
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
                        dataOut0    =>  dataOut0_tb,
                        dataOut1    =>  dataOut1_tb,
                        dataOut2    =>  dataOut2_tb,
                        dataOut3    =>  dataOut3_tb,
                        dataOut4    =>  dataOut4_tb,
                        dataOut5    =>  dataOut5_tb,
                        dataOut6    =>  dataOut6_tb,
                        dataOut7    =>  dataOut7_tb,
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
                dataIn0_tb <= X"FFFFFFFF";
                dataIn1_tb <= X"FFFFFFFF";
                dataIn2_tb <= X"FFFFFFFF";
                dataIn3_tb <= X"FFFFFFFF";
                dataIn4_tb <= X"00000001";
                dataIn5_tb <= X"00000001";
                dataIn6_tb <= X"00000001";
                dataIn7_tb <= X"00000001";
                reset_tb <= '0';
                wait for 1200us;
                reset_tb <= '1';
                wait for 200us;
                dataIn0_tb <= X"FFFFFFFF";
                dataIn1_tb <= X"FFFFFFFF";
                dataIn2_tb <= X"FFFFFFFF";
                dataIn3_tb <= X"FFFFFFFF";
                dataIn4_tb <= X"FFFFFFFF";
                dataIn5_tb <= X"FFFFFFFF";
                dataIn6_tb <= X"FFFFFFFF";
                dataIn7_tb <= X"FFFFFFFF";
                reset_tb <= '0';
                wait for 1200us;
                reset_tb <= '1';
                wait for 200us;
                dataIn0_tb <= X"00000035";
                dataIn1_tb <= X"FFFFFF65";
                dataIn2_tb <= X"FFFFFF51";
                dataIn3_tb <= X"FFFFFF32";
                dataIn4_tb <= X"FFFFFF24";
                dataIn5_tb <= X"00000069";
                dataIn6_tb <= X"00000096";
                dataIn7_tb <= X"00000012";
                reset_tb <= '0';
                wait for 1200us;
            end process;
                


end Behavioral;
