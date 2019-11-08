----------------------------------------------------------------------------------
-- DCT8 Implementation, with same # bits in input and output and internal integer
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DCT832 is
    generic(K   : positive := 32);      -- Number of bits per pixel
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
end DCT832;

architecture Behavioral of DCT832 is
    signal s_dataIn0, s_dataIn1, s_dataIn2, s_dataIn3, s_dataIn4, s_dataIn5, s_dataIn6, s_dataIn7           :   integer := 0;
    signal s_stg10, s_stg11, s_stg12, s_stg13, s_stg14, s_stg15, s_stg16, s_stg17       :   integer := 0;
    signal s_DCT4In0, s_DCT4In1, s_DCT4In2, s_DCT4In3       :   std_logic_vector(K-1 downto 0)     := (others => '0');
    signal s_stg2M5, s_stg2M6       :   integer     := 0;
    signal s_stg2A5, s_stg2A6       :   integer     := 0;
    signal s_stg2D5, s_stg2D6       :   integer     := 0;
    signal s_stg34, s_stg35, s_stg36, s_stg37       :   integer     := 0;
    signal s_stg4M41, s_stg4M42, s_stg4M51, s_stg4M52, s_stg4M61, s_stg4M62, s_stg4M71, s_stg4M72       :   integer     := 0;
    signal s_stg4A4, s_stg4A5, s_stg4A6, s_stg4A7       :   integer     := 0;
    signal s_dataOut0, s_dataOut4, s_dataOut2, s_dataOut6       :   std_logic_vector(K-1 downto 0)     := (others => '0');
    signal s_dataOut1, s_dataOut5, s_dataOut3, s_dataOut7       :   signed(K-1 downto 0) := (others => '0');
    signal s_stage1En, s_stage2MEn, s_DCT4En, s_stage2AEn, s_stage2DEn, s_stage3En, s_stage4MEn, s_stage4AEn, s_valOutDCT4, s_outCastEn, s_end8, s_valOut       :   std_logic := '0';
begin

    inSample:   process(clk, en, res)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_dataIn0 <= 0;
                            s_dataIn1 <= 0;
                            s_dataIn2 <= 0;
                            s_dataIn3 <= 0;
                            s_dataIn4 <= 0;
                            s_dataIn5 <= 0;
                            s_dataIn6 <= 0;
                            s_dataIn7 <= 0;
                            s_stage1En <= '0';
                        elsif(en = '1') then
                            s_dataIn0 <= to_integer(signed(dataIn0));
                            s_dataIn1 <= to_integer(signed(dataIn1));
                            s_dataIn2 <= to_integer(signed(dataIn2));
                            s_dataIn3 <= to_integer(signed(dataIn3));
                            s_dataIn4 <= to_integer(signed(dataIn4));
                            s_dataIn5 <= to_integer(signed(dataIn5));
                            s_dataIn6 <= to_integer(signed(dataIn6));
                            s_dataIn7 <= to_integer(signed(dataIn7));
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
                            s_stg14 <= 0;
                            s_stg15 <= 0;
                            s_stg16 <= 0;
                            s_stg17 <= 0;
                            s_stage2MEn <= '0';
                        elsif(s_stage1En = '1') then
                            s_stg10 <= s_dataIn0 + s_dataIn7;
                            s_stg11 <= s_dataIn1 + s_dataIn6;
                            s_stg12 <= s_dataIn2 + s_dataIn5;
                            s_stg13 <= s_dataIn3 + s_dataIn4;
                            s_stg14 <= s_dataIn3 - s_dataIn4;
                            s_stg15 <= s_dataIn2 - s_dataIn5;
                            s_stg16 <= s_dataIn1 - s_dataIn6;
                            s_stg17 <= s_dataIn0 - s_dataIn7;
                            s_stage2MEn <= '1';
                        end if;
                    end if;
                end process;

    DCT4InCast: process(clk, res, s_stage2MEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_DCT4In0   <= (others => '0');
                            s_DCT4In1   <= (others => '0');
                            s_DCT4In2   <= (others => '0');
                            s_DCT4In3   <= (others => '0');
                            s_DCT4En    <= '0';
                        elsif(s_stage2MEn = '1') then
                            s_DCT4In0   <=  std_logic_vector(to_signed(s_stg10,K));
                            s_DCT4In1   <=  std_logic_vector(to_signed(s_stg11,K));
                            s_DCT4In2   <=  std_logic_vector(to_signed(s_stg12,K));
                            s_DCT4In3   <=  std_logic_vector(to_signed(s_stg13,K));
                            s_DCT4En    <= '1';
                        end if;
                    end if;
                end process;

    DCT4:       entity work.DCT432(Behavioral)
                generic map(K           =>  K)
                port map(   dataIn0     =>  s_DCT4In0,
                            dataIn1     =>  s_DCT4In1,
                            dataIn2     =>  s_DCT4In2,
                            dataIn3     =>  s_DCT4In3,
                            res         =>  res,
                            en          =>  s_DCT4En,
                            clk         =>  clk,
                            dataOut0    =>  s_dataOut0,
                            dataOut1    =>  s_dataOut4,
                            dataOut2    =>  s_dataOut2,
                            dataOut3    =>  s_dataOut6,
                            validOut    =>  s_valOutDCT4
                        );

    stage2M:    process(clk, res, s_stage2MEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg2M5 <= 0;
                            s_stg2M6 <= 0;
                            s_stage2AEn <= '0';
                        elsif(s_stage2MEn = '1') then
                            s_stg2M5 <= s_stg15*185;
                            s_stg2M6 <= s_stg16*185;
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
                            s_stg2D5 <= to_integer(shift_right(to_signed(s_stg2A5,K),8));
                            s_stg2D6 <= to_integer(shift_right(to_signed(s_stg2A6,K),8));
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
                            s_stg34 <= s_stg14 + s_stg2D5;
                            s_stg35 <= s_stg14 - s_stg2D5;
                            s_stg36 <= s_stg17 - s_stg2D6;
                            s_stg37 <= s_stg17 + s_stg2D6;
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
                            --s_outCastEn <= '0';
                            s_end8 <= '0';
                        elsif(s_stage4AEn = '1') then
                            s_stg4A4 <= s_stg4M41 + s_stg4M72;
                            s_stg4A5 <= s_stg4M52 + s_stg4M61;
                            s_stg4A6 <= s_stg4M62 - s_stg4M51;
                            s_stg4A7 <= s_stg4M71 - s_stg4M42;
                            --s_outCastEn <= '1';
                            s_end8 <= '1';
                        end if;
                    end if;
                end process;
                
    --outCast:    process(clk, res, s_outCastEn)
    --            begin
    --                if(rising_edge(clk)) then
    --                    if(res = '1') then
    --                        s_dataOut1 <= (others => '0');
    --                        s_dataOut5 <= (others => '0');
    --                        s_dataOut3 <= (others => '0');
    --                        s_dataOut7 <= (others => '0');
    --                        s_end8 <= '0';
    --                    elsif(s_outCastEn = '1') then
    --                        s_dataOut1 <= to_signed(s_stg4A4,K);
    --                        s_dataOut5 <= to_signed(s_stg4A5,K);
    --                        s_dataOut3 <= to_signed(s_stg4A6,K);
    --                        s_dataOut7 <= to_signed(s_stg4A7,K);
    --                        s_end8 <= '1';
    --                    end if;
    --                end if;
    --            end process;

    s_valOut    <=  s_valOutDCT4 and s_end8;

    outReg:     process(clk, res, s_valOut)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            dataOut0 <= (others => '0');
                            dataOut1 <= (others => '0');
                            dataOut2 <= (others => '0');
                            dataOut3 <= (others => '0');
                            dataOut4 <= (others => '0');
                            dataOut5 <= (others => '0');
                            dataOut6 <= (others => '0');
                            dataOut7 <= (others => '0');
                            validOut <= '0';
                        elsif(s_valOut = '1') then
                            dataOut0 <= s_dataOut0;
                            --dataOut1 <= std_logic_vector(shift_right(s_dataOut1, 8));
                            dataOut1 <= std_logic_vector(shift_right(to_signed(s_stg4A4,K), 8));
                            dataOut2 <= s_dataOut2;
                            --dataOut3 <= std_logic_vector(shift_right(s_dataOut3, 8));
                            dataOut3 <= std_logic_vector(shift_right(to_signed(s_stg4A6,K), 8));
                            dataOut4 <= s_dataOut4;
                            --dataOut5 <= std_logic_vector(shift_right(s_dataOut5, 8));
                            dataOut5 <= std_logic_vector(shift_right(to_signed(s_stg4A5,K), 8));
                            dataOut6 <= s_dataOut6;
                            --dataOut7 <= std_logic_vector(shift_right(s_dataOut7, 8));
                            dataOut7 <= std_logic_vector(shift_right(to_signed(s_stg4A7,K), 8));
                            validOut <= '1';
                        end if;
                    end if;
                end process;
end Behavioral;