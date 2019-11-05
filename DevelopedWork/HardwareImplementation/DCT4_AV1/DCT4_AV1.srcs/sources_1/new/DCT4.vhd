----------------------------------------------------------------------------------
-- DCT4 Implementation 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DCT4 is
    generic(K   : positive := 8);
    port(   -- Data Inputs
            dataIn0     : in    std_logic_vector(K - 1 downto 0);
            dataIn1     : in    std_logic_vector(K - 1 downto 0);
            dataIn2     : in    std_logic_vector(K - 1 downto 0);
            dataIn3     : in    std_logic_vector(K - 1 downto 0);
            -- Control Inputs
            res         : in    std_logic;
            en          : in    std_logic;
            clk         : in    std_logic;
            -- Data Outputs
            dataOut0    : out    std_logic_vector(K - 1 downto 0);
            dataOut1    : out    std_logic_vector(K - 1 downto 0);
            dataOut2    : out    std_logic_vector(K - 1 downto 0);
            dataOut3    : out    std_logic_vector(K - 1 downto 0);
            -- Control Outputs
            validOut    : out   std_logic
    );
end DCT4;

architecture Behavioral of DCT4 is
    signal s_dataIn0, s_dataIn1, s_dataIn2, s_dataIn3, s_stg1Out0, s_stg1Out1, s_stg1Out2, s_stg1Out3       :   signed(K downto 0) := (others => '0');
    signal s_stg2M0, s_stg2M1, s_stg2M21, s_stg2M22, s_stg2M31, s_stg2M32, s_dataOut0, s_dataOut1, s_dataOut2, s_dataOut3       :   signed(2*K downto 0) := (others => '0');
    signal s_stage1En, s_stage2MEn, s_stage2AEn, s_valOut       :   std_logic := '0';

    constant cos16 : signed(K downto 0) := "011101101";
    constant cos32 : signed(K downto 0) := "010110101";
    constant cos48 : signed(K downto 0) := "001100010";
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
                                s_stage1En <= '0';
                            else
                                s_dataIn0 <= signed(dataIn0);
                                s_dataIn1 <= signed(dataIn1);
                                s_dataIn2 <= signed(dataIn2);
                                s_dataIn3 <= signed(dataIn3);
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
                                s_stg1Out0 <= (others => '0');
                                s_stg1Out1 <= (others => '0');
                                s_stg1Out2 <= (others => '0');
                                s_stg1Out3 <= (others => '0');
                                s_stage2MEn <= '0';
                            else
                                s_stg1Out0 <= s_dataIn0 + s_dataIn3;
                                s_stg1Out1 <= s_dataIn1 + s_dataIn2;
                                s_stg1Out2 <= s_dataIn1 - s_dataIn2;
                                s_stg1Out3 <= s_dataIn0 - s_dataIn3;
                                s_stage2MEn <= '1';
                            end if;
                        end if;
                    else
                        s_stage2MEn <= '0';
                    end if;
                end process;

    stage2M:    process(clk, res, s_stage2MEn)
                begin
                    if(s_stage2MEn = '1') then
                        if(rising_edge(clk)) then
                            if(res = '1') then
                                s_stg2M0 <= (others => '0');
                                s_stg2M1 <= (others => '0');
                                s_stg2M21 <= (others => '0');
                                s_stg2M22 <= (others => '0');
                                s_stg2M31 <= (others => '0');
                                s_stg2M32 <= (others => '0');
                                s_stage2AEn <= '0';
                            else
                                s_stg2M0 <= s_stg1Out0*cos32;
                                s_stg2M1 <= s_stg1Out1*cos32;
                                s_stg2M21 <= s_stg1Out2*cos48;
                                s_stg2M22 <= s_stg1Out2*cos16;
                                s_stg2M31 <= s_stg1Out3*cos48;
                                s_stg2M32 <= s_stg1Out3*cos16;
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
                                s_dataOut0 <= (others => '0');
                                s_dataOut1 <= (others => '0');
                                s_dataOut2 <= (others => '0');
                                s_dataOut3 <= (others => '0');
                                s_valOut <= '0';
                            else
                                s_dataOut0 <= s_stg2M0 + s_stg2M1;
                                s_dataOut1 <= s_stg2M21 + s_stg2M32;
                                s_dataOut2 <= s_stg2M0 - s_stg2M1;
                                s_dataOut3 <= s_stg2M31 - s_stg2M22;
                                s_valOut <= '1';
                            end if;
                        end if;
                    else
                        s_valOut <= '0';
                    end if;
                end process;

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
                                dataOut0 <= std_logic_vector(s_dataOut0(15 downto 8));
                                dataOut1 <= std_logic_vector(s_dataOut1(15 downto 8));
                                dataOut2 <= std_logic_vector(s_dataOut2(15 downto 8));
                                dataOut3 <= std_logic_vector(s_dataOut3(15 downto 8));
                                validOut <= '1';
                            end if;
                        end if;
                    end if;
                end process;
end Behavioral;
