----------------------------------------------------------------------------------
-- DCT4 Implementation for inetgration with aggregated architecture
--
-- Input and Output Integers
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DCT4_I is
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
end DCT4_I;

architecture Behavioral of DCT4_I is
    signal s_stg10, s_stg11, s_stg12, s_stg13       :   integer := 0;
    signal s_stg2M0, s_stg2M1, s_stg2M21, s_stg2M22, s_stg2M31, s_stg2M32       :   integer := 0;
    signal s_stg2A0, s_stg2A1, s_stg2A2, s_stg2A3       :   integer := 0;
    signal s_stage2MEn, s_stage2AEn, s_outCastEn, s_valOut       :   std_logic := '0';
begin

    stage1:     process(clk, res, en)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg10 <= 0;
                            s_stg11 <= 0;
                            s_stg12 <= 0;
                            s_stg13 <= 0;
                            s_stage2MEn <= '0';
                        elsif(en = '1') then
                            s_stg10 <= dataIn0 + dataIn3;
                            s_stg11 <= dataIn1 + dataIn2;
                            s_stg12 <= dataIn1 - dataIn2;
                            s_stg13 <= dataIn0 - dataIn3;
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
                            s_valOut <= '0';
                        elsif(s_stage2AEn = '1') then
                            s_stg2A0 <= s_stg2M0 + s_stg2M1;
                            s_stg2A1 <= s_stg2M0 - s_stg2M1;
                            s_stg2A2 <= s_stg2M21 + s_stg2M32;
                            s_stg2A3 <= s_stg2M31 - s_stg2M22;
                            s_valOut <= '1';
                        end if;
                    end if;
                end process;

    outReg:     process(clk, res, s_valOut)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            dataOut0 <= 0;
                            dataOut1 <= 0;
                            dataOut2 <= 0;
                            dataOut3 <= 0;
                            validOut <= '0';
                        elsif(s_valOut = '1') then
                            dataOut0 <= to_integer(shift_right(to_signed(s_stg2A0,32),8));
                            dataOut1 <= to_integer(shift_right(to_signed(s_stg2A1,32),8));
                            dataOut2 <= to_integer(shift_right(to_signed(s_stg2A2,32),8));
                            dataOut3 <= to_integer(shift_right(to_signed(s_stg2A3,32),8));
                            validOut <= '1';
                        end if;
                    end if;
                end process;
end Behavioral;