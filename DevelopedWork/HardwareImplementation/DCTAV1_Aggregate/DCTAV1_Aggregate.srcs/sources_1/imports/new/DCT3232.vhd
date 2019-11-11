----------------------------------------------------------------------------------
-- DCT32 Implementation, with same # bits in input and output and internal integer
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DCT3232 is
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
            dataIn16     : in    std_logic_vector(K - 1 downto 0);
            dataIn17     : in    std_logic_vector(K - 1 downto 0);
            dataIn18     : in    std_logic_vector(K - 1 downto 0);
            dataIn19     : in    std_logic_vector(K - 1 downto 0);
            dataIn20     : in    std_logic_vector(K - 1 downto 0);
            dataIn21     : in    std_logic_vector(K - 1 downto 0);
            dataIn22     : in    std_logic_vector(K - 1 downto 0);
            dataIn23     : in    std_logic_vector(K - 1 downto 0);
            dataIn24     : in    std_logic_vector(K - 1 downto 0);
            dataIn25     : in    std_logic_vector(K - 1 downto 0);
            dataIn26     : in    std_logic_vector(K - 1 downto 0);
            dataIn27     : in    std_logic_vector(K - 1 downto 0);
            dataIn28     : in    std_logic_vector(K - 1 downto 0);
            dataIn29     : in    std_logic_vector(K - 1 downto 0);
            dataIn30     : in    std_logic_vector(K - 1 downto 0);
            dataIn31     : in    std_logic_vector(K - 1 downto 0);
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
            dataOut16     : out    std_logic_vector(K - 1 downto 0);
            dataOut17     : out    std_logic_vector(K - 1 downto 0);
            dataOut18     : out    std_logic_vector(K - 1 downto 0);
            dataOut19     : out    std_logic_vector(K - 1 downto 0);
            dataOut20     : out    std_logic_vector(K - 1 downto 0);
            dataOut21     : out    std_logic_vector(K - 1 downto 0);
            dataOut22     : out    std_logic_vector(K - 1 downto 0);
            dataOut23     : out    std_logic_vector(K - 1 downto 0);
            dataOut24     : out    std_logic_vector(K - 1 downto 0);
            dataOut25     : out    std_logic_vector(K - 1 downto 0);
            dataOut26     : out    std_logic_vector(K - 1 downto 0);
            dataOut27     : out    std_logic_vector(K - 1 downto 0);
            dataOut28     : out    std_logic_vector(K - 1 downto 0);
            dataOut29     : out    std_logic_vector(K - 1 downto 0);
            dataOut30     : out    std_logic_vector(K - 1 downto 0);
            dataOut31     : out    std_logic_vector(K - 1 downto 0);
            -- Control Outputs
            validOut    : out   std_logic
    );
end DCT3232;

architecture Behavioral of DCT3232 is
    signal s_dataIn0, s_dataIn1, s_dataIn2, s_dataIn3, s_dataIn4, s_dataIn5, s_dataIn6, s_dataIn7, s_dataIn8, s_dataIn9, s_dataIn10, s_dataIn11, s_dataIn12, s_dataIn13, s_dataIn14, s_dataIn15, s_dataIn16, s_dataIn17, s_dataIn18, s_dataIn19, s_dataIn20, s_dataIn21, s_dataIn22, s_dataIn23, s_dataIn24, s_dataIn25, s_dataIn26, s_dataIn27, s_dataIn28, s_dataIn29, s_dataIn30, s_dataIn31          :   integer := 0;
    signal s_stg10, s_stg11, s_stg12, s_stg13, s_stg14, s_stg15, s_stg16, s_stg17, s_stg18, s_stg19, s_stg110, s_stg111, s_stg112, s_stg113, s_stg114, s_stg115, s_stg116, s_stg117, s_stg118, s_stg119, s_stg120, s_stg121, s_stg122, s_stg123, s_stg124, s_stg125, s_stg126, s_stg127, s_stg128, s_stg129, s_stg130, s_stg131          :   integer := 0;
    signal s_DCT16In0, s_DCT16In1, s_DCT16In2, s_DCT16In3, s_DCT16In4, s_DCT16In5, s_DCT16In6, s_DCT16In7, s_DCT16In8, s_DCT16In9, s_DCT16In10, s_DCT16In11, s_DCT16In12, s_DCT16In13, s_DCT16In14, s_DCT16In15       :   std_logic_vector(K-1 downto 0)     := (others => '0');
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
    signal s_dataOut0, s_dataOut1, s_dataOut2, s_dataOut3, s_dataOut4, s_dataOut5, s_dataOut6, s_dataOut7, s_dataOut8, s_dataOut9, s_dataOut10, s_dataOut11, s_dataOut12, s_dataOut13, s_dataOut14, s_dataOut15       :   std_logic_vector(K-1 downto 0)     := (others => '0');
    signal s_dataOut16, s_dataOut17, s_dataOut18, s_dataOut19, s_dataOut20, s_dataOut21, s_dataOut22, s_dataOut23, s_dataOut24, s_dataOut25, s_dataOut26, s_dataOut27, s_dataOut28, s_dataOut29, s_dataOut30, s_dataOut31       :   signed(K-1 downto 0) := (others => '0');
    signal s_stage1En, s_stage2MEn, s_DCT16En, s_stage2AEn, s_stage2DEn, s_stage3En, s_stage4MEn, s_stage4AEn, s_stage4DEn, s_stage5En, s_stage6MEn, s_stage6AEn, s_stage6DEn, s_stage7En, s_stage8MEn, s_stage8AEn, s_valOutDCT16, s_outCastEn, s_end32, s_valOut       :   std_logic := '0';
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
                            s_dataIn16 <= 0;
                            s_dataIn17 <= 0;
                            s_dataIn18 <= 0;
                            s_dataIn19 <= 0;
                            s_dataIn20 <= 0;
                            s_dataIn21 <= 0;
                            s_dataIn22 <= 0;
                            s_dataIn23 <= 0;
                            s_dataIn24 <= 0;
                            s_dataIn25 <= 0;
                            s_dataIn26 <= 0;
                            s_dataIn27 <= 0;
                            s_dataIn28 <= 0;
                            s_dataIn29 <= 0;
                            s_dataIn30 <= 0;
                            s_dataIn31 <= 0;
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
                            s_dataIn16 <= to_integer(signed(dataIn16));
                            s_dataIn17 <= to_integer(signed(dataIn17));
                            s_dataIn18 <= to_integer(signed(dataIn18));
                            s_dataIn19 <= to_integer(signed(dataIn19));
                            s_dataIn20 <= to_integer(signed(dataIn20));
                            s_dataIn21 <= to_integer(signed(dataIn21));
                            s_dataIn22 <= to_integer(signed(dataIn22));
                            s_dataIn23 <= to_integer(signed(dataIn23));
                            s_dataIn24 <= to_integer(signed(dataIn24));
                            s_dataIn25 <= to_integer(signed(dataIn25));
                            s_dataIn26 <= to_integer(signed(dataIn26));
                            s_dataIn27 <= to_integer(signed(dataIn27));
                            s_dataIn28 <= to_integer(signed(dataIn28));
                            s_dataIn29 <= to_integer(signed(dataIn29));
                            s_dataIn30 <= to_integer(signed(dataIn30));
                            s_dataIn31 <= to_integer(signed(dataIn31));
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
                            s_stg116 <= 0;
                            s_stg117 <= 0;
                            s_stg118 <= 0;
                            s_stg119 <= 0;
                            s_stg120 <= 0;
                            s_stg121 <= 0;
                            s_stg122 <= 0;
                            s_stg123 <= 0;
                            s_stg124 <= 0;
                            s_stg125 <= 0;
                            s_stg126 <= 0;
                            s_stg127 <= 0;
                            s_stg128 <= 0;
                            s_stg129 <= 0;
                            s_stg130 <= 0;
                            s_stg131 <= 0;
                            s_stage2MEn <= '0';
                        elsif(s_stage1En = '1') then
                            s_stg10  <= s_dataIn0 + s_dataIn31;
                            s_stg11  <= s_dataIn1 + s_dataIn30;
                            s_stg12  <= s_dataIn2 + s_dataIn29;
                            s_stg13  <= s_dataIn3 + s_dataIn28;
                            s_stg14  <= s_dataIn4 + s_dataIn27;
                            s_stg15  <= s_dataIn5 + s_dataIn26;
                            s_stg16  <= s_dataIn6 + s_dataIn25;
                            s_stg17  <= s_dataIn7 + s_dataIn24;
                            s_stg18  <= s_dataIn8 + s_dataIn23;
                            s_stg19  <= s_dataIn9 + s_dataIn22;
                            s_stg110 <= s_dataIn10 + s_dataIn21;
                            s_stg111 <= s_dataIn11 + s_dataIn20;
                            s_stg112 <= s_dataIn12 + s_dataIn19;
                            s_stg113 <= s_dataIn13 + s_dataIn18;
                            s_stg114 <= s_dataIn14 + s_dataIn17;
                            s_stg115 <= s_dataIn15 + s_dataIn16;
                            s_stg116 <= s_dataIn15 - s_dataIn16;
                            s_stg117 <= s_dataIn14 - s_dataIn17;
                            s_stg118 <= s_dataIn13 - s_dataIn18;
                            s_stg119 <= s_dataIn12 - s_dataIn19;
                            s_stg120 <= s_dataIn11 - s_dataIn20;
                            s_stg121 <= s_dataIn10 - s_dataIn21;
                            s_stg122 <= s_dataIn9 - s_dataIn22;
                            s_stg123 <= s_dataIn8 - s_dataIn23;
                            s_stg124 <= s_dataIn7 - s_dataIn24;
                            s_stg125 <= s_dataIn6 - s_dataIn25;
                            s_stg126 <= s_dataIn5 - s_dataIn26;
                            s_stg127 <= s_dataIn4 - s_dataIn27;
                            s_stg128 <= s_dataIn3 - s_dataIn28;
                            s_stg129 <= s_dataIn2 - s_dataIn29;
                            s_stg130 <= s_dataIn1 - s_dataIn30;
                            s_stg131 <= s_dataIn0 - s_dataIn31;
                            s_stage2MEn <= '1';
                        end if;
                    end if;
                end process;

    DCT16InCast:process(clk, res, s_stage2MEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_DCT16In0  <= (others => '0');
                            s_DCT16In1  <= (others => '0');
                            s_DCT16In2  <= (others => '0');
                            s_DCT16In3  <= (others => '0');
                            s_DCT16In4  <= (others => '0');
                            s_DCT16In5  <= (others => '0');
                            s_DCT16In6  <= (others => '0');
                            s_DCT16In7  <= (others => '0');
                            s_DCT16In8  <= (others => '0');
                            s_DCT16In9  <= (others => '0');
                            s_DCT16In10 <= (others => '0');
                            s_DCT16In11 <= (others => '0');
                            s_DCT16In12 <= (others => '0');
                            s_DCT16In13 <= (others => '0');
                            s_DCT16In14 <= (others => '0');
                            s_DCT16In15 <= (others => '0');
                            s_DCT16En   <= '0';
                        elsif(s_stage2MEn = '1') then
                            s_DCT16In0  <=  std_logic_vector(to_signed(s_stg10,K));
                            s_DCT16In1  <=  std_logic_vector(to_signed(s_stg11,K));
                            s_DCT16In2  <=  std_logic_vector(to_signed(s_stg12,K));
                            s_DCT16In3  <=  std_logic_vector(to_signed(s_stg13,K));
                            s_DCT16In4  <=  std_logic_vector(to_signed(s_stg14,K));
                            s_DCT16In5  <=  std_logic_vector(to_signed(s_stg15,K));
                            s_DCT16In6  <=  std_logic_vector(to_signed(s_stg16,K));
                            s_DCT16In7  <=  std_logic_vector(to_signed(s_stg17,K));
                            s_DCT16In8  <=  std_logic_vector(to_signed(s_stg18,K));
                            s_DCT16In9  <=  std_logic_vector(to_signed(s_stg19,K));
                            s_DCT16In10 <=  std_logic_vector(to_signed(s_stg110,K));
                            s_DCT16In11 <=  std_logic_vector(to_signed(s_stg111,K));
                            s_DCT16In12 <=  std_logic_vector(to_signed(s_stg112,K));
                            s_DCT16In13 <=  std_logic_vector(to_signed(s_stg113,K));
                            s_DCT16In14 <=  std_logic_vector(to_signed(s_stg114,K));
                            s_DCT16In15 <=  std_logic_vector(to_signed(s_stg115,K));
                            s_DCT16En   <= '1';
                        end if;
                    end if;
                end process;

    DCT16:      entity work.DCT1632(Behavioral)
                generic map(K           =>  K)
                port map(   dataIn0     =>  s_DCT16In0,
                            dataIn1     =>  s_DCT16In1,
                            dataIn2     =>  s_DCT16In2,
                            dataIn3     =>  s_DCT16In3,
                            dataIn4     =>  s_DCT16In4,
                            dataIn5     =>  s_DCT16In5,
                            dataIn6     =>  s_DCT16In6,
                            dataIn7     =>  s_DCT16In7,
                            dataIn8     =>  s_DCT16In8,
                            dataIn9     =>  s_DCT16In9,
                            dataIn10    =>  s_DCT16In10,
                            dataIn11    =>  s_DCT16In11,
                            dataIn12    =>  s_DCT16In12,
                            dataIn13    =>  s_DCT16In13,
                            dataIn14    =>  s_DCT16In14,
                            dataIn15    =>  s_DCT16In15,
                            res         =>  res,
                            en          =>  s_DCT16En,
                            clk         =>  clk,
                            dataOut0    =>  s_dataOut0,
                            dataOut1    =>  s_dataOut1,
                            dataOut2    =>  s_dataOut2,
                            dataOut3    =>  s_dataOut3,
                            dataOut4    =>  s_dataOut4,
                            dataOut5    =>  s_dataOut5,
                            dataOut6    =>  s_dataOut6,
                            dataOut7    =>  s_dataOut7,
                            dataOut8    =>  s_dataOut8,
                            dataOut9    =>  s_dataOut9,
                            dataOut10   =>  s_dataOut10,
                            dataOut11   =>  s_dataOut11,
                            dataOut12   =>  s_dataOut12,
                            dataOut13   =>  s_dataOut13,
                            dataOut14   =>  s_dataOut14,
                            dataOut15   =>  s_dataOut15,
                            validOut    =>  s_valOutDCT16
                        );

    stage2M:    process(clk, res, s_stage2MEn)
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
                        elsif(s_stage2MEn = '1') then
                            s_stg2M20 <= s_stg120*185;
                            s_stg2M21 <= s_stg121*185;
                            s_stg2M22 <= s_stg122*185;
                            s_stg2M23 <= s_stg123*185;
                            s_stg2M24 <= s_stg124*185;
                            s_stg2M25 <= s_stg125*185;
                            s_stg2M26 <= s_stg126*185;
                            s_stg2M27 <= s_stg127*185;
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
                            s_stg2D20 <= to_integer(shift_right(to_signed(s_stg2A20,K),8));
                            s_stg2D21 <= to_integer(shift_right(to_signed(s_stg2A21,K),8));
                            s_stg2D22 <= to_integer(shift_right(to_signed(s_stg2A22,K),8));
                            s_stg2D23 <= to_integer(shift_right(to_signed(s_stg2A23,K),8));
                            s_stg2D24 <= to_integer(shift_right(to_signed(s_stg2A24,K),8));
                            s_stg2D25 <= to_integer(shift_right(to_signed(s_stg2A25,K),8));
                            s_stg2D26 <= to_integer(shift_right(to_signed(s_stg2A26,K),8));
                            s_stg2D27 <= to_integer(shift_right(to_signed(s_stg2A27,K),8));
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
                            s_stg316 <= s_stg116 + s_stg2D23;
                            s_stg317 <= s_stg117 + s_stg2D22;
                            s_stg318 <= s_stg118 + s_stg2D21;
                            s_stg319 <= s_stg119 + s_stg2D20;
                            s_stg320 <= s_stg119 - s_stg2D20;
                            s_stg321 <= s_stg118 - s_stg2D21;
                            s_stg322 <= s_stg117 - s_stg2D22;
                            s_stg323 <= s_stg116 - s_stg2D23;
                            s_stg324 <= s_stg131 - s_stg2D24;
                            s_stg325 <= s_stg130 - s_stg2D25;
                            s_stg326 <= s_stg129 - s_stg2D26;
                            s_stg327 <= s_stg128 - s_stg2D27;
                            s_stg328 <= s_stg128 + s_stg2D27;
                            s_stg329 <= s_stg129 + s_stg2D26;
                            s_stg330 <= s_stg130 + s_stg2D25;
                            s_stg331 <= s_stg131 + s_stg2D24;
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
                            s_stg4D18 <= to_integer(shift_right(to_signed(s_stg4A18,K),8));
                            s_stg4D19 <= to_integer(shift_right(to_signed(s_stg4A19,K),8));
                            s_stg4D20 <= to_integer(shift_right(to_signed(s_stg4A20,K),8));
                            s_stg4D21 <= to_integer(shift_right(to_signed(s_stg4A21,K),8));
                            s_stg4D26 <= to_integer(shift_right(to_signed(s_stg4A26,K),8));
                            s_stg4D27 <= to_integer(shift_right(to_signed(s_stg4A27,K),8));
                            s_stg4D28 <= to_integer(shift_right(to_signed(s_stg4A28,K),8));
                            s_stg4D29 <= to_integer(shift_right(to_signed(s_stg4A29,K),8));
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
                            s_stg6D17 <= to_integer(shift_right(to_signed(s_stg6A17,K),8));
                            s_stg6D18 <= to_integer(shift_right(to_signed(s_stg6A18,K),8));
                            s_stg6D21 <= to_integer(shift_right(to_signed(s_stg6A21,K),8));
                            s_stg6D22 <= to_integer(shift_right(to_signed(s_stg6A22,K),8));
                            s_stg6D25 <= to_integer(shift_right(to_signed(s_stg6A25,K),8));
                            s_stg6D26 <= to_integer(shift_right(to_signed(s_stg6A26,K),8));
                            s_stg6D29 <= to_integer(shift_right(to_signed(s_stg6A29,K),8));
                            s_stg6D30 <= to_integer(shift_right(to_signed(s_stg6A30,K),8));
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
                            --s_outCastEn <= '0';
                            s_end32 <= '0';
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
                            --s_outCastEn <= '1';
                            s_end32 <= '1';
                        end if;
                    end if;
                end process;

    --outCast:    process(clk, res, s_outCastEn)
    --            begin
    --                if(rising_edge(clk)) then
    --                    if(res = '1') then
    --                        s_dataOut16 <= (others => '0');
    --                        s_dataOut17 <= (others => '0');
    --                        s_dataOut18 <= (others => '0');
    --                        s_dataOut19 <= (others => '0');
    --                        s_dataOut20 <= (others => '0');
    --                        s_dataOut21 <= (others => '0');
    --                        s_dataOut22 <= (others => '0');
    --                        s_dataOut23 <= (others => '0');
    --                        s_dataOut24 <= (others => '0');
    --                        s_dataOut25 <= (others => '0');
    --                        s_dataOut26 <= (others => '0');
    --                        s_dataOut27 <= (others => '0');
    --                        s_dataOut28 <= (others => '0');
    --                        s_dataOut29 <= (others => '0');
    --                        s_dataOut30 <= (others => '0');
    --                        s_dataOut31 <= (others => '0');
    --                        s_end32 <= '0';
    --                    elsif(s_outCastEn = '1') then
    --                        s_dataOut16 <= to_signed(s_stg8A16,K);
    --                        s_dataOut17 <= to_signed(s_stg8A17,K);
    --                        s_dataOut18 <= to_signed(s_stg8A18,K);
    --                        s_dataOut19 <= to_signed(s_stg8A19,K);
    --                        s_dataOut20 <= to_signed(s_stg8A20,K);
    --                        s_dataOut21 <= to_signed(s_stg8A21,K);
    --                        s_dataOut22 <= to_signed(s_stg8A22,K);
    --                        s_dataOut23 <= to_signed(s_stg8A23,K);
    --                        s_dataOut24 <= to_signed(s_stg8A24,K);
    --                        s_dataOut25 <= to_signed(s_stg8A25,K);
    --                        s_dataOut26 <= to_signed(s_stg8A26,K);
    --                        s_dataOut27 <= to_signed(s_stg8A27,K);
    --                        s_dataOut28 <= to_signed(s_stg8A28,K);
    --                        s_dataOut29 <= to_signed(s_stg8A29,K);
    --                        s_dataOut30 <= to_signed(s_stg8A30,K);
    --                        s_dataOut31 <= to_signed(s_stg8A31,K);
    --                        s_end32 <= '1';
    --                    end if;
    --                end if;
    --            end process;

    s_valOut    <=  s_valOutDCT16 and s_end32;

    -- The last stage implements the routing of the coefficients to their
    -- corresponding output. The implemented routes make corrections according 
    -- to the changes made in the last stage of DCT8/16
    
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
                            dataOut16 <= (others => '0');
                            dataOut17 <= (others => '0');
                            dataOut18 <= (others => '0');
                            dataOut19 <= (others => '0');
                            dataOut20 <= (others => '0');
                            dataOut21 <= (others => '0');
                            dataOut22 <= (others => '0');
                            dataOut23 <= (others => '0');
                            dataOut24 <= (others => '0');
                            dataOut25 <= (others => '0');
                            dataOut26 <= (others => '0');
                            dataOut27 <= (others => '0');
                            dataOut28 <= (others => '0');
                            dataOut29 <= (others => '0');
                            dataOut30 <= (others => '0');
                            dataOut31 <= (others => '0');
                            validOut <= '0';
                        elsif(s_valOut = '1') then
                            dataOut0  <= s_dataOut0;
                            dataOut1  <= std_logic_vector(shift_right(to_signed(s_stg8A16,K), 8));
                            dataOut2  <= s_dataOut1;
                            dataOut3  <= std_logic_vector(shift_right(to_signed(s_stg8A24,K), 8));
                            dataOut4  <= s_dataOut2;
                            dataOut5  <= std_logic_vector(shift_right(to_signed(s_stg8A20,K), 8));
                            dataOut6  <= s_dataOut3;
                            dataOut7  <= std_logic_vector(shift_right(to_signed(s_stg8A28,K), 8));
                            dataOut8  <= s_dataOut4;
                            dataOut9  <= std_logic_vector(shift_right(to_signed(s_stg8A18,K), 8));
                            dataOut10 <= s_dataOut5;
                            dataOut11 <= std_logic_vector(shift_right(to_signed(s_stg8A26,K), 8));
                            dataOut12 <= s_dataOut6;
                            dataOut13 <= std_logic_vector(shift_right(to_signed(s_stg8A22,K), 8));
                            dataOut14 <= s_dataOut7;
                            dataOut15 <= std_logic_vector(shift_right(to_signed(s_stg8A30,K), 8));
                            dataOut16 <= s_dataOut8;
                            dataOut17 <= std_logic_vector(shift_right(to_signed(s_stg8A17,K), 8));
                            dataOut18 <= s_dataOut9;
                            dataOut19 <= std_logic_vector(shift_right(to_signed(s_stg8A25,K), 8));
                            dataOut20 <= s_dataOut10;
                            dataOut21 <= std_logic_vector(shift_right(to_signed(s_stg8A21,K), 8));
                            dataOut22 <= s_dataOut11;
                            dataOut23 <= std_logic_vector(shift_right(to_signed(s_stg8A29,K), 8));
                            dataOut24 <= s_dataOut12;
                            dataOut25 <= std_logic_vector(shift_right(to_signed(s_stg8A19,K), 8));
                            dataOut26 <= s_dataOut13;
                            dataOut27 <= std_logic_vector(shift_right(to_signed(s_stg8A27,K), 8));
                            dataOut28 <= s_dataOut14;
                            dataOut29 <= std_logic_vector(shift_right(to_signed(s_stg8A23,K), 8));
                            dataOut30 <= s_dataOut15;
                            dataOut31 <= std_logic_vector(shift_right(to_signed(s_stg8A31,K), 8));
                            validOut <= '1';
                        end if;
                    end if;
                end process;
end Behavioral;