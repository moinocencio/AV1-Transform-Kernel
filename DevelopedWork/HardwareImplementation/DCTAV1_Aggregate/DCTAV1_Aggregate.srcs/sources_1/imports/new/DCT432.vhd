----------------------------------------------------------------------------------
-- DCT4 Implementation, with same # bits in input and output and internal integer
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DCT432 is
    generic(K   : positive := 32);      -- Number of bits per pixel
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
end DCT432;

architecture Behavioral of DCT432 is
    signal s_dataIn0, s_dataIn1, s_dataIn2, s_dataIn3           :   integer := 0;
    signal s_stg10, s_stg11, s_stg12, s_stg13       :   integer := 0;
    signal s_stg2M0, s_stg2M1, s_stg2M21, s_stg2M22, s_stg2M31, s_stg2M32       :   integer := 0;
    signal s_stg2A0, s_stg2A1, s_stg2A2, s_stg2A3       :   integer := 0;
    signal s_dataOut0, s_dataOut1, s_dataOut2, s_dataOut3       :   signed(K-1 downto 0) := (others => '0');
    signal s_stage1En, s_stage2MEn, s_stage2AEn, s_outCastEn, s_valOut       :   std_logic := '0';
begin

    inSample:   process(clk, en, res)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_dataIn0 <= 0;
                            s_dataIn1 <= 0;
                            s_dataIn2 <= 0;
                            s_dataIn3 <= 0;
                            s_stage1En <= '0';
                        elsif(en = '1') then
                            s_dataIn0 <= to_integer(signed(dataIn0));
                            s_dataIn1 <= to_integer(signed(dataIn1));
                            s_dataIn2 <= to_integer(signed(dataIn2));
                            s_dataIn3 <= to_integer(signed(dataIn3));
                            s_stage1En <= '1';
                        end if;
                    end if;
                end process;    

    stage1:     process(clk, res, s_stage1En)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg10 <= 0;
                            s_stg11 <= 0;
                            s_stg12 <= 0;
                            s_stg13 <= 0;
                            s_stage2MEn <= '0';
                        elsif(s_stage1En = '1') then
                            s_stg10 <= s_dataIn0 + s_dataIn3;
                            s_stg11 <= s_dataIn1 + s_dataIn2;
                            s_stg12 <= s_dataIn1 - s_dataIn2;
                            s_stg13 <= s_dataIn0 - s_dataIn3;
                            s_stage2MEn <= '1';
                        end if;
                    end if;
                end process;

    stage2M:    process(clk, res, s_stage2MEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg2M0 <= 0;
                            s_stg2M1 <= 0;
                            s_stg2M21 <= 0;
                            s_stg2M22 <= 0;
                            s_stg2M31 <= 0;
                            s_stg2M32 <= 0;
                            s_stage2AEn <= '0';
                        elsif(s_stage2MEn = '1') then
                            s_stg2M0 <= s_stg10*185;
                            s_stg2M1 <= s_stg11*185;
                            s_stg2M21 <= s_stg12*104;
                            s_stg2M22 <= s_stg12*239;
                            s_stg2M31 <= s_stg13*104;
                            s_stg2M32 <= s_stg13*239;
                            s_stage2AEn <= '1';
                        end if;
                    end if;
                end process;

    stage2A:    process(clk, res, s_stage2AEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg2A0 <= 0;
                            s_stg2A1 <= 0;
                            s_stg2A2 <= 0;
                            s_stg2A3 <= 0;
                            --s_outCastEn <= '0';
                            s_valOut <= '0';
                        elsif(s_stage2AEn = '1') then
                            s_stg2A0 <= s_stg2M0 + s_stg2M1;
                            s_stg2A1 <= s_stg2M21 + s_stg2M32;
                            s_stg2A2 <= s_stg2M0 - s_stg2M1;
                            s_stg2A3 <= s_stg2M31 - s_stg2M22;
                            --s_outCastEn <= '1';
                            s_valOut <= '1';
                        end if;
                    end if;
                end process;

    --outCast:    process(clk, res, s_outCastEn)
    --            begin
    --                if(rising_edge(clk)) then
    --                    if(res = '1') then
    --                        s_dataOut0 <= (others => '0');
    --                        s_dataOut1 <= (others => '0');
    --                        s_dataOut2 <= (others => '0');
    --                        s_dataOut3 <= (others => '0');
    --                        s_valOut <= '0';
    --                    elsif(s_outCastEn = '1') then
    --                        s_dataOut0 <= to_signed(s_stg2A0,K);
    --                        s_dataOut1 <= to_signed(s_stg2A2,K);
    --                        s_dataOut2 <= to_signed(s_stg2A1,K);
    --                        s_dataOut3 <= to_signed(s_stg2A3,K);
    --                        s_valOut <= '1';
    --                    end if;
    --                end if;
    --            end process;

    outReg:     process(clk, res, s_valOut)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            dataOut0 <= (others => '0');
                            dataOut1 <= (others => '0');
                            dataOut2 <= (others => '0');
                            dataOut3 <= (others => '0');
                            validOut <= '0';
                        elsif(s_valOut = '1') then
                            --dataOut0 <= std_logic_vector(shift_right(s_dataOut0, 8));
                            dataOut0 <= std_logic_vector(shift_right(to_signed(s_stg2A0,K), 8));
                            --dataOut1 <= std_logic_vector(shift_right(s_dataOut1, 8));
                            dataOut1 <= std_logic_vector(shift_right(to_signed(s_stg2A2,K), 8));
                            --dataOut2 <= std_logic_vector(shift_right(s_dataOut2, 8));
                            dataOut2 <= std_logic_vector(shift_right(to_signed(s_stg2A1,K), 8));
                            --dataOut3 <= std_logic_vector(shift_right(s_dataOut3, 8));
                            dataOut3 <= std_logic_vector(shift_right(to_signed(s_stg2A3,K), 8));
                            validOut <= '1';
                        end if;
                    end if;
                end process;
end Behavioral;