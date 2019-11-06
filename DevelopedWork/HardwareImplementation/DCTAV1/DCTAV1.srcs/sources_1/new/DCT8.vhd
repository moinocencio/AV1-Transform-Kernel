----------------------------------------------------------------------------------
-- DCT8 Implementation 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DCT8 is
    generic(K   : positive := 8);      -- Number of bits per pixel
    port(   -- Data Inputs
            dataIn0     : in    std_logic_vector((K+2) - 1 downto 0);
            dataIn1     : in    std_logic_vector((K+2) - 1 downto 0);
            dataIn2     : in    std_logic_vector((K+2) - 1 downto 0);
            dataIn3     : in    std_logic_vector((K+2) - 1 downto 0);
            dataIn4     : in    std_logic_vector((K+2) - 1 downto 0);
            dataIn5     : in    std_logic_vector((K+2) - 1 downto 0);
            dataIn6     : in    std_logic_vector((K+2) - 1 downto 0);
            dataIn7     : in    std_logic_vector((K+2) - 1 downto 0);            
            -- Control Inputs
            res         : in    std_logic;
            en          : in    std_logic;
            clk         : in    std_logic;
            -- Data Outputs
            dataOut0    : out    std_logic_vector((K+7) - 1 downto 0);
            dataOut1    : out    std_logic_vector((K+7) - 1 downto 0);
            dataOut2    : out    std_logic_vector((K+7) - 1 downto 0);
            dataOut3    : out    std_logic_vector((K+7) - 1 downto 0);
            dataOut4    : out    std_logic_vector((K+7) - 1 downto 0);
            dataOut5    : out    std_logic_vector((K+7) - 1 downto 0);
            dataOut6    : out    std_logic_vector((K+7) - 1 downto 0);
            dataOut7    : out    std_logic_vector((K+7) - 1 downto 0);
            -- Control Outputs
            validOut    : out   std_logic
    );
end DCT8;

architecture Behavioral of DCT8 is
    signal s_dataIn0, s_dataIn1, s_dataIn2, s_dataIn3, s_dataIn4, s_dataIn5, s_dataIn6, s_dataIn7           :   signed((K+2) - 1 downto 0) := (others => '0');
    signal s_stg10, s_stg11, s_stg12, s_stg13, s_stg14, s_stg15, s_stg16, s_stg17       :   signed((K+3) - 1 downto 0) := (others => '0');
    signal s_stg2M5, s_stg2M6       :   signed((K+14) - 1 downto 0) := (others => '0');
    signal s_stg2A5, s_stg2A6       :   signed((K+15) - 1 downto 0) := (others => '0');
    signal s_stg34, s_stg35, s_stg36, s_stg37       :   signed((K+3) - 1 downto 0) := (others => '0');
    signal s_stg4M41, s_stg4M42, s_stg4M51, s_stg4M52, s_stg4M61, s_stg4M62, s_stg4M71, s_stg4M72       signed((K+14) - 1 downto 0) := (others => '0');
    signal s_dataOut0, s_dataOut1, s_dataOut2, s_dataOut3, s_dataOut4, s_dataOut5, s_dataOut6, s_dataOut7       :   signed((K+15) - 1 downto 0) := (others => '0');
    signal s_stage1En, s_stage2MEn, s_stage2AEn, s_stage3En, s_stage4MEn, s_stage4AEn, s_valOutDCT4, s_valOut       :   std_logic := '0';

begin

    inSample:   process(clk, en, res)
                begin
                    if(en = '1') then
                        if(rising_edge(clk)) then
                            if(res = '1') then
                                s_dataIn0 <= (others => '0');
                                s_dataIn1 <= (others => '0');
                                s_dataIn2 <= (others => '0');
                                s_dataIn3 <= (others => '0');
                                s_dataIn4 <= (others => '0');
                                s_dataIn5 <= (others => '0');
                                s_dataIn6 <= (others => '0');
                                s_dataIn7 <= (others => '0');
                                s_stage1En <= '0';
                            else
                                s_dataIn0 <= signed(dataIn0);
                                s_dataIn1 <= signed(dataIn1);
                                s_dataIn2 <= signed(dataIn2);
                                s_dataIn3 <= signed(dataIn3);
                                s_dataIn4 <= signed(dataIn4);
                                s_dataIn5 <= signed(dataIn5);
                                s_dataIn6 <= signed(dataIn6);
                                s_dataIn7 <= signed(dataIn7);
                                s_stage1En <= '1';
                            end if;
                        end if;
                    else
                        s_stage1En <= '0';
                    end if;
                end process;    

    stage1:     process(clk, res, s_stage1En)
                begin
                    if(s_stage1En = '1') then
                        if(rising_edge(clk)) then
                            if(res = '1') then
                                s_stg10 <= (others => '0');
                                s_stg11 <= (others => '0');
                                s_stg12 <= (others => '0');
                                s_stg13 <= (others => '0');
                                s_stg14 <= (others => '0');
                                s_stg15 <= (others => '0');
                                s_stg16 <= (others => '0');
                                s_stg17 <= (others => '0');
                                s_stage2MEn <= '0';
                            else
                                s_stg10 <= (s_dataIn0((K+2) - 1) & s_dataIn0) + (s_dataIn7((K+2) - 1) & s_dataIn7);
                                s_stg11 <= (s_dataIn1((K+2) - 1) & s_dataIn1) + (s_dataIn6((K+2) - 1) & s_dataIn6);
                                s_stg12 <= (s_dataIn2((K+2) - 1) & s_dataIn2) + (s_dataIn5((K+2) - 1) & s_dataIn5);
                                s_stg13 <= (s_dataIn3((K+2) - 1) & s_dataIn3) + (s_dataIn4((K+2) - 1) & s_dataIn4);
                                s_stg14 <= (s_dataIn3((K+2) - 1) & s_dataIn3) - (s_dataIn4((K+2) - 1) & s_dataIn4);
                                s_stg15 <= (s_dataIn2((K+2) - 1) & s_dataIn2) - (s_dataIn5((K+2) - 1) & s_dataIn5);
                                s_stg16 <= (s_dataIn1((K+2) - 1) & s_dataIn1) - (s_dataIn6((K+2) - 1) & s_dataIn6);
                                s_stg17 <= (s_dataIn0((K+2) - 1) & s_dataIn0) - (s_dataIn7((K+2) - 1) & s_dataIn7);
                                s_stage2MEn <= '1';
                            end if;
                        end if;
                    else
                        s_stage2MEn <= '0';
                    end if;
                end process;

    DCT4:       entity work.DCT4(Behavioral)
                generic map()
                port map(   dataIn0     =>  s_stg10,
                            dataIn1     =>  s_stg11,
                            dataIn2     =>  s_stg12,
                            dataIn3     =>  s_stg13,
                            res         =>  res,
                            en          =>  s_stage2MEn,
                            clk         =>  clk,
                            dataOut0    =>  s_dataOut0,
                            dataOut1    =>  s_dataOut4,
                            dataOut2    =>  s_dataOut2,
                            dataOut3    =>  s_dataOut6,
                            validOut    =>  s_valOutDCT4
                        );

    stage2M:    process(clk, res, s_stage2MEn)
                begin
                    if(s_stage2MEn = '1') then
                        if(rising_edge(clk)) then
                            if(res = '1') then
                                s_stg2M5 <= (others => '0');
                                s_stg2M6 <= (others => '0');
                                s_stage2AEn <= '0';
                            else
                                s_stg2M5 <= s_stg2M5*185;
                                s_stg2M6 <= s_stg2M6*185;
                                s_stage2AEn <= '1';
                            end if;
                        end if;
                    else
                        s_stage2AEn <= '0';
                    end if;
                end process;

    stage2A:    process(clk, res, s_stage2AEn)
                begin
                    if(s_stage2AEn = '1') then
                        if(rising_edge(clk)) then
                            if(res = '1') then
                                s_stg2A5 <= (others => '0');
                                s_stg2A6 <= (others => '0');
                                s_stage3En <= '0';
                            else
                                s_stg2A5 <= (s_stg2M6((K+14) - 1) & s_stg2M6) - (s_stg2M5((K+14) - 1) & s_stg2M5);
                                s_stg2A6 <= (s_stg2M6((K+14) - 1) & s_stg2M6) + (s_stg2M5((K+14) - 1) & s_stg2M5);
                                s_stage3En <= '0';
                            end if;
                        end if;
                    else
                        s_stage3En <= '0';
                    end if;
                end process;
                
-------------------------------------
    stage3:     process(clk, res, s_stage3En)
                begin
                    if(s_stage3En = '1') then
                        if(rising_edge(clk)) then
                            if(res = '1') then                             
                                s_stg34 <= (others => '0');
                                s_stg35 <= (others => '0');
                                s_stg36 <= (others => '0');
                                s_stg37 <= (others => '0');
                            else
                                s_stg34 <= s_stg14 + s_stg2A5((K+15) - 1 downto 8)
                                s_stg35 <= 
                                s_stg36 <= 
                                s_stg37 <= 


    outReg:     process(clk, res, s_valOut)
                begin
                    if(s_valOut = '1') then
                        if(rising_edge(clk)) then
                            if(res = '1') then
                                dataOut0 <= (others => '0');
                                dataOut1 <= (others => '0');
                                dataOut2 <= (others => '0');
                                dataOut3 <= (others => '0');
                                validOut <= '0';
                            else
                                dataOut0 <= std_logic_vector(s_dataOut0((K+15) - 1 downto 8));
                                dataOut1 <= std_logic_vector(s_dataOut1((K+15) - 1 downto 8));
                                dataOut2 <= std_logic_vector(s_dataOut2((K+15) - 1 downto 8));
                                dataOut3 <= std_logic_vector(s_dataOut3((K+15) - 1 downto 8));
                                validOut <= '1';
                            end if;
                        end if;
                    end if;
                end process;
end Behavioral;
