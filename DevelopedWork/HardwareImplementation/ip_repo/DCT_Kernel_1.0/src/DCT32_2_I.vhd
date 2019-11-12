----------------------------------------------------------------------------------
-- DCT32 Implementation, with same # bits in input and output and internal integer
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DCT32_2_I is
    port(   -- Data Inputs
            dataIn16     : in    integer;
            dataIn17     : in    integer;
            dataIn18     : in    integer;
            dataIn19     : in    integer;
            dataIn20     : in    integer;
            dataIn21     : in    integer;
            dataIn22     : in    integer;
            dataIn23     : in    integer;
            dataIn24     : in    integer;
            dataIn25     : in    integer;
            dataIn26     : in    integer;
            dataIn27     : in    integer;
            dataIn28     : in    integer;
            dataIn29     : in    integer;
            dataIn30     : in    integer;
            dataIn31     : in    integer;
            -- Control Inputs
            res         : in    std_logic;
            en          : in    std_logic;
            clk         : in    std_logic;
            -- Data Outputs
            dataOut16     : out    integer;
            dataOut17     : out    integer;
            dataOut18     : out    integer;
            dataOut19     : out    integer;
            dataOut20     : out    integer;
            dataOut21     : out    integer;
            dataOut22     : out    integer;
            dataOut23     : out    integer;
            dataOut24     : out    integer;
            dataOut25     : out    integer;
            dataOut26     : out    integer;
            dataOut27     : out    integer;
            dataOut28     : out    integer;
            dataOut29     : out    integer;
            dataOut30     : out    integer;
            dataOut31     : out    integer;
            -- Control Outputs
            validOut    : out   std_logic
    );
end DCT32_2_I;

architecture Behavioral of DCT32_2_I is
    signal s_stg2M20, s_stg2M21, s_stg2M22, s_stg2M23, s_stg2M24, s_stg2M25, s_stg2M26, s_stg2M27       :   integer     := 0;
    signal s_stg2A20, s_stg2A21, s_stg2A22, s_stg2A23, s_stg2A24, s_stg2A25, s_stg2A26, s_stg2A27       :   integer     := 0;
    signal s_stg2D20, s_stg2D21, s_stg2D22, s_stg2D23, s_stg2D24, s_stg2D25, s_stg2D26, s_stg2D27       :   integer     := 0;
    signal s_stg316, s_stg317, s_stg318, s_stg319, s_stg320, s_stg321, s_stg322, s_stg323, s_stg324, s_stg325, s_stg326, s_stg327, s_stg328, s_stg329, s_stg330, s_stg331       :   integer     := 0;
    signal s_stg4M181, s_stg4M182, s_stg4M191, s_stg4M192, s_stg4M201, s_stg4M202, s_stg4M211, s_stg4M212, s_stg4M261, s_stg4M262, s_stg4M271, s_stg4M272, s_stg4M281, s_stg4M282, s_stg4M291, s_stg4M292       :   integer     := 0;
    signal s_stg4A18, s_stg4A19, s_stg4A20, s_stg4A21, s_stg4A26, s_stg4A27, s_stg4A28, s_stg4A29, s_stg4A292       :   integer     := 0;
    signal s_stg4D18, s_stg4D19, s_stg4D20, s_stg4D21, s_stg4D26, s_stg4D27, s_stg4D28, s_stg4D29, s_stg4D292       :   integer     := 0;
    signal s_stg516, s_stg517, s_stg518, s_stg519, s_stg520, s_stg521, s_stg522, s_stg523, s_stg524, s_stg525, s_stg526, s_stg527, s_stg528, s_stg529, s_stg530, s_stg531       :   integer     := 0;
    signal s_stg6M171, s_stg6M172, s_stg6M181, s_stg6M182, s_stg6M211, s_stg6M212, s_stg6M221, s_stg6M222, s_stg6M251, s_stg6M252, s_stg6M261, s_stg6M262, s_stg6M291, s_stg6M292, s_stg6M301, s_stg6M302       :   integer     := 0;
    signal s_stg6A17, s_stg6A18, s_stg6A21, s_stg6A22, s_stg6A25, s_stg6A26, s_stg6A29, s_stg6A30, s_stg6A31       :   integer     := 0;
    signal s_stg6D17, s_stg6D18, s_stg6D21, s_stg6D22, s_stg6D25, s_stg6D26, s_stg6D29, s_stg6D30, s_stg6D31       :   integer     := 0;
    signal s_stg716, s_stg717, s_stg718, s_stg719, s_stg720, s_stg721, s_stg722, s_stg723, s_stg724, s_stg725, s_stg726, s_stg727, s_stg728, s_stg729, s_stg730, s_stg731       :   integer     := 0;
    signal s_stg8M161, s_stg8M162, s_stg8M171, s_stg8M172, s_stg8M181, s_stg8M182, s_stg8M191, s_stg8M192, s_stg8M201, s_stg8M202, s_stg8M211, s_stg8M212, s_stg8M221, s_stg8M222, s_stg8M231, s_stg8M232, s_stg8M241, s_stg8M242, s_stg8M251, s_stg8M252, s_stg8M261, s_stg8M262, s_stg8M271, s_stg8M272, s_stg8M281, s_stg8M282, s_stg8M291, s_stg8M292, s_stg8M301, s_stg8M302, s_stg8M311, s_stg8M312        :   integer     := 0;
    signal s_stg8A16, s_stg8A17, s_stg8A18, s_stg8A19, s_stg8A20, s_stg8A21, s_stg8A22, s_stg8A23, s_stg8A24, s_stg8A25, s_stg8A26, s_stg8A27, s_stg8A28, s_stg8A29, s_stg8A30, s_stg8A31       :   integer     := 0;
    -------
    signal s_stage2AEn, s_stage2DEn, s_stage3En, s_stage4MEn, s_stage4AEn, s_stage4DEn, s_stage5En, s_stage6MEn, s_stage6AEn, s_stage6DEn, s_stage7En, s_stage8MEn, s_stage8AEn, s_valOut       :   std_logic := '0';
begin

    stage2M:    process(clk, res, en)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg2M20 <= 0;
                            s_stg2M21 <= 0;
                            s_stg2M22 <= 0;
                            s_stg2M23 <= 0;
                            s_stg2M24 <= 0;
                            s_stg2M25 <= 0;
                            s_stg2M26 <= 0;
                            s_stg2M27 <= 0;
                            s_stage2AEn <= '0';
                        elsif(en = '1') then
                            s_stg2M20 <= dataIn20*185;
                            s_stg2M21 <= dataIn21*185;
                            s_stg2M22 <= dataIn22*185;
                            s_stg2M23 <= dataIn23*185;
                            s_stg2M24 <= dataIn24*185;
                            s_stg2M25 <= dataIn25*185;
                            s_stg2M26 <= dataIn26*185;
                            s_stg2M27 <= dataIn27*185;
                            s_stage2AEn <= '1';
                        end if;
                    end if;
                end process;

    stage2A:    process(clk, res, s_stage2AEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg2A20 <= 0;
                            s_stg2A21 <= 0;
                            s_stg2A22 <= 0;
                            s_stg2A23 <= 0;
                            s_stg2A24 <= 0;
                            s_stg2A25 <= 0;
                            s_stg2A26 <= 0;
                            s_stg2A27 <= 0;
                            s_stage2DEn <= '0';
                        elsif(s_stage2AEn = '1') then
                            s_stg2A20 <= s_stg2M27 - s_stg2M20;
                            s_stg2A21 <= s_stg2M26 - s_stg2M21;
                            s_stg2A22 <= s_stg2M25 - s_stg2M22;
                            s_stg2A23 <= s_stg2M24 - s_stg2M23;
                            s_stg2A24 <= s_stg2M23 + s_stg2M24;
                            s_stg2A25 <= s_stg2M22 + s_stg2M25;
                            s_stg2A26 <= s_stg2M21 + s_stg2M26;
                            s_stg2A27 <= s_stg2M20 + s_stg2M27;
                            s_stage2DEn <= '1';
                        end if;
                    end if;
                end process;

    stage2D:    process(clk, res, s_stage2DEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg2D20 <= 0;
                            s_stg2D21 <= 0;
                            s_stg2D22 <= 0;
                            s_stg2D23 <= 0;
                            s_stg2D24 <= 0;
                            s_stg2D25 <= 0;
                            s_stg2D26 <= 0;
                            s_stg2D27 <= 0;
                            s_stage3En <= '0';
                        elsif(s_stage2DEn = '1') then
                            s_stg2D20 <= to_integer(shift_right(to_signed(s_stg2A20,32),8));
                            s_stg2D21 <= to_integer(shift_right(to_signed(s_stg2A21,32),8));
                            s_stg2D22 <= to_integer(shift_right(to_signed(s_stg2A22,32),8));
                            s_stg2D23 <= to_integer(shift_right(to_signed(s_stg2A23,32),8));
                            s_stg2D24 <= to_integer(shift_right(to_signed(s_stg2A24,32),8));
                            s_stg2D25 <= to_integer(shift_right(to_signed(s_stg2A25,32),8));
                            s_stg2D26 <= to_integer(shift_right(to_signed(s_stg2A26,32),8));
                            s_stg2D27 <= to_integer(shift_right(to_signed(s_stg2A27,32),8));
                            s_stage3En <= '1';
                        end if;
                    end if;
                end process;                

    stage3:     process(clk, res, s_stage3En)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg316 <= 0;
                            s_stg317 <= 0;
                            s_stg318 <= 0;
                            s_stg319 <= 0;
                            s_stg320 <= 0;
                            s_stg321 <= 0;
                            s_stg322 <= 0;
                            s_stg323 <= 0;
                            s_stg324 <= 0;
                            s_stg325 <= 0;
                            s_stg326 <= 0;
                            s_stg327 <= 0;
                            s_stg328 <= 0;
                            s_stg329 <= 0;
                            s_stg330 <= 0;
                            s_stg331 <= 0;
                            s_stage4MEn <= '0';
                        elsif(s_stage3En = '1') then
                            s_stg316 <= dataIn16 + s_stg2D23;
                            s_stg317 <= dataIn17 + s_stg2D22;
                            s_stg318 <= dataIn18 + s_stg2D21;
                            s_stg319 <= dataIn19 + s_stg2D20;
                            s_stg320 <= dataIn19 - s_stg2D20;
                            s_stg321 <= dataIn18 - s_stg2D21;
                            s_stg322 <= dataIn17 - s_stg2D22;
                            s_stg323 <= dataIn16 - s_stg2D23;
                            s_stg324 <= dataIn31 - s_stg2D24;
                            s_stg325 <= dataIn30 - s_stg2D25;
                            s_stg326 <= dataIn29 - s_stg2D26;
                            s_stg327 <= dataIn28 - s_stg2D27;
                            s_stg328 <= dataIn28 + s_stg2D27;
                            s_stg329 <= dataIn29 + s_stg2D26;
                            s_stg330 <= dataIn30 + s_stg2D25;
                            s_stg331 <= dataIn31 + s_stg2D24;
                            s_stage4MEn <= '1';
                        end if;
                    end if;
                end process;

    stage4M:    process(clk, res, s_stage4MEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg4M181 <= 0;
                            s_stg4M182 <= 0;
                            s_stg4M191 <= 0;
                            s_stg4M192 <= 0;
                            s_stg4M201 <= 0;
                            s_stg4M202 <= 0;
                            s_stg4M211 <= 0;
                            s_stg4M212 <= 0;
                            s_stg4M261 <= 0;
                            s_stg4M262 <= 0;
                            s_stg4M271 <= 0;
                            s_stg4M272 <= 0;
                            s_stg4M281 <= 0;
                            s_stg4M282 <= 0;
                            s_stg4M291 <= 0;
                            s_stg4M292 <= 0;
                            s_stage4AEn <= '0';
                        elsif(s_stage4MEn = '1') then
                            s_stg4M181 <= s_stg318*104;
                            s_stg4M182 <= s_stg318*239;
                            s_stg4M191 <= s_stg319*104;
                            s_stg4M192 <= s_stg319*239;
                            s_stg4M201 <= s_stg320*104;
                            s_stg4M202 <= s_stg320*239;
                            s_stg4M211 <= s_stg321*104;
                            s_stg4M212 <= s_stg321*239;
                            s_stg4M261 <= s_stg326*104;
                            s_stg4M262 <= s_stg326*239;
                            s_stg4M271 <= s_stg327*104;
                            s_stg4M272 <= s_stg327*239;
                            s_stg4M281 <= s_stg328*104;
                            s_stg4M282 <= s_stg328*239;
                            s_stg4M291 <= s_stg329*104;
                            s_stg4M292 <= s_stg329*239;
                            s_stage4AEn <= '1';
                        end if;
                    end if;
                end process;

    stage4A:    process(clk, res, s_stage4AEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg4A18 <= 0;
                            s_stg4A19 <= 0;
                            s_stg4A20 <= 0;
                            s_stg4A21 <= 0;
                            s_stg4A26 <= 0;
                            s_stg4A27 <= 0;
                            s_stg4A28 <= 0;
                            s_stg4A29 <= 0;
                            s_stage4DEn <= '0';
                        elsif(s_stage4AEn = '1') then
                            s_stg4A18 <= s_stg4M291 - s_stg4M182;
                            s_stg4A19 <= s_stg4M281 - s_stg4M192;
                            s_stg4A20 <= -s_stg4M272 - s_stg4M201;
                            s_stg4A21 <= -s_stg4M262 - s_stg4M211;
                            s_stg4A26 <= s_stg4M261 - s_stg4M212;
                            s_stg4A27 <= s_stg4M271 - s_stg4M202;
                            s_stg4A28 <= s_stg4M282 + s_stg4M191;
                            s_stg4A29 <= s_stg4M292 + s_stg4M181;
                            s_stage4DEn <= '1';
                        end if;
                    end if;
                end process;
                
    stage4D:    process(clk, res, s_stage4DEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg4D18 <= 0;
                            s_stg4D19 <= 0;
                            s_stg4D20 <= 0;
                            s_stg4D21 <= 0;
                            s_stg4D26 <= 0;
                            s_stg4D27 <= 0;
                            s_stg4D28 <= 0;
                            s_stg4D29 <= 0;
                            s_stage5En <= '0';
                        elsif(s_stage4DEn = '1') then
                            s_stg4D18 <= to_integer(shift_right(to_signed(s_stg4A18,32),8));
                            s_stg4D19 <= to_integer(shift_right(to_signed(s_stg4A19,32),8));
                            s_stg4D20 <= to_integer(shift_right(to_signed(s_stg4A20,32),8));
                            s_stg4D21 <= to_integer(shift_right(to_signed(s_stg4A21,32),8));
                            s_stg4D26 <= to_integer(shift_right(to_signed(s_stg4A26,32),8));
                            s_stg4D27 <= to_integer(shift_right(to_signed(s_stg4A27,32),8));
                            s_stg4D28 <= to_integer(shift_right(to_signed(s_stg4A28,32),8));
                            s_stg4D29 <= to_integer(shift_right(to_signed(s_stg4A29,32),8));
                            s_stage5En <= '1';
                        end if;
                    end if;
                end process;

    stage5:     process(clk, res, s_stage5En)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg516 <= 0;
                            s_stg517 <= 0;
                            s_stg518 <= 0;
                            s_stg519 <= 0;
                            s_stg520 <= 0;
                            s_stg521 <= 0;
                            s_stg522 <= 0;
                            s_stg523 <= 0;
                            s_stg524 <= 0;
                            s_stg525 <= 0;
                            s_stg526 <= 0;
                            s_stg527 <= 0;
                            s_stg528 <= 0;
                            s_stg529 <= 0;
                            s_stg530 <= 0;
                            s_stg531 <= 0;
                            s_stage6MEn <= '0';
                        elsif(s_stage5En = '1') then
                            s_stg516 <= s_stg316 + s_stg4D19;
                            s_stg517 <= s_stg317 + s_stg4D18;
                            s_stg518 <= s_stg317 - s_stg4D18;
                            s_stg519 <= s_stg316 - s_stg4D19;
                            s_stg520 <= s_stg323 - s_stg4D20;
                            s_stg521 <= s_stg322 - s_stg4D21;
                            s_stg522 <= s_stg322 + s_stg4D21;
                            s_stg523 <= s_stg323 + s_stg4D20;
                            s_stg524 <= s_stg324 + s_stg4D27;
                            s_stg525 <= s_stg325 + s_stg4D26;
                            s_stg526 <= s_stg325 - s_stg4D26;
                            s_stg527 <= s_stg324 - s_stg4D27;
                            s_stg528 <= s_stg331 - s_stg4D28;
                            s_stg529 <= s_stg330 - s_stg4D29;
                            s_stg530 <= s_stg330 + s_stg4D29;
                            s_stg531 <= s_stg331 + s_stg4D28;
                            s_stage6MEn <= '1';
                        end if;
                    end if;
                end process;

    stage6M:    process(clk, res, s_stage6MEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg6M171 <= 0;
                            s_stg6M172 <= 0;
                            s_stg6M181 <= 0;
                            s_stg6M182 <= 0;
                            s_stg6M211 <= 0;
                            s_stg6M212 <= 0;
                            s_stg6M221 <= 0;
                            s_stg6M222 <= 0;
                            s_stg6M251 <= 0;
                            s_stg6M252 <= 0;
                            s_stg6M261 <= 0;
                            s_stg6M262 <= 0;
                            s_stg6M291 <= 0;
                            s_stg6M292 <= 0;
                            s_stg6M301 <= 0;
                            s_stg6M302 <= 0;
                            s_stage6AEn <= '0';
                        elsif(s_stage6MEn = '1') then
                            s_stg6M171 <= s_stg517*56;
                            s_stg6M172 <= s_stg517*252;
                            s_stg6M181 <= s_stg518*56;
                            s_stg6M182 <= s_stg518*252;
                            s_stg6M211 <= s_stg521*147;
                            s_stg6M212 <= s_stg521*216;
                            s_stg6M221 <= s_stg522*147;
                            s_stg6M222 <= s_stg522*216;
                            s_stg6M251 <= s_stg525*147;
                            s_stg6M252 <= s_stg525*216;
                            s_stg6M261 <= s_stg526*147;
                            s_stg6M262 <= s_stg526*216;
                            s_stg6M291 <= s_stg529*56;
                            s_stg6M292 <= s_stg529*252;
                            s_stg6M301 <= s_stg530*56;
                            s_stg6M302 <= s_stg530*252;
                            s_stage6AEn <= '1';
                        end if;
                    end if;
                end process;

    stage6A:    process(clk, res, s_stage6AEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg6A17 <= 0;
                            s_stg6A18 <= 0;
                            s_stg6A21 <= 0;
                            s_stg6A22 <= 0;
                            s_stg6A25 <= 0;
                            s_stg6A26 <= 0;
                            s_stg6A29 <= 0;
                            s_stg6A30 <= 0;
                            s_stage6DEn <= '0';
                        elsif(s_stage6AEn = '1') then
                            s_stg6A17 <= s_stg6M301 - s_stg6M172;
                            s_stg6A18 <= -s_stg6M181 - s_stg6M292;
                            s_stg6A21 <= s_stg6M262 - s_stg6M211;
                            s_stg6A22 <= -s_stg6M222 - s_stg6M251;
                            s_stg6A25 <= s_stg6M252 - s_stg6M221;
                            s_stg6A26 <= s_stg6M212 + s_stg6M261;
                            s_stg6A29 <= s_stg6M291 - s_stg6M182;
                            s_stg6A30 <= s_stg6M171 + s_stg6M302;
                            s_stage6DEn <= '1';
                        end if;
                    end if;
                end process;

    stage6D:    process(clk, res, s_stage6DEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg6D17 <= 0;
                            s_stg6D18 <= 0;
                            s_stg6D21 <= 0;
                            s_stg6D22 <= 0;
                            s_stg6D25 <= 0;
                            s_stg6D26 <= 0;
                            s_stg6D29 <= 0;
                            s_stg6D30 <= 0;
                            s_stage7En <= '0';
                        elsif(s_stage6DEn = '1') then
                            s_stg6D17 <= to_integer(shift_right(to_signed(s_stg6A17,32),8));
                            s_stg6D18 <= to_integer(shift_right(to_signed(s_stg6A18,32),8));
                            s_stg6D21 <= to_integer(shift_right(to_signed(s_stg6A21,32),8));
                            s_stg6D22 <= to_integer(shift_right(to_signed(s_stg6A22,32),8));
                            s_stg6D25 <= to_integer(shift_right(to_signed(s_stg6A25,32),8));
                            s_stg6D26 <= to_integer(shift_right(to_signed(s_stg6A26,32),8));
                            s_stg6D29 <= to_integer(shift_right(to_signed(s_stg6A29,32),8));
                            s_stg6D30 <= to_integer(shift_right(to_signed(s_stg6A30,32),8));
                            s_stage7En <= '1';
                        end if;
                    end if;
                end process;

    stage7:     process(clk, res, s_stage7En)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg716 <= 0;
                            s_stg717 <= 0;
                            s_stg718 <= 0;
                            s_stg719 <= 0;
                            s_stg720 <= 0;
                            s_stg721 <= 0;
                            s_stg722 <= 0;
                            s_stg723 <= 0;
                            s_stg724 <= 0;
                            s_stg725 <= 0;
                            s_stg726 <= 0;
                            s_stg727 <= 0;
                            s_stg728 <= 0;
                            s_stg729 <= 0;
                            s_stg730 <= 0;
                            s_stg731 <= 0;
                            s_stage8MEn <= '0';
                        elsif(s_stage7En = '1') then
                            s_stg716 <= s_stg516 + s_stg6D17;
                            s_stg717 <= s_stg516 - s_stg6D17;
                            s_stg718 <= s_stg519 - s_stg6D18;
                            s_stg719 <= s_stg519 + s_stg6D18;
                            s_stg720 <= s_stg520 + s_stg6D21;
                            s_stg721 <= s_stg520 - s_stg6D21;
                            s_stg722 <= s_stg523 - s_stg6D22;
                            s_stg723 <= s_stg523 + s_stg6D22;
                            s_stg724 <= s_stg524 + s_stg6D25;
                            s_stg725 <= s_stg524 - s_stg6D25;
                            s_stg726 <= s_stg527 - s_stg6D26;
                            s_stg727 <= s_stg527 + s_stg6D26;
                            s_stg728 <= s_stg528 + s_stg6D29;
                            s_stg729 <= s_stg528 - s_stg6D29;
                            s_stg730 <= s_stg531 - s_stg6D30;
                            s_stg731 <= s_stg531 + s_stg6D30;
                            s_stage8MEn <= '1';
                        end if;
                    end if;
                end process;

    stage8M:    process(clk, res, s_stage8MEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg8M161 <= 0;
                            s_stg8M162 <= 0;
                            s_stg8M171 <= 0;
                            s_stg8M172 <= 0;
                            s_stg8M181 <= 0;
                            s_stg8M182 <= 0;
                            s_stg8M191 <= 0;
                            s_stg8M192 <= 0;
                            s_stg8M201 <= 0;
                            s_stg8M202 <= 0;
                            s_stg8M211 <= 0;
                            s_stg8M212 <= 0;
                            s_stg8M221 <= 0;
                            s_stg8M222 <= 0;
                            s_stg8M231 <= 0;
                            s_stg8M232 <= 0;
                            s_stg8M241 <= 0;
                            s_stg8M242 <= 0;
                            s_stg8M251 <= 0;
                            s_stg8M252 <= 0;
                            s_stg8M261 <= 0;
                            s_stg8M262 <= 0;
                            s_stg8M271 <= 0;
                            s_stg8M272 <= 0;
                            s_stg8M281 <= 0;
                            s_stg8M282 <= 0;
                            s_stg8M291 <= 0;
                            s_stg8M292 <= 0;
                            s_stg8M301 <= 0;
                            s_stg8M302 <= 0;
                            s_stg8M311 <= 0;
                            s_stg8M312 <= 0;
                            s_stage8AEn <= '0';
                        elsif(s_stage8MEn = '1') then
                            s_stg8M161 <= s_stg716*19;
                            s_stg8M162 <= s_stg716*256;
                            s_stg8M171 <= s_stg717*177;
                            s_stg8M172 <= s_stg717*194;
                            s_stg8M181 <= s_stg718*115;
                            s_stg8M182 <= s_stg718*234;
                            s_stg8M191 <= s_stg719*92;
                            s_stg8M192 <= s_stg719*243;
                            s_stg8M201 <= s_stg720*68;
                            s_stg8M202 <= s_stg720*250;
                            s_stg8M211 <= s_stg721*137;
                            s_stg8M212 <= s_stg721*223;
                            s_stg8M221 <= s_stg722*157;
                            s_stg8M222 <= s_stg722*209;
                            s_stg8M231 <= s_stg723*44;
                            s_stg8M232 <= s_stg723*254;
                            s_stg8M241 <= s_stg724*44;
                            s_stg8M242 <= s_stg724*254;
                            s_stg8M251 <= s_stg725*157;
                            s_stg8M252 <= s_stg725*209;
                            s_stg8M261 <= s_stg726*137;
                            s_stg8M262 <= s_stg726*223;
                            s_stg8M271 <= s_stg727*68;
                            s_stg8M272 <= s_stg727*250;
                            s_stg8M281 <= s_stg728*92;
                            s_stg8M282 <= s_stg728*243;
                            s_stg8M291 <= s_stg729*115;
                            s_stg8M292 <= s_stg729*234;
                            s_stg8M301 <= s_stg730*177;
                            s_stg8M302 <= s_stg730*194;
                            s_stg8M311 <= s_stg731*19;
                            s_stg8M312 <= s_stg731*256;
                            s_stage8AEn <= '1';
                        end if;
                    end if;
                end process;

    stage8A:    process(clk, res, s_stage8AEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg8A16 <= 0;
                            s_stg8A17 <= 0;
                            s_stg8A18 <= 0;
                            s_stg8A19 <= 0;
                            s_stg8A20 <= 0;
                            s_stg8A21 <= 0;
                            s_stg8A22 <= 0;
                            s_stg8A23 <= 0;
                            s_stg8A24 <= 0;
                            s_stg8A25 <= 0;
                            s_stg8A26 <= 0;
                            s_stg8A27 <= 0;
                            s_stg8A28 <= 0;
                            s_stg8A29 <= 0;
                            s_stg8A30 <= 0;
                            s_stg8A31 <= 0;
                            s_valOut <= '0';
                        elsif(s_stage8AEn = '1') then
                            s_stg8A16 <= s_stg8M161 + s_stg8M312;
                            s_stg8A17 <= s_stg8M172 + s_stg8M301;
                            s_stg8A18 <= s_stg8M181 + s_stg8M292;
                            s_stg8A19 <= s_stg8M192 + s_stg8M281;
                            s_stg8A20 <= s_stg8M201 + s_stg8M272;
                            s_stg8A21 <= s_stg8M212 + s_stg8M261;
                            s_stg8A22 <= s_stg8M221 + s_stg8M252;
                            s_stg8A23 <= s_stg8M232 + s_stg8M241;
                            s_stg8A24 <= s_stg8M242 - s_stg8M231;
                            s_stg8A25 <= s_stg8M251 - s_stg8M222;
                            s_stg8A26 <= s_stg8M262 - s_stg8M211;
                            s_stg8A27 <= s_stg8M271 - s_stg8M202;
                            s_stg8A28 <= s_stg8M282 - s_stg8M191;
                            s_stg8A29 <= s_stg8M291 - s_stg8M182;
                            s_stg8A30 <= s_stg8M302 - s_stg8M171;
                            s_stg8A31 <= s_stg8M311 - s_stg8M162;
                            s_valOut <= '1';
                        end if;
                    end if;
                end process;

    outReg:     process(clk, res, s_valOut)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            dataOut16 <= 0;
                            dataOut17 <= 0;
                            dataOut18 <= 0;
                            dataOut19 <= 0;
                            dataOut20 <= 0;
                            dataOut21 <= 0;
                            dataOut22 <= 0;
                            dataOut23 <= 0;
                            dataOut24 <= 0;
                            dataOut25 <= 0;
                            dataOut26 <= 0;
                            dataOut27 <= 0;
                            dataOut28 <= 0;
                            dataOut29 <= 0;
                            dataOut30 <= 0;
                            dataOut31 <= 0;
                            validOut <= '0';
                        elsif(s_valOut = '1') then
                            dataOut16 <= to_integer(shift_right(to_signed(s_stg8A16,32), 8));
                            dataOut17 <= to_integer(shift_right(to_signed(s_stg8A17,32), 8));
                            dataOut18 <= to_integer(shift_right(to_signed(s_stg8A18,32), 8));
                            dataOut19 <= to_integer(shift_right(to_signed(s_stg8A19,32), 8));
                            dataOut20 <= to_integer(shift_right(to_signed(s_stg8A20,32), 8));
                            dataOut21 <= to_integer(shift_right(to_signed(s_stg8A21,32), 8));
                            dataOut22 <= to_integer(shift_right(to_signed(s_stg8A22,32), 8));
                            dataOut23 <= to_integer(shift_right(to_signed(s_stg8A23,32), 8));
                            dataOut24 <= to_integer(shift_right(to_signed(s_stg8A24,32), 8));
                            dataOut25 <= to_integer(shift_right(to_signed(s_stg8A25,32), 8));
                            dataOut26 <= to_integer(shift_right(to_signed(s_stg8A26,32), 8));
                            dataOut27 <= to_integer(shift_right(to_signed(s_stg8A27,32), 8));
                            dataOut28 <= to_integer(shift_right(to_signed(s_stg8A28,32), 8));
                            dataOut29 <= to_integer(shift_right(to_signed(s_stg8A29,32), 8));
                            dataOut30 <= to_integer(shift_right(to_signed(s_stg8A30,32), 8));
                            dataOut31 <= to_integer(shift_right(to_signed(s_stg8A31,32), 8));
                            validOut <= '1';
                        end if;
                    end if;
                end process;
end Behavioral;