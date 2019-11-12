----------------------------------------------------------------------------------
-- DCT16 Implementation, with same # bits in input and output and internal integer
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DCT16_2_I is
    port(   -- Data Inputs
            dataIn8      : in    integer;
            dataIn9      : in    integer;
            dataIn10     : in    integer;
            dataIn11     : in    integer;
            dataIn12     : in    integer;
            dataIn13     : in    integer;
            dataIn14     : in    integer;
            dataIn15     : in    integer;
            -- Control Inputs
            res         : in    std_logic;
            en          : in    std_logic;
            clk         : in    std_logic;
            -- Data Outputs
            dataOut8      : out    integer;
            dataOut9      : out    integer;
            dataOut10     : out    integer;
            dataOut11     : out    integer;
            dataOut12     : out    integer;
            dataOut13     : out    integer;
            dataOut14     : out    integer;
            dataOut15     : out    integer;
            -- Control Outputs
            validOut    : out   std_logic
    );
end DCT16_2_I;

architecture Behavioral of DCT16_2_I is
    signal s_stg2M10, s_stg2M11, s_stg2M12, s_stg2M13       :   integer     := 0;
    signal s_stg2A10, s_stg2A11, s_stg2A12, s_stg2A13       :   integer     := 0;
    signal s_stg2D10, s_stg2D11, s_stg2D12, s_stg2D13       :   integer     := 0;
    signal s_stg38, s_stg39, s_stg310, s_stg311, s_stg312, s_stg313, s_stg314, s_stg315       :   integer     := 0;
    signal s_stg4M91, s_stg4M92, s_stg4M101, s_stg4M102, s_stg4M131, s_stg4M132, s_stg4M141, s_stg4M142       :   integer     := 0;
    signal s_stg4A9, s_stg4A10, s_stg4A13, s_stg4A14       :   integer     := 0;
    signal s_stg4D9, s_stg4D10, s_stg4D13, s_stg4D14       :   integer     := 0;
    signal s_stg58, s_stg59, s_stg510, s_stg511, s_stg512, s_stg513, s_stg514, s_stg515       :   integer     := 0;
    signal s_stg6M81, s_stg6M82, s_stg6M91, s_stg6M92, s_stg6M101, s_stg6M102, s_stg6M111, s_stg6M112, s_stg6M121, s_stg6M122, s_stg6M131, s_stg6M132, s_stg6M141, s_stg6M142, s_stg6M151, s_stg6M152       :   integer     := 0;
    signal s_stg6A8, s_stg6A9, s_stg6A10, s_stg6A11, s_stg6A12, s_stg6A13, s_stg6A14, s_stg6A15       :   integer     := 0;
    signal s_dataOut0, s_dataOut1, s_dataOut2, s_dataOut3, s_dataOut4, s_dataOut5, s_dataOut6, s_dataOut7       :   integer := 0;
    signal s_stage1En, s_stage2MEn, s_DCT8En, s_stage2AEn, s_stage2DEn, s_stage3En, s_stage4MEn, s_stage4AEn, s_stage4DEn, s_stage5En, s_stage6MEn, s_stage6AEn, s_valOutDCT8, s_outCastEn, s_end16, s_valOut       :   std_logic := '0';
begin

    stage2M:    process(clk, res, en)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg2M10 <= 0;
                            s_stg2M11 <= 0;
                            s_stg2M12 <= 0;
                            s_stg2M13 <= 0;
                            s_stage2AEn <= '0';
                        elsif(en = '1') then
                            s_stg2M10 <= dataIn10*185;
                            s_stg2M11 <= dataIn11*185;
                            s_stg2M12 <= dataIn12*185;
                            s_stg2M13 <= dataIn13*185;
                            s_stage2AEn <= '1';
                        end if;
                    end if;
                end process;

    stage2A:    process(clk, res, s_stage2AEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg2A10 <= 0;
                            s_stg2A11 <= 0;
                            s_stg2A12 <= 0;
                            s_stg2A13 <= 0;
                            s_stage2DEn <= '0';
                        elsif(s_stage2AEn = '1') then
                            s_stg2A10 <= s_stg2M13 - s_stg2M10;
                            s_stg2A11 <= s_stg2M12 - s_stg2M11;
                            s_stg2A12 <= s_stg2M12 + s_stg2M11;
                            s_stg2A13 <= s_stg2M13 + s_stg2M10;
                            s_stage2DEn <= '1';
                        end if;
                    end if;
                end process;

    stage2D:    process(clk, res, s_stage2DEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg2D10 <= 0;
                            s_stg2D11 <= 0;
                            s_stg2D12 <= 0;
                            s_stg2D13 <= 0;
                            s_stage3En <= '0';
                        elsif(s_stage2DEn = '1') then
                            s_stg2D10 <= to_integer(shift_right(to_signed(s_stg2A10,32),8));
                            s_stg2D11 <= to_integer(shift_right(to_signed(s_stg2A11,32),8));
                            s_stg2D12 <= to_integer(shift_right(to_signed(s_stg2A12,32),8));
                            s_stg2D13 <= to_integer(shift_right(to_signed(s_stg2A13,32),8));
                            s_stage3En <= '1';
                        end if;
                    end if;
                end process;                

    stage3:     process(clk, res, s_stage3En)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg38  <= 0;
                            s_stg39  <= 0;
                            s_stg310 <= 0;
                            s_stg311 <= 0;
                            s_stg312 <= 0;
                            s_stg313 <= 0;
                            s_stg314 <= 0;
                            s_stg315 <= 0;
                            s_stage4MEn <= '0';
                        elsif(s_stage3En = '1') then
                            s_stg38  <= dataIn8 + s_stg2D11;
                            s_stg39  <= dataIn9 + s_stg2D10;
                            s_stg310 <= dataIn9 - s_stg2D10;
                            s_stg311 <= dataIn8 - s_stg2D11;
                            s_stg312 <= dataIn15 - s_stg2D12;
                            s_stg313 <= dataIn14 - s_stg2D13;
                            s_stg314 <= dataIn14 + s_stg2D13;
                            s_stg315 <= dataIn15 + s_stg2D12;
                            s_stage4MEn <= '1';
                        end if;
                    end if;
                end process;

    stage4M:    process(clk, res, s_stage4MEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg4M91  <= 0;
                            s_stg4M92  <= 0;
                            s_stg4M101 <= 0;
                            s_stg4M102 <= 0;
                            s_stg4M131 <= 0;
                            s_stg4M132 <= 0;
                            s_stg4M141 <= 0;
                            s_stg4M142 <= 0;
                            s_stage4AEn <= '0';
                        elsif(s_stage4MEn = '1') then
                            s_stg4M91  <= s_stg39*104;
                            s_stg4M92  <= s_stg39*239;
                            s_stg4M101 <= s_stg310*104;
                            s_stg4M102 <= s_stg310*239;
                            s_stg4M131 <= s_stg313*104;
                            s_stg4M132 <= s_stg313*239;
                            s_stg4M141 <= s_stg314*104;
                            s_stg4M142 <= s_stg314*239;
                            s_stage4AEn <= '1';
                        end if;
                    end if;
                end process;

    stage4A:    process(clk, res, s_stage4AEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg4A9  <= 0;
                            s_stg4A10 <= 0;
                            s_stg4A13 <= 0;
                            s_stg4A14 <= 0;
                            s_stage4DEn <= '0';
                        elsif(s_stage4AEn = '1') then
                            s_stg4A9  <= s_stg4M141 - s_stg4M92;
                            s_stg4A10 <= -s_stg4M132 - s_stg4M101;
                            s_stg4A13 <= s_stg4M131 - s_stg4M102;
                            s_stg4A14 <= s_stg4M142 + s_stg4M91;
                            s_stage4DEn <= '1';
                        end if;
                    end if;
                end process;
                
    stage4D:    process(clk, res, s_stage4DEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg4D9  <= 0;
                            s_stg4D10 <= 0;
                            s_stg4D13 <= 0;
                            s_stg4D14 <= 0;
                            s_stage5En <= '0';
                        elsif(s_stage4DEn = '1') then
                            s_stg4D9  <= to_integer(shift_right(to_signed(s_stg4A9,32),8));
                            s_stg4D10 <= to_integer(shift_right(to_signed(s_stg4A10,32),8));
                            s_stg4D13 <= to_integer(shift_right(to_signed(s_stg4A13,32),8));
                            s_stg4D14 <= to_integer(shift_right(to_signed(s_stg4A14,32),8));
                            s_stage5En <= '1';
                        end if;
                    end if;
                end process;

    stage5:     process(clk, res, s_stage5En)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg58  <= 0;
                            s_stg59  <= 0;
                            s_stg510 <= 0;
                            s_stg511 <= 0;
                            s_stg512 <= 0;
                            s_stg513 <= 0;
                            s_stg514 <= 0;
                            s_stg515 <= 0;
                            s_stage6MEn <= '0';
                        elsif(s_stage5En = '1') then
                            s_stg58  <= s_stg38 + s_stg4D9;
                            s_stg59  <= s_stg38 - s_stg4D9;
                            s_stg510 <= s_stg311 - s_stg4D10;
                            s_stg511 <= s_stg311 + s_stg4D10;
                            s_stg512 <= s_stg312 + s_stg4D13;
                            s_stg513 <= s_stg312 - s_stg4D13;
                            s_stg514 <= s_stg315 - s_stg4D14;
                            s_stg515 <= s_stg315 + s_stg4D14;
                            s_stage6MEn <= '1';
                        end if;
                    end if;
                end process;

    stage6M:    process(clk, res, s_stage6MEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg6M81  <= 0;
                            s_stg6M82  <= 0;
                            s_stg6M91  <= 0;
                            s_stg6M92  <= 0;
                            s_stg6M101 <= 0;
                            s_stg6M102 <= 0;
                            s_stg6M111 <= 0;
                            s_stg6M112 <= 0;
                            s_stg6M121 <= 0;
                            s_stg6M122 <= 0;
                            s_stg6M131 <= 0;
                            s_stg6M132 <= 0;
                            s_stg6M141 <= 0;
                            s_stg6M142 <= 0;
                            s_stg6M151 <= 0;
                            s_stg6M152 <= 0;
                            s_stage6AEn <= '0';
                        elsif(s_stage6MEn = '1') then
                            s_stg6M81  <= s_stg58*31;
                            s_stg6M82  <= s_stg58*255;
                            s_stg6M91  <= s_stg59*167;
                            s_stg6M92  <= s_stg59*202;
                            s_stg6M101 <= s_stg510*126;
                            s_stg6M102 <= s_stg510*229;
                            s_stg6M111 <= s_stg511*80;
                            s_stg6M112 <= s_stg511*247;
                            s_stg6M121 <= s_stg512*80;
                            s_stg6M122 <= s_stg512*247;
                            s_stg6M131 <= s_stg513*126;
                            s_stg6M132 <= s_stg513*229;
                            s_stg6M141 <= s_stg514*167;
                            s_stg6M142 <= s_stg514*202;
                            s_stg6M151 <= s_stg515*31;
                            s_stg6M152 <= s_stg515*255;
                            s_stage6AEn <= '1';
                        end if;
                    end if;
                end process;

    stage6A:    process(clk, res, s_stage6AEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg6A8  <= 0;
                            s_stg6A9  <= 0;
                            s_stg6A10 <= 0;
                            s_stg6A11 <= 0;
                            s_stg6A12 <= 0;
                            s_stg6A13 <= 0;
                            s_stg6A14 <= 0;
                            s_stg6A15 <= 0;
                            s_valOut <= '0';
                        elsif(s_stage6AEn = '1') then
                            s_stg6A8  <= s_stg6M81 + s_stg6M152;
                            s_stg6A9  <= s_stg6M92 + s_stg6M141;
                            s_stg6A10 <= s_stg6M101 + s_stg6M132;
                            s_stg6A11 <= s_stg6M112 + s_stg6M121;
                            s_stg6A12 <= s_stg6M122 - s_stg6M111;
                            s_stg6A13 <= s_stg6M131 - s_stg6M102;
                            s_stg6A14 <= s_stg6M142 - s_stg6M91;
                            s_stg6A15 <= s_stg6M151 - s_stg6M82;
                            s_valOut <= '1';
                        end if;
                    end if;
                end process;

    outReg:     process(clk, res, s_valOut)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            dataOut8  <= 0;
                            dataOut9  <= 0;
                            dataOut10 <= 0;
                            dataOut11 <= 0;
                            dataOut12 <= 0;
                            dataOut13 <= 0;
                            dataOut14 <= 0;
                            dataOut15 <= 0;
                            validOut <= '0';
                        elsif(s_valOut = '1') then
                            dataOut8  <= to_integer(shift_right(to_signed(s_stg6A8,32), 8));
                            dataOut9  <= to_integer(shift_right(to_signed(s_stg6A9,32), 8));
                            dataOut10 <= to_integer(shift_right(to_signed(s_stg6A10,32), 8));
                            dataOut11 <= to_integer(shift_right(to_signed(s_stg6A11,32), 8));
                            dataOut12 <= to_integer(shift_right(to_signed(s_stg6A12,32), 8));
                            dataOut13 <= to_integer(shift_right(to_signed(s_stg6A13,32), 8));
                            dataOut14 <= to_integer(shift_right(to_signed(s_stg6A14,32), 8));
                            dataOut15 <= to_integer(shift_right(to_signed(s_stg6A15,32), 8));
                            validOut <= '1';
                        end if;
                    end if;
                end process;
end Behavioral;