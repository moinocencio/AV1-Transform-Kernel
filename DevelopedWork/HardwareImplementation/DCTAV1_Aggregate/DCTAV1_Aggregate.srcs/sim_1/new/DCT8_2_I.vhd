----------------------------------------------------------------------------------
-- DCT8 Implementation for inetgration with aggregated architecture
--
-- Input and Output Integers
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DCT8_2_I is
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
end DCT8_2_I;

architecture Behavioral of DCT8_2_I is
    signal s_stg2M5, s_stg2M6       :   integer := 0;
    signal s_stg2A5, s_stg2A6       :   integer := 0;
    signal s_stg2D5, s_stg2D6       :   integer := 0;
    signal s_stg34, s_stg35, s_stg36, s_stg37       :   integer := 0;
    signal s_stg4M41, s_stg4M42, s_stg4M51, s_stg4M52, s_stg4M61, s_stg4M62, s_stg4M71, s_stg4M72       :   integer := 0;
    signal s_stg4A4, s_stg4A5, s_stg4A6, s_stg4A7       :   integer := 0;
    signal s_stage2MEn, s_stage2AEn, s_stage2DEn, s_stage3En, s_stage4MEn, s_stage4AEn, s_end8       :   std_logic := '0';
begin
    
    stage2M:    process(clk, res, en)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg2M5 <= 0;
                            s_stg2M6 <= 0;
                            s_stage2AEn <= '0';
                        elsif(en = '1') then
                            s_stg2M5 <= dataIn5*185;
                            s_stg2M6 <= dataIn6*185;
                            s_stage2AEn <= '1';
                        end if;
                    end if;
                end process;

    stage2A:    process(clk, res, s_stage2AEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg2A5 <= 0;
                            s_stg2A6 <= 0;
                            s_stage2DEn <= '0';
                        elsif(s_stage2AEn = '1') then
                            s_stg2A5 <= s_stg2M6 - s_stg2M5;
                            s_stg2A6 <= s_stg2M6 + s_stg2M5;
                            s_stage2DEn <= '1';
                        end if;
                    end if;
                end process;

    stage2D:    process(clk, res, s_stage2DEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg2D5 <= 0;
                            s_stg2D6 <= 0;
                            s_stage3En <= '0';
                        elsif(s_stage2DEn = '1') then
                            s_stg2D5 <= to_integer(shift_right(to_signed(s_stg2A5,32),8));
                            s_stg2D6 <= to_integer(shift_right(to_signed(s_stg2A6,32),8));
                            s_stage3En <= '1';
                        end if;
                    end if;
                end process;                

    stage3:     process(clk, res, s_stage3En)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg34 <= 0;
                            s_stg35 <= 0;
                            s_stg36 <= 0;
                            s_stg37 <= 0;
                            s_stage4MEn <= '0';
                        elsif(s_stage3En = '1') then
                            s_stg34 <= dataIn4 + s_stg2D5;
                            s_stg35 <= dataIn4 - s_stg2D5;
                            s_stg36 <= dataIn7 - s_stg2D6;
                            s_stg37 <= dataIn7 + s_stg2D6;
                            s_stage4MEn <= '1';
                        end if;
                    end if;
                end process;

    stage4M:    process(clk, res, s_stage4MEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg4M41 <= 0;
                            s_stg4M42 <= 0;
                            s_stg4M51 <= 0;
                            s_stg4M52 <= 0;
                            s_stg4M61 <= 0;
                            s_stg4M62 <= 0;
                            s_stg4M71 <= 0;
                            s_stg4M72 <= 0;
                            s_stage4AEn <= '0';
                        elsif(s_stage4MEn = '1') then
                            s_stg4M41 <= s_stg34*56;
                            s_stg4M42 <= s_stg34*252;
                            s_stg4M51 <= s_stg35*147;
                            s_stg4M52 <= s_stg35*216;
                            s_stg4M61 <= s_stg36*147;
                            s_stg4M62 <= s_stg36*216;
                            s_stg4M71 <= s_stg37*56;
                            s_stg4M72 <= s_stg37*252;
                            s_stage4AEn <= '1';
                        end if;
                    end if;
                end process;

    stage4A:    process(clk, res, s_stage4AEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg4A4 <= 0;
                            s_stg4A5 <= 0;
                            s_stg4A6 <= 0;
                            s_stg4A7 <= 0;
                            s_end8 <= '0';
                        elsif(s_stage4AEn = '1') then
                            s_stg4A4 <= s_stg4M41 + s_stg4M72;
                            s_stg4A5 <= s_stg4M52 + s_stg4M61;
                            s_stg4A6 <= s_stg4M62 - s_stg4M51;
                            s_stg4A7 <= s_stg4M71 - s_stg4M42;
                            s_end8 <= '1';
                        end if;
                    end if;
                end process;
                
    outReg:     process(clk, res, s_end8)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            dataOut5 <= 0;
                            dataOut6 <= 0;
                            dataOut7 <= 0;
                            validOut <= '0';
                        elsif(s_end8 = '1') then
                            dataOut4 <= to_integer(shift_right(to_signed(s_stg4A4,32),8));
                            dataOut5 <= to_integer(shift_right(to_signed(s_stg4A5,32),8));
                            dataOut6 <= to_integer(shift_right(to_signed(s_stg4A6,32),8));
                            dataOut7 <= to_integer(shift_right(to_signed(s_stg4A7,32),8));
                            validOut <= '1';
                        end if;
                    end if;
                end process;
end Behavioral;