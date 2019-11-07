----------------------------------------------------------------------------------
-- DCT16 Implementation, with same # bits in input and output and internal integer
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DCT1632 is
    generic(K   : positive := 32);      -- Number of bits per pixel
    port(   -- Data Inputs
            dataIn0      : in    std_logic_vector(K - 1 downto 0);
            dataIn1      : in    std_logic_vector(K - 1 downto 0);
            dataIn2      : in    std_logic_vector(K - 1 downto 0);
            dataIn3      : in    std_logic_vector(K - 1 downto 0);
            dataIn4      : in    std_logic_vector(K - 1 downto 0);
            dataIn5      : in    std_logic_vector(K - 1 downto 0);
            dataIn6      : in    std_logic_vector(K - 1 downto 0);
            dataIn7      : in    std_logic_vector(K - 1 downto 0);
            dataIn8      : in    std_logic_vector(K - 1 downto 0);
            dataIn9      : in    std_logic_vector(K - 1 downto 0);
            dataIn10     : in    std_logic_vector(K - 1 downto 0);
            dataIn11     : in    std_logic_vector(K - 1 downto 0);
            dataIn12     : in    std_logic_vector(K - 1 downto 0);
            dataIn13     : in    std_logic_vector(K - 1 downto 0);
            dataIn14     : in    std_logic_vector(K - 1 downto 0);
            dataIn15     : in    std_logic_vector(K - 1 downto 0);
            -- Control Inputs
            res         : in    std_logic;
            en          : in    std_logic;
            clk         : in    std_logic;
            -- Data Outputs
            dataOut0      : out    std_logic_vector(K - 1 downto 0);
            dataOut1      : out    std_logic_vector(K - 1 downto 0);
            dataOut2      : out    std_logic_vector(K - 1 downto 0);
            dataOut3      : out    std_logic_vector(K - 1 downto 0);
            dataOut4      : out    std_logic_vector(K - 1 downto 0);
            dataOut5      : out    std_logic_vector(K - 1 downto 0);
            dataOut6      : out    std_logic_vector(K - 1 downto 0);
            dataOut7      : out    std_logic_vector(K - 1 downto 0);
            dataOut8      : out    std_logic_vector(K - 1 downto 0);
            dataOut9      : out    std_logic_vector(K - 1 downto 0);
            dataOut10     : out    std_logic_vector(K - 1 downto 0);
            dataOut11     : out    std_logic_vector(K - 1 downto 0);
            dataOut12     : out    std_logic_vector(K - 1 downto 0);
            dataOut13     : out    std_logic_vector(K - 1 downto 0);
            dataOut14     : out    std_logic_vector(K - 1 downto 0);
            dataOut15     : out    std_logic_vector(K - 1 downto 0);
            -- Control Outputs
            validOut    : out   std_logic
    );
end DCT1632;

architecture Behavioral of DCT1632 is
    signal s_dataIn0, s_dataIn1, s_dataIn2, s_dataIn3, s_dataIn4, s_dataIn5, s_dataIn6, s_dataIn7, s_dataIn8, s_dataIn9, s_dataIn10, s_dataIn11, s_dataIn12, s_dataIn13, s_dataIn14, s_dataIn15           :   integer := 0;
    signal s_stg10, s_stg11, s_stg12, s_stg13, s_stg14, s_stg15, s_stg16, s_stg17, s_stg18, s_stg19, s_stg110, s_stg111, s_stg112, s_stg113, s_stg114, s_stg115       :   integer := 0;
    signal s_DCT8In0, s_DCT8In1, s_DCT8In2, s_DCT8In3, s_DCT8In4, s_DCT8In5, s_DCT8In6, s_DCT8In7       :   std_logic_vector(K-1 downto 0)     := (others => '0');
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
    signal s_dataOut0, s_dataOut1, s_dataOut2, s_dataOut3, s_dataOut4, s_dataOut5, s_dataOut6, s_dataOut7       :   std_logic_vector(K-1 downto 0)     := (others => '0');
    signal s_dataOut8, s_dataOut9, s_dataOut10, s_dataOut11, s_dataOut12, s_dataOut13, s_dataOut14, s_dataOut15       :   signed(K-1 downto 0) := (others => '0');
    signal s_stage1En, s_stage2MEn, s_DCT8En, s_stage2AEn, s_stage2DEn, s_stage3En, s_stage4MEn, s_stage4AEn, s_stage4DEn, s_stage5En, s_stage6MEn, s_stage6AEn, s_valOutDCT8, s_outCastEn, s_end16, s_valOut       :   std_logic := '0';
begin

    inSample:   process(clk, en, res)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_dataIn0  <= 0;
                            s_dataIn1  <= 0;
                            s_dataIn2  <= 0;
                            s_dataIn3  <= 0;
                            s_dataIn4  <= 0;
                            s_dataIn5  <= 0;
                            s_dataIn6  <= 0;
                            s_dataIn7  <= 0;
                            s_dataIn8  <= 0;
                            s_dataIn9  <= 0;
                            s_dataIn10 <= 0;
                            s_dataIn11 <= 0;
                            s_dataIn12 <= 0;
                            s_dataIn13 <= 0;
                            s_dataIn14 <= 0;
                            s_dataIn15 <= 0;
                            s_stage1En <= '0';
                        elsif(en = '1') then
                            s_dataIn0  <= to_integer(signed(dataIn0));
                            s_dataIn1  <= to_integer(signed(dataIn1));
                            s_dataIn2  <= to_integer(signed(dataIn2));
                            s_dataIn3  <= to_integer(signed(dataIn3));
                            s_dataIn4  <= to_integer(signed(dataIn4));
                            s_dataIn5  <= to_integer(signed(dataIn5));
                            s_dataIn6  <= to_integer(signed(dataIn6));
                            s_dataIn7  <= to_integer(signed(dataIn7));
                            s_dataIn8  <= to_integer(signed(dataIn8));
                            s_dataIn9  <= to_integer(signed(dataIn9));
                            s_dataIn10 <= to_integer(signed(dataIn10));
                            s_dataIn11 <= to_integer(signed(dataIn11));
                            s_dataIn12 <= to_integer(signed(dataIn12));
                            s_dataIn13 <= to_integer(signed(dataIn13));
                            s_dataIn14 <= to_integer(signed(dataIn14));
                            s_dataIn15 <= to_integer(signed(dataIn15));
                            s_stage1En <= '1';
                        end if;
                    end if;
                end process;    

    stage1:     process(clk, res, s_stage1En)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg10  <= 0;
                            s_stg11  <= 0;
                            s_stg12  <= 0;
                            s_stg13  <= 0;
                            s_stg14  <= 0;
                            s_stg15  <= 0;
                            s_stg16  <= 0;
                            s_stg17  <= 0;
                            s_stg18  <= 0;
                            s_stg19  <= 0;
                            s_stg110 <= 0;
                            s_stg111 <= 0;
                            s_stg112 <= 0;
                            s_stg113 <= 0;
                            s_stg114 <= 0;
                            s_stg115 <= 0;
                            s_stage2MEn <= '0';
                        elsif(s_stage1En = '1') then
                            s_stg10  <= s_dataIn0 + s_dataIn15;
                            s_stg11  <= s_dataIn1 + s_dataIn14;
                            s_stg12  <= s_dataIn2 + s_dataIn13;
                            s_stg13  <= s_dataIn3 + s_dataIn12;
                            s_stg14  <= s_dataIn4 + s_dataIn11;
                            s_stg15  <= s_dataIn5 + s_dataIn10;
                            s_stg16  <= s_dataIn6 + s_dataIn9;
                            s_stg17  <= s_dataIn7 + s_dataIn8;
                            s_stg18  <= s_dataIn7 - s_dataIn8;
                            s_stg19  <= s_dataIn6 - s_dataIn9;
                            s_stg110 <= s_dataIn5 - s_dataIn10;
                            s_stg111 <= s_dataIn4 - s_dataIn11;
                            s_stg112 <= s_dataIn3 - s_dataIn12;
                            s_stg113 <= s_dataIn2 - s_dataIn13;
                            s_stg114 <= s_dataIn1 - s_dataIn14;
                            s_stg115 <= s_dataIn0 - s_dataIn15;
                            s_stage2MEn <= '1';
                        end if;
                    end if;
                end process;

    DCT8InCast: process(clk, res, s_stage2MEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_DCT8In0   <= (others => '0');
                            s_DCT8In1   <= (others => '0');
                            s_DCT8In2   <= (others => '0');
                            s_DCT8In3   <= (others => '0');
                            s_DCT8In4   <= (others => '0');
                            s_DCT8In5   <= (others => '0');
                            s_DCT8In6   <= (others => '0');
                            s_DCT8In7   <= (others => '0');
                            s_DCT8En    <= '0';
                        elsif(s_stage2MEn = '1') then
                            s_DCT8In0   <=  std_logic_vector(to_signed(s_stg10,K));
                            s_DCT8In1   <=  std_logic_vector(to_signed(s_stg11,K));
                            s_DCT8In2   <=  std_logic_vector(to_signed(s_stg12,K));
                            s_DCT8In3   <=  std_logic_vector(to_signed(s_stg13,K));
                            s_DCT8In4   <=  std_logic_vector(to_signed(s_stg14,K));
                            s_DCT8In5   <=  std_logic_vector(to_signed(s_stg15,K));
                            s_DCT8In6   <=  std_logic_vector(to_signed(s_stg16,K));
                            s_DCT8In7   <=  std_logic_vector(to_signed(s_stg17,K));
                            s_DCT8En    <= '1';
                        end if;
                    end if;
                end process;

    DCT8:       entity work.DCT832(Behavioral)
                generic map(K           =>  K)
                port map(   dataIn0     =>  s_DCT8In0,
                            dataIn1     =>  s_DCT8In1,
                            dataIn2     =>  s_DCT8In2,
                            dataIn3     =>  s_DCT8In3,
                            dataIn4     =>  s_DCT8In4,
                            dataIn5     =>  s_DCT8In5,
                            dataIn6     =>  s_DCT8In6,
                            dataIn7     =>  s_DCT8In7,
                            res         =>  res,
                            en          =>  s_DCT8En,
                            clk         =>  clk,
                            dataOut0    =>  s_dataOut0,
                            dataOut1    =>  s_dataOut1,
                            dataOut2    =>  s_dataOut2,
                            dataOut3    =>  s_dataOut3,
                            dataOut4    =>  s_dataOut4,
                            dataOut5    =>  s_dataOut5,
                            dataOut6    =>  s_dataOut6,
                            dataOut7    =>  s_dataOut7,
                            validOut    =>  s_valOutDCT8
                        );

    stage2M:    process(clk, res, s_stage2MEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg2M10 <= 0;
                            s_stg2M11 <= 0;
                            s_stg2M12 <= 0;
                            s_stg2M13 <= 0;
                            s_stage2AEn <= '0';
                        elsif(s_stage2MEn = '1') then
                            s_stg2M10 <= s_stg110*185;
                            s_stg2M11 <= s_stg111*185;
                            s_stg2M12 <= s_stg112*185;
                            s_stg2M13 <= s_stg113*185;
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
                            s_stg2D10 <= to_integer(shift_right(to_signed(s_stg2A10,K),8));
                            s_stg2D11 <= to_integer(shift_right(to_signed(s_stg2A11,K),8));
                            s_stg2D12 <= to_integer(shift_right(to_signed(s_stg2A12,K),8));
                            s_stg2D13 <= to_integer(shift_right(to_signed(s_stg2A13,K),8));
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
                            s_stg38  <= s_stg18 + s_stg2D11;
                            s_stg39  <= s_stg19 + s_stg2D10;
                            s_stg310 <= s_stg19 - s_stg2D10;
                            s_stg311 <= s_stg18 - s_stg2D11;
                            s_stg312 <= s_stg115 - s_stg2D12;
                            s_stg313 <= s_stg114 - s_stg2D13;
                            s_stg314 <= s_stg114 + s_stg2D13;
                            s_stg315 <= s_stg115 + s_stg2D12;
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
                        elsif(s_stage2DEn = '1') then
                            s_stg4D9  <= to_integer(shift_right(to_signed(s_stg4A9,K),8));
                            s_stg4D10 <= to_integer(shift_right(to_signed(s_stg4A10,K),8));
                            s_stg4D13 <= to_integer(shift_right(to_signed(s_stg4A13,K),8));
                            s_stg4D14 <= to_integer(shift_right(to_signed(s_stg4A14,K),8));
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
                            s_outCastEn <= '0';
                        elsif(s_stage6AEn = '1') then
                            s_stg6A8  <= s_stg6M81 + s_stg6M152;
                            s_stg6A9  <= s_stg6M92 + s_stg6M141;
                            s_stg6A10 <= s_stg6M101 + s_stg6M132;
                            s_stg6A11 <= s_stg6M112 + s_stg6M121;
                            s_stg6A12 <= s_stg6M122 - s_stg6M111;
                            s_stg6A13 <= s_stg6M131 - s_stg6M102;
                            s_stg6A14 <= s_stg6M142 - s_stg6M91;
                            s_stg6A15 <= s_stg6M151 - s_stg6M82;
                            s_outCastEn <= '1';
                        end if;
                    end if;
                end process;

    outCast:    process(clk, res, s_outCastEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_dataOut8  <= (others => '0');
                            s_dataOut9  <= (others => '0');
                            s_dataOut10  <= (others => '0');
                            s_dataOut11 <= (others => '0');
                            s_dataOut12  <= (others => '0');
                            s_dataOut13 <= (others => '0');
                            s_dataOut14  <= (others => '0');
                            s_dataOut15 <= (others => '0');
                            s_end16 <= '0';
                        elsif(s_outCastEn = '1') then
                            s_dataOut8  <= to_signed(s_stg6A8,K);
                            s_dataOut9  <= to_signed(s_stg6A9,K);
                            s_dataOut10  <= to_signed(s_stg6A10,K);
                            s_dataOut11 <= to_signed(s_stg6A11,K);
                            s_dataOut12  <= to_signed(s_stg6A12,K);
                            s_dataOut13 <= to_signed(s_stg6A13,K);
                            s_dataOut14  <= to_signed(s_stg6A14,K);
                            s_dataOut15 <= to_signed(s_stg6A15,K);
                            s_end16 <= '1';
                        end if;
                    end if;
                end process;

    s_valOut    <=  s_valOutDCT8 and s_end16;

    -- The last stage implements the routing of the coefficients to their
    -- corresponding output. The implemented routes make corrections according 
    -- to the changes made in the last stage of DCT8
    
    outReg:     process(clk, res, s_valOut)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            dataOut0  <= (others => '0');
                            dataOut1  <= (others => '0');
                            dataOut2  <= (others => '0');
                            dataOut3  <= (others => '0');
                            dataOut4  <= (others => '0');
                            dataOut5  <= (others => '0');
                            dataOut6  <= (others => '0');
                            dataOut7  <= (others => '0');
                            dataOut8  <= (others => '0');
                            dataOut9  <= (others => '0');
                            dataOut10 <= (others => '0');
                            dataOut11 <= (others => '0');
                            dataOut12 <= (others => '0');
                            dataOut13 <= (others => '0');
                            dataOut14 <= (others => '0');
                            dataOut15 <= (others => '0');
                            validOut <= '0';
                        elsif(s_valOut = '1') then
                            dataOut0 <= s_dataOut0;
                            dataOut1 <= std_logic_vector(shift_right(to_signed(s_stg6A8,K), 8));
                            dataOut2 <= s_dataOut1;
                            dataOut3 <= std_logic_vector(shift_right(to_signed(s_stg6A12,K), 8));
                            dataOut4 <= s_dataOut2;
                            dataOut5 <= std_logic_vector(shift_right(to_signed(s_stg6A10,K), 8));
                            dataOut6 <= s_dataOut3;
                            dataOut7 <= std_logic_vector(shift_right(to_signed(s_stg6A14,K), 8));
                            dataOut8  <= s_dataOut4;
                            dataOut9  <= std_logic_vector(shift_right(to_signed(s_stg6A9,K), 8));
                            dataOut10 <= s_dataOut5;
                            dataOut11 <= std_logic_vector(shift_right(to_signed(s_stg6A13,K), 8));
                            dataOut12 <= s_dataOut6;
                            dataOut13 <= std_logic_vector(shift_right(to_signed(s_stg6A11,K), 8));
                            dataOut14 <= s_dataOut7;
                            dataOut15 <= std_logic_vector(shift_right(to_signed(s_stg6A15,K), 8));
                            validOut <= '1';
                        end if;
                    end if;
                end process;
end Behavioral;