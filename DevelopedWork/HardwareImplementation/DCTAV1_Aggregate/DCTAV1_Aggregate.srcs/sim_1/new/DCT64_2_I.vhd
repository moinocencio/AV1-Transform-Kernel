----------------------------------------------------------------------------------
-- DCT64 Implementation, with same # bits in input and output and internal integer
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DCT64_2_I is
    port(   -- Data Inputs
            dataIn32     : in    integer;
            dataIn33     : in    integer;
            dataIn34     : in    integer;
            dataIn35     : in    integer;
            dataIn36     : in    integer;
            dataIn37     : in    integer;
            dataIn38     : in    integer;
            dataIn39     : in    integer;
            dataIn40     : in    integer;
            dataIn41     : in    integer;
            dataIn42     : in    integer;
            dataIn43     : in    integer;
            dataIn44     : in    integer;
            dataIn45     : in    integer;
            dataIn46     : in    integer;
            dataIn47     : in    integer;
            dataIn48     : in    integer;
            dataIn49     : in    integer;
            dataIn50     : in    integer;
            dataIn51     : in    integer;
            dataIn52     : in    integer;
            dataIn53     : in    integer;
            dataIn54     : in    integer;
            dataIn55     : in    integer;
            dataIn56     : in    integer;
            dataIn57     : in    integer;
            dataIn58     : in    integer;
            dataIn59     : in    integer;
            dataIn60     : in    integer;
            dataIn61     : in    integer;
            dataIn62     : in    integer;
            dataIn63     : in    integer;
            -- Control Inputs
            res         : in    std_logic;
            en          : in    std_logic;
            clk         : in    std_logic;
            -- Data Outputs
            dataOut32     : out    integer;
            dataOut33     : out    integer;
            dataOut34     : out    integer;
            dataOut35     : out    integer;
            dataOut36     : out    integer;
            dataOut37     : out    integer;
            dataOut38     : out    integer;
            dataOut39     : out    integer;
            dataOut40     : out    integer;
            dataOut41     : out    integer;
            dataOut42     : out    integer;
            dataOut43     : out    integer;
            dataOut44     : out    integer;
            dataOut45     : out    integer;
            dataOut46     : out    integer;
            dataOut47     : out    integer;
            dataOut48     : out    integer;
            dataOut49     : out    integer;
            dataOut50     : out    integer;
            dataOut51     : out    integer;
            dataOut52     : out    integer;
            dataOut53     : out    integer;
            dataOut54     : out    integer;
            dataOut55     : out    integer;
            dataOut56     : out    integer;
            dataOut57     : out    integer;
            dataOut58     : out    integer;
            dataOut59     : out    integer;
            dataOut60     : out    integer;
            dataOut61     : out    integer;
            dataOut62     : out    integer;
            dataOut63     : out    integer;
            -- Control Outputs
            validOut    : out   std_logic
    );
end DCT64_2_I;

architecture Behavioral of DCT64_2_I is
    signal s_stg2M40, s_stg2M41, s_stg2M42, s_stg2M43, s_stg2M44, s_stg2M45, s_stg2M46, s_stg2M47, s_stg2M48, s_stg2M49, s_stg2M50, s_stg2M51, s_stg2M52, s_stg2M53, s_stg2M54, s_stg2M55   :   integer := 0;
    signal s_stg2A40, s_stg2A41, s_stg2A42, s_stg2A43, s_stg2A44, s_stg2A45, s_stg2A46, s_stg2A47, s_stg2A48, s_stg2A49, s_stg2A50, s_stg2A51, s_stg2A52, s_stg2A53, s_stg2A54, s_stg2A55   :   integer := 0;
    signal s_stg2D40, s_stg2D41, s_stg2D42, s_stg2D43, s_stg2D44, s_stg2D45, s_stg2D46, s_stg2D47, s_stg2D48, s_stg2D49, s_stg2D50, s_stg2D51, s_stg2D52, s_stg2D53, s_stg2D54, s_stg2D55   :   integer := 0;    
    signal s_stg332, s_stg333, s_stg334, s_stg335, s_stg336, s_stg337, s_stg338, s_stg339, s_stg340, s_stg341, s_stg342, s_stg343, s_stg344, s_stg345, s_stg346, s_stg347, s_stg348, s_stg349, s_stg350, s_stg351, s_stg352, s_stg353, s_stg354,s_stg355, s_stg356, s_stg357, s_stg358, s_stg359, s_stg360, s_stg361, s_stg362, s_stg363          :   integer := 0;
    signal s_stg4M361, s_stg4M362, s_stg4M371, s_stg4M372, s_stg4M381, s_stg4M382, s_stg4M391, s_stg4M392, s_stg4M401, s_stg4M402, s_stg4M411, s_stg4M412, s_stg4M421, s_stg4M422, s_stg4M431, s_stg4M432, s_stg4M521, s_stg4M522, s_stg4M531, s_stg4M532, s_stg4M541, s_stg4M542, s_stg4M551, s_stg4M552, s_stg4M561, s_stg4M562, s_stg4M571, s_stg4M572, s_stg4M581, s_stg4M582, s_stg4M591, s_stg4M592   : integer := 0;
    signal s_stg4A36, s_stg4A37, s_stg4A38, s_stg4A39, s_stg4A40, s_stg4A41, s_stg4A42, s_stg4A43, s_stg4A52, s_stg4A53, s_stg4A54, s_stg4A55, s_stg4A56, s_stg4A57, s_stg4A58, s_stg4A59, s_stg4A592   : integer := 0;
    signal s_stg4D36, s_stg4D37, s_stg4D38, s_stg4D39, s_stg4D40, s_stg4D41, s_stg4D42, s_stg4D43, s_stg4D52, s_stg4D53, s_stg4D54, s_stg4D55, s_stg4D56, s_stg4D57, s_stg4D58, s_stg4D59, s_stg4D592   : integer := 0;
    signal s_stg532, s_stg533, s_stg534, s_stg535, s_stg536, s_stg537, s_stg538, s_stg539, s_stg540, s_stg541, s_stg542, s_stg543, s_stg544, s_stg545, s_stg546, s_stg547, s_stg548, s_stg549, s_stg550, s_stg551, s_stg552, s_stg553, s_stg554,s_stg555, s_stg556, s_stg557, s_stg558, s_stg559, s_stg560, s_stg561, s_stg562, s_stg563          :   integer := 0;
    signal s_stg6M341, s_stg6M351, s_stg6M361, s_stg6M371, s_stg6M421, s_stg6M431, s_stg6M441, s_stg6M451, s_stg6M501, s_stg6M511, s_stg6M521, s_stg6M531, s_stg6M581, s_stg6M591, s_stg6M601, s_stg6M611, s_stg6M342, s_stg6M352, s_stg6M362, s_stg6M372, s_stg6M422, s_stg6M432, s_stg6M442, s_stg6M452, s_stg6M502, s_stg6M512, s_stg6M522, s_stg6M532, s_stg6M582, s_stg6M592, s_stg6M602, s_stg6M612   : integer := 0;
    signal s_stg6A34, s_stg6A35, s_stg6A36, s_stg6A37, s_stg6A42, s_stg6A43, s_stg6A44, s_stg6A45, s_stg6A50, s_stg6A51, s_stg6A52, s_stg6A53, s_stg6A58, s_stg6A59, s_stg6A60, s_stg6A61   : integer := 0;
    signal s_stg6D34, s_stg6D35, s_stg6D36, s_stg6D37, s_stg6D42, s_stg6D43, s_stg6D44, s_stg6D45, s_stg6D50, s_stg6D51, s_stg6D52, s_stg6D53, s_stg6D58, s_stg6D59, s_stg6D60, s_stg6D61   : integer := 0;
    signal s_stg732, s_stg733, s_stg734, s_stg735, s_stg736, s_stg737, s_stg738, s_stg739, s_stg740, s_stg741, s_stg742, s_stg743, s_stg744, s_stg745, s_stg746, s_stg747, s_stg748, s_stg749, s_stg750, s_stg751, s_stg752, s_stg753, s_stg754,s_stg755, s_stg756, s_stg757, s_stg758, s_stg759, s_stg760, s_stg761, s_stg762, s_stg763          :   integer := 0;
    signal s_stg8M331, s_stg8M341, s_stg8M371, s_stg8M381, s_stg8M411, s_stg8M421, s_stg8M451, s_stg8M461, s_stg8M491, s_stg8M501, s_stg8M531, s_stg8M541, s_stg8M571, s_stg8M581, s_stg8M611, s_stg8M621, s_stg8M332, s_stg8M342, s_stg8M372, s_stg8M382, s_stg8M412, s_stg8M422, s_stg8M452, s_stg8M462, s_stg8M492, s_stg8M502, s_stg8M532, s_stg8M542, s_stg8M572, s_stg8M582, s_stg8M612, s_stg8M622   : integer := 0;
    signal s_stg8A33, s_stg8A34, s_stg8A37, s_stg8A38, s_stg8A41, s_stg8A42, s_stg8A45, s_stg8A46, s_stg8A49, s_stg8A50, s_stg8A53, s_stg8A54, s_stg8A57, s_stg8A58, s_stg8A61, s_stg8A62    : integer := 0;
    signal s_stg8D33, s_stg8D34, s_stg8D37, s_stg8D38, s_stg8D41, s_stg8D42, s_stg8D45, s_stg8D46, s_stg8D49, s_stg8D50, s_stg8D53, s_stg8D54, s_stg8D57, s_stg8D58, s_stg8D61, s_stg8D62    : integer := 0;
    signal s_stg932, s_stg933, s_stg934, s_stg935, s_stg936, s_stg937, s_stg938, s_stg939, s_stg940, s_stg941, s_stg942, s_stg943, s_stg944, s_stg945, s_stg946, s_stg947, s_stg948, s_stg949, s_stg950, s_stg951, s_stg952, s_stg953, s_stg954,s_stg955, s_stg956, s_stg957, s_stg958, s_stg959, s_stg960, s_stg961, s_stg962, s_stg963          :   integer := 0;
    signal s_stg10M321, s_stg10M322, s_stg10M331, s_stg10M332, s_stg10M341, s_stg10M342, s_stg10M351, s_stg10M352, s_stg10M361, s_stg10M362, s_stg10M371, s_stg10M372, s_stg10M381, s_stg10M382, s_stg10M391, s_stg10M392, s_stg10M401, s_stg10M402, s_stg10M411, s_stg10M412, s_stg10M421, s_stg10M422, s_stg10M431, s_stg10M432, s_stg10M441, s_stg10M442, s_stg10M451, s_stg10M452, s_stg10M461, s_stg10M462, s_stg10M471, s_stg10M472, s_stg10M481, s_stg10M482, s_stg10M491, s_stg10M492, s_stg10M501, s_stg10M502, s_stg10M511, s_stg10M512, s_stg10M521, s_stg10M522, s_stg10M531, s_stg10M532, s_stg10M541, s_stg10M542,s_stg10M551, s_stg10M552, s_stg10M561, s_stg10M562, s_stg10M571, s_stg10M572, s_stg10M581, s_stg10M582, s_stg10M591, s_stg10M592, s_stg10M601, s_stg10M602, s_stg10M611, s_stg10M612, s_stg10M621, s_stg10M622, s_stg10M631, s_stg10M632          :   integer := 0;
    signal s_stg10A32, s_stg10A33, s_stg10A34, s_stg10A35, s_stg10A36, s_stg10A37, s_stg10A38, s_stg10A39, s_stg10A40, s_stg10A41, s_stg10A42, s_stg10A43, s_stg10A44, s_stg10A45, s_stg10A46, s_stg10A47, s_stg10A48, s_stg10A49, s_stg10A50, s_stg10A51, s_stg10A52, s_stg10A53, s_stg10A54,s_stg10A55, s_stg10A56, s_stg10A57, s_stg10A58, s_stg10A59, s_stg10A60, s_stg10A61, s_stg10A62, s_stg10A63          :   integer := 0;
    signal s_stage2MEn, s_stage2AEn, s_stage2DEn, s_stage3En, s_stage4MEn, s_stage4AEn, s_stage4DEn, s_stage5En, s_stage6MEn, s_stage6AEn, s_stage6DEn, s_stage7En, s_stage8MEn, s_stage8AEn, s_stage8DEn, s_stage9En, s_stage10MEn, s_stage10AEn, s_valOut       :   std_logic := '0';
begin

    stage2M:    process(clk, res, en)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg2M40 <= 0;
                            s_stg2M41 <= 0;
                            s_stg2M42 <= 0;
                            s_stg2M43 <= 0;
                            s_stg2M44 <= 0;
                            s_stg2M45 <= 0;
                            s_stg2M46 <= 0;
                            s_stg2M47 <= 0;
                            s_stg2M48 <= 0;
                            s_stg2M49 <= 0;
                            s_stg2M50 <= 0;
                            s_stg2M51 <= 0;
                            s_stg2M52 <= 0;
                            s_stg2M53 <= 0;
                            s_stg2M54 <= 0;
                            s_stg2M55 <= 0;
                            s_stage2AEn <= '0';
                        elsif(en = '1') then
                            s_stg2M40 <= dataIn40*185;
                            s_stg2M41 <= dataIn41*185;
                            s_stg2M42 <= dataIn42*185;
                            s_stg2M43 <= dataIn43*185;
                            s_stg2M44 <= dataIn44*185;
                            s_stg2M45 <= dataIn45*185;
                            s_stg2M46 <= dataIn46*185;
                            s_stg2M47 <= dataIn47*185;
                            s_stg2M48 <= dataIn48*185;
                            s_stg2M49 <= dataIn49*185;
                            s_stg2M50 <= dataIn50*185;
                            s_stg2M51 <= dataIn51*185;
                            s_stg2M52 <= dataIn52*185;
                            s_stg2M53 <= dataIn53*185;
                            s_stg2M54 <= dataIn54*185;
                            s_stg2M55 <= dataIn55*185;
                            s_stage2AEn <= '1';
                        end if;
                    end if;
                end process;

    stage2A:    process(clk, res, s_stage2AEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg2A40 <= 0;
                            s_stg2A41 <= 0;
                            s_stg2A42 <= 0;
                            s_stg2A43 <= 0;
                            s_stg2A44 <= 0;
                            s_stg2A45 <= 0;
                            s_stg2A46 <= 0;
                            s_stg2A47 <= 0;
                            s_stg2A48 <= 0;
                            s_stg2A49 <= 0;
                            s_stg2A50 <= 0;
                            s_stg2A51 <= 0;
                            s_stg2A52 <= 0;
                            s_stg2A53 <= 0;
                            s_stg2A54 <= 0;
                            s_stg2A55 <= 0;
                            s_stage2DEn <= '0';
                        elsif(s_stage2AEn = '1') then
                            s_stg2A40 <= s_stg2M55 - s_stg2M40;
                            s_stg2A41 <= s_stg2M54 - s_stg2M41;
                            s_stg2A42 <= s_stg2M53 - s_stg2M42;
                            s_stg2A43 <= s_stg2M52 - s_stg2M43;
                            s_stg2A44 <= s_stg2M51 - s_stg2M44;
                            s_stg2A45 <= s_stg2M50 - s_stg2M45;
                            s_stg2A46 <= s_stg2M49 - s_stg2M46;
                            s_stg2A47 <= s_stg2M48 - s_stg2M47;
                            s_stg2A48 <= s_stg2M48 + s_stg2M47;
                            s_stg2A49 <= s_stg2M49 + s_stg2M46;
                            s_stg2A50 <= s_stg2M50 + s_stg2M45;
                            s_stg2A51 <= s_stg2M51 + s_stg2M44;
                            s_stg2A52 <= s_stg2M52 + s_stg2M43;
                            s_stg2A53 <= s_stg2M53 + s_stg2M42;
                            s_stg2A54 <= s_stg2M54 + s_stg2M41;
                            s_stg2A55 <= s_stg2M55 + s_stg2M40;
                            s_stage2DEn <= '1';
                        end if;
                    end if;
                end process;

    stage2D:    process(clk, res, s_stage2DEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg2D40 <= 0;
                            s_stg2D41 <= 0;
                            s_stg2D42 <= 0;
                            s_stg2D43 <= 0;
                            s_stg2D44 <= 0;
                            s_stg2D45 <= 0;
                            s_stg2D46 <= 0;
                            s_stg2D47 <= 0;
                            s_stg2D48 <= 0;
                            s_stg2D49 <= 0;
                            s_stg2D50 <= 0;
                            s_stg2D51 <= 0;
                            s_stg2D52 <= 0;
                            s_stg2D53 <= 0;
                            s_stg2D54 <= 0;
                            s_stg2D55 <= 0;
                            s_stage3En <= '0';
                        elsif(s_stage2DEn = '1') then
                            s_stg2D40 <= to_integer(shift_right(to_signed(s_stg2A40,32),8));
                            s_stg2D41 <= to_integer(shift_right(to_signed(s_stg2A41,32),8));
                            s_stg2D42 <= to_integer(shift_right(to_signed(s_stg2A42,32),8));
                            s_stg2D43 <= to_integer(shift_right(to_signed(s_stg2A43,32),8));
                            s_stg2D44 <= to_integer(shift_right(to_signed(s_stg2A44,32),8));
                            s_stg2D45 <= to_integer(shift_right(to_signed(s_stg2A45,32),8));
                            s_stg2D46 <= to_integer(shift_right(to_signed(s_stg2A46,32),8));
                            s_stg2D47 <= to_integer(shift_right(to_signed(s_stg2A47,32),8));
                            s_stg2D48 <= to_integer(shift_right(to_signed(s_stg2A48,32),8));
                            s_stg2D49 <= to_integer(shift_right(to_signed(s_stg2A49,32),8));
                            s_stg2D50 <= to_integer(shift_right(to_signed(s_stg2A50,32),8));
                            s_stg2D51 <= to_integer(shift_right(to_signed(s_stg2A51,32),8));
                            s_stg2D52 <= to_integer(shift_right(to_signed(s_stg2A52,32),8));
                            s_stg2D53 <= to_integer(shift_right(to_signed(s_stg2A53,32),8));
                            s_stg2D54 <= to_integer(shift_right(to_signed(s_stg2A54,32),8));
                            s_stg2D55 <= to_integer(shift_right(to_signed(s_stg2A55,32),8));
                            s_stage3En <= '1';
                        end if;
                    end if;
                end process;                

    stage3:     process(clk, res, s_stage3En)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg332 <= 0;
                            s_stg333 <= 0;
                            s_stg334 <= 0;
                            s_stg335 <= 0;
                            s_stg336 <= 0;
                            s_stg337 <= 0;
                            s_stg338 <= 0;
                            s_stg339 <= 0;
                            s_stg340 <= 0;
                            s_stg341 <= 0;
                            s_stg342 <= 0;
                            s_stg343 <= 0;
                            s_stg344 <= 0;
                            s_stg345 <= 0;
                            s_stg346 <= 0;
                            s_stg347 <= 0;
                            s_stg348 <= 0;
                            s_stg349 <= 0;
                            s_stg350 <= 0;
                            s_stg351 <= 0;
                            s_stg352 <= 0;
                            s_stg353 <= 0;
                            s_stg354 <= 0;
                            s_stg355 <= 0;
                            s_stg356 <= 0;
                            s_stg357 <= 0;
                            s_stg358 <= 0;
                            s_stg359 <= 0;
                            s_stg360 <= 0;
                            s_stg361 <= 0;
                            s_stg362 <= 0;
                            s_stg363 <= 0;
                            s_stage4MEn <= '0';
                        elsif(s_stage3En = '1') then
                            s_stg332 <= dataIn32 + s_stg2D47;
                            s_stg333 <= dataIn33 + s_stg2D46;
                            s_stg334 <= dataIn34 + s_stg2D45;
                            s_stg335 <= dataIn35 + s_stg2D44;
                            s_stg336 <= dataIn36 + s_stg2D43;
                            s_stg337 <= dataIn37 + s_stg2D42;
                            s_stg338 <= dataIn38 + s_stg2D41;
                            s_stg339 <= dataIn39 + s_stg2D40;
                            s_stg340 <= dataIn39 - s_stg2D40;
                            s_stg341 <= dataIn38 - s_stg2D41;
                            s_stg342 <= dataIn37 - s_stg2D42;
                            s_stg343 <= dataIn36 - s_stg2D43;
                            s_stg344 <= dataIn35 - s_stg2D44;
                            s_stg345 <= dataIn34 - s_stg2D45;
                            s_stg346 <= dataIn33 - s_stg2D46;
                            s_stg347 <= dataIn32 - s_stg2D47;
                            s_stg348 <= dataIn63 - s_stg2D48;
                            s_stg349 <= dataIn62 - s_stg2D49;
                            s_stg350 <= dataIn61 - s_stg2D50;
                            s_stg351 <= dataIn60 - s_stg2D51;
                            s_stg352 <= dataIn59 - s_stg2D52;
                            s_stg353 <= dataIn58 - s_stg2D53;
                            s_stg354 <= dataIn57 - s_stg2D54;
                            s_stg355 <= dataIn56 - s_stg2D55;
                            s_stg356 <= dataIn56 + s_stg2D55;
                            s_stg357 <= dataIn57 + s_stg2D54;
                            s_stg358 <= dataIn58 + s_stg2D53;
                            s_stg359 <= dataIn59 + s_stg2D52;
                            s_stg360 <= dataIn60 + s_stg2D51;
                            s_stg361 <= dataIn61 + s_stg2D50;
                            s_stg362 <= dataIn62 + s_stg2D49;
                            s_stg363 <= dataIn63 + s_stg2D48;
                            s_stage4MEn <= '1';
                        end if;
                    end if;
                end process;

    stage4M:    process(clk, res, s_stage4MEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg4M361 <= 0;
                            s_stg4M362 <= 0;
                            s_stg4M371 <= 0;
                            s_stg4M372 <= 0;
                            s_stg4M381 <= 0;
                            s_stg4M382 <= 0;
                            s_stg4M391 <= 0;
                            s_stg4M392 <= 0;
                            s_stg4M401 <= 0;
                            s_stg4M402 <= 0;
                            s_stg4M411 <= 0;
                            s_stg4M412 <= 0;
                            s_stg4M421 <= 0;
                            s_stg4M422 <= 0;
                            s_stg4M431 <= 0;
                            s_stg4M432 <= 0;
                            
                            s_stg4M521 <= 0;
                            s_stg4M522 <= 0;
                            s_stg4M531 <= 0;
                            s_stg4M532 <= 0;
                            s_stg4M541 <= 0;
                            s_stg4M542 <= 0;
                            s_stg4M551 <= 0;
                            s_stg4M552 <= 0;
                            s_stg4M561 <= 0;
                            s_stg4M562 <= 0;
                            s_stg4M571 <= 0;
                            s_stg4M572 <= 0;
                            s_stg4M581 <= 0;
                            s_stg4M582 <= 0;
                            s_stg4M591 <= 0;
                            s_stg4M592 <= 0;
                            s_stage4AEn <= '0';
                        elsif(s_stage4MEn = '1') then
                            s_stg4M361 <= s_stg336*104;
                            s_stg4M362 <= s_stg336*239;
                            s_stg4M371 <= s_stg337*104;
                            s_stg4M372 <= s_stg337*239;
                            s_stg4M381 <= s_stg338*104;
                            s_stg4M382 <= s_stg338*239;
                            s_stg4M391 <= s_stg339*104;
                            s_stg4M392 <= s_stg339*239;
                            s_stg4M401 <= s_stg340*104;
                            s_stg4M402 <= s_stg340*239;
                            s_stg4M411 <= s_stg341*104;
                            s_stg4M412 <= s_stg341*239;
                            s_stg4M421 <= s_stg342*104;
                            s_stg4M422 <= s_stg342*239;
                            s_stg4M431 <= s_stg343*104;
                            s_stg4M432 <= s_stg343*239;
                            
                            s_stg4M521 <= s_stg352*104;
                            s_stg4M522 <= s_stg352*239;
                            s_stg4M531 <= s_stg353*104;
                            s_stg4M532 <= s_stg353*239;
                            s_stg4M541 <= s_stg354*104;
                            s_stg4M542 <= s_stg354*239;
                            s_stg4M551 <= s_stg355*104;
                            s_stg4M552 <= s_stg355*239;
                            s_stg4M561 <= s_stg356*104;
                            s_stg4M562 <= s_stg356*239;
                            s_stg4M571 <= s_stg357*104;
                            s_stg4M572 <= s_stg357*239;
                            s_stg4M581 <= s_stg358*104;
                            s_stg4M582 <= s_stg358*239;
                            s_stg4M591 <= s_stg359*104;
                            s_stg4M592 <= s_stg359*239;
                            s_stage4AEn <= '1';
                        end if;
                    end if;
                end process;

    stage4A:    process(clk, res, s_stage4AEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg4A36 <= 0;
                            s_stg4A37 <= 0;
                            s_stg4A38 <= 0;
                            s_stg4A39 <= 0;
                            s_stg4A40 <= 0;
                            s_stg4A41 <= 0;
                            s_stg4A42 <= 0;
                            s_stg4A43 <= 0;
                            
                            s_stg4A52 <= 0;
                            s_stg4A53 <= 0;
                            s_stg4A54 <= 0;
                            s_stg4A55 <= 0;
                            s_stg4A56 <= 0;
                            s_stg4A57 <= 0;
                            s_stg4A58 <= 0;
                            s_stg4A59 <= 0;
                            s_stage4DEn <= '0';
                        elsif(s_stage4AEn = '1') then
                            s_stg4A36 <= -s_stg4M362 + s_stg4M591;
                            s_stg4A37 <= -s_stg4M372 + s_stg4M581;
                            s_stg4A38 <= -s_stg4M382 + s_stg4M571;
                            s_stg4A39 <= -s_stg4M392 + s_stg4M561;
                            s_stg4A40 <= -s_stg4M401 - s_stg4M552;
                            s_stg4A41 <= -s_stg4M411 - s_stg4M542;
                            s_stg4A42 <= -s_stg4M421 - s_stg4M532;
                            s_stg4A43 <= -s_stg4M431 - s_stg4M522;
                            
                            s_stg4A52 <= s_stg4M521 - s_stg4M432;
                            s_stg4A53 <= s_stg4M531 - s_stg4M422;
                            s_stg4A54 <= s_stg4M541 - s_stg4M412;
                            s_stg4A55 <= s_stg4M551 - s_stg4M402;
                            s_stg4A56 <= s_stg4M562 + s_stg4M391;
                            s_stg4A57 <= s_stg4M572 + s_stg4M381;
                            s_stg4A58 <= s_stg4M582 + s_stg4M371;
                            s_stg4A59 <= s_stg4M592 + s_stg4M361;
                            s_stage4DEn <= '1';
                        end if;
                    end if;
                end process;
                
    stage4D:    process(clk, res, s_stage4DEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg4D36 <= 0;
                            s_stg4D37 <= 0;
                            s_stg4D38 <= 0;
                            s_stg4D39 <= 0;
                            s_stg4D40 <= 0;
                            s_stg4D41 <= 0;
                            s_stg4D42 <= 0;
                            s_stg4D43 <= 0;

                            s_stg4D52 <= 0;
                            s_stg4D53 <= 0;
                            s_stg4D54 <= 0;
                            s_stg4D55 <= 0;
                            s_stg4D56 <= 0;
                            s_stg4D57 <= 0;
                            s_stg4D58 <= 0;
                            s_stg4D59 <= 0;
                            s_stage5En <= '0';
                        elsif(s_stage4DEn = '1') then
                            s_stg4D36 <= to_integer(shift_right(to_signed(s_stg4A36,32),8));
                            s_stg4D37 <= to_integer(shift_right(to_signed(s_stg4A37,32),8));
                            s_stg4D38 <= to_integer(shift_right(to_signed(s_stg4A38,32),8));
                            s_stg4D39 <= to_integer(shift_right(to_signed(s_stg4A39,32),8));
                            s_stg4D40 <= to_integer(shift_right(to_signed(s_stg4A40,32),8));
                            s_stg4D41 <= to_integer(shift_right(to_signed(s_stg4A41,32),8));
                            s_stg4D42 <= to_integer(shift_right(to_signed(s_stg4A42,32),8));
                            s_stg4D43 <= to_integer(shift_right(to_signed(s_stg4A43,32),8));

                            s_stg4D52 <= to_integer(shift_right(to_signed(s_stg4A52,32),8));
                            s_stg4D53 <= to_integer(shift_right(to_signed(s_stg4A53,32),8));
                            s_stg4D54 <= to_integer(shift_right(to_signed(s_stg4A54,32),8));
                            s_stg4D55 <= to_integer(shift_right(to_signed(s_stg4A55,32),8));
                            s_stg4D56 <= to_integer(shift_right(to_signed(s_stg4A56,32),8));
                            s_stg4D57 <= to_integer(shift_right(to_signed(s_stg4A57,32),8));
                            s_stg4D58 <= to_integer(shift_right(to_signed(s_stg4A58,32),8));
                            s_stg4D59 <= to_integer(shift_right(to_signed(s_stg4A59,32),8));
                            s_stage5En <= '1';
                        end if;
                    end if;
                end process;

    stage5:     process(clk, res, s_stage5En)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg532 <= 0;
                            s_stg533 <= 0;
                            s_stg534 <= 0;
                            s_stg535 <= 0;
                            s_stg536 <= 0;
                            s_stg537 <= 0;
                            s_stg538 <= 0;
                            s_stg539 <= 0;
                            s_stg540 <= 0;
                            s_stg541 <= 0;
                            s_stg542 <= 0;
                            s_stg543 <= 0;
                            s_stg544 <= 0;
                            s_stg545 <= 0;
                            s_stg546 <= 0;
                            s_stg547 <= 0;
                            s_stg548 <= 0;
                            s_stg549 <= 0;
                            s_stg550 <= 0;
                            s_stg551 <= 0;
                            s_stg552 <= 0;
                            s_stg553 <= 0;
                            s_stg554 <= 0;
                            s_stg555 <= 0;
                            s_stg556 <= 0;
                            s_stg557 <= 0;
                            s_stg558 <= 0;
                            s_stg559 <= 0;
                            s_stg560 <= 0;
                            s_stg561 <= 0;
                            s_stg562 <= 0;
                            s_stg563 <= 0;
                            s_stage6MEn <= '0';
                        elsif(s_stage5En = '1') then
                            s_stg532 <= s_stg332 + s_stg4D39; 
                            s_stg533 <= s_stg333 + s_stg4D38;
                            s_stg534 <= s_stg334 + s_stg4D37;
                            s_stg535 <= s_stg335 + s_stg4D36;
                            s_stg536 <= s_stg335 - s_stg4D36;
                            s_stg537 <= s_stg334 - s_stg4D37;
                            s_stg538 <= s_stg333 - s_stg4D38; 
                            s_stg539 <= s_stg332 - s_stg4D39;
                            s_stg540 <= s_stg347 - s_stg4D40;
                            s_stg541 <= s_stg346 - s_stg4D41;
                            s_stg542 <= s_stg345 - s_stg4D42;
                            s_stg543 <= s_stg344 - s_stg4D43;
                            s_stg544 <= s_stg344 + s_stg4D43;
                            s_stg545 <= s_stg345 + s_stg4D42;
                            s_stg546 <= s_stg346 + s_stg4D41;
                            s_stg547 <= s_stg347 + s_stg4D40;
                            s_stg548 <= s_stg348 + s_stg4D55;
                            s_stg549 <= s_stg349 + s_stg4D54;
                            s_stg550 <= s_stg350 + s_stg4D53;
                            s_stg551 <= s_stg351 + s_stg4D52;
                            s_stg552 <= s_stg351 - s_stg4D52;
                            s_stg553 <= s_stg350 - s_stg4D53;
                            s_stg554 <= s_stg349 - s_stg4D54;
                            s_stg555 <= s_stg348 - s_stg4D55;
                            s_stg556 <= s_stg363 - s_stg4D56;
                            s_stg557 <= s_stg362 - s_stg4D57;
                            s_stg558 <= s_stg361 - s_stg4D58;
                            s_stg559 <= s_stg360 - s_stg4D59;
                            s_stg560 <= s_stg360 + s_stg4D59;
                            s_stg561 <= s_stg361 + s_stg4D58;
                            s_stg562 <= s_stg362 + s_stg4D57;
                            s_stg563 <= s_stg363 + s_stg4D56;
                            s_stage6MEn <= '1';
                        end if;
                    end if;
                end process;

    stage6M:    process(clk, res, s_stage6MEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg6M341 <= 0;
                            s_stg6M342 <= 0;
                            s_stg6M351 <= 0;
                            s_stg6M352 <= 0;
                            s_stg6M361 <= 0;
                            s_stg6M362 <= 0;
                            s_stg6M371 <= 0;
                            s_stg6M372 <= 0;
                            s_stg6M421 <= 0;
                            s_stg6M422 <= 0;
                            s_stg6M431 <= 0;
                            s_stg6M432 <= 0;
                            s_stg6M441 <= 0;
                            s_stg6M442 <= 0;
                            s_stg6M451 <= 0;
                            s_stg6M452 <= 0;
                            s_stg6M501 <= 0;
                            s_stg6M502 <= 0;
                            s_stg6M511 <= 0;
                            s_stg6M512 <= 0;
                            s_stg6M521 <= 0;
                            s_stg6M522 <= 0;
                            s_stg6M531 <= 0;
                            s_stg6M532 <= 0;
                            s_stg6M581 <= 0;
                            s_stg6M582 <= 0;
                            s_stg6M591 <= 0;
                            s_stg6M592 <= 0;
                            s_stg6M601 <= 0;
                            s_stg6M602 <= 0;
                            s_stg6M611 <= 0;
                            s_stg6M612 <= 0;
                            s_stage6AEn <= '0';
                        elsif(s_stage6MEn = '1') then
                            s_stg6M341 <= s_stg534*56;
                            s_stg6M342 <= s_stg534*252;
                            s_stg6M351 <= s_stg535*56;
                            s_stg6M352 <= s_stg535*252;
                            s_stg6M361 <= s_stg536*56;
                            s_stg6M362 <= s_stg536*252;
                            s_stg6M371 <= s_stg537*56;
                            s_stg6M372 <= s_stg537*252;
                            s_stg6M421 <= s_stg542*147;
                            s_stg6M422 <= s_stg542*216;
                            s_stg6M431 <= s_stg543*147;
                            s_stg6M432 <= s_stg543*216;
                            s_stg6M441 <= s_stg544*147;
                            s_stg6M442 <= s_stg544*216;
                            s_stg6M451 <= s_stg545*147;
                            s_stg6M452 <= s_stg545*216;
                            s_stg6M501 <= s_stg550*147;
                            s_stg6M502 <= s_stg550*216;
                            s_stg6M511 <= s_stg551*147;
                            s_stg6M512 <= s_stg551*216;
                            s_stg6M521 <= s_stg552*147;
                            s_stg6M522 <= s_stg552*216;
                            s_stg6M531 <= s_stg553*147;
                            s_stg6M532 <= s_stg553*216;
                            s_stg6M581 <= s_stg558*56;
                            s_stg6M582 <= s_stg558*252;
                            s_stg6M591 <= s_stg559*56;
                            s_stg6M592 <= s_stg559*252;
                            s_stg6M601 <= s_stg560*56;
                            s_stg6M602 <= s_stg560*252;
                            s_stg6M611 <= s_stg561*56;
                            s_stg6M612 <= s_stg561*252;
                            s_stage6AEn <= '1';
                        end if;
                    end if;
                end process;

    stage6A:    process(clk, res, s_stage6AEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg6A34 <= 0;
                            s_stg6A35 <= 0;
                            s_stg6A36 <= 0;
                            s_stg6A37 <= 0;
                            s_stg6A42 <= 0;
                            s_stg6A43 <= 0;
                            s_stg6A44 <= 0;
                            s_stg6A45 <= 0;
                            s_stg6A50 <= 0;
                            s_stg6A51 <= 0;
                            s_stg6A52 <= 0;
                            s_stg6A53 <= 0;
                            s_stg6A58 <= 0;
                            s_stg6A59 <= 0;
                            s_stg6A60 <= 0;
                            s_stg6A61 <= 0;
                            s_stage6DEn <= '0';
                        elsif(s_stage6AEn = '1') then
                            s_stg6A34 <= -s_stg6M342 + s_stg6M611;
                            s_stg6A35 <= -s_stg6M352 + s_stg6M601;
                            s_stg6A36 <= -s_stg6M361 - s_stg6M592;
                            s_stg6A37 <= -s_stg6M371 - s_stg6M582;
                            s_stg6A42 <= -s_stg6M421 + s_stg6M532;
                            s_stg6A43 <= -s_stg6M431 + s_stg6M522;
                            s_stg6A44 <= -s_stg6M442 - s_stg6M511;
                            s_stg6A45 <= -s_stg6M452 - s_stg6M501;
                            s_stg6A50 <=  s_stg6M502 - s_stg6M451;
                            s_stg6A51 <=  s_stg6M512 - s_stg6M441;
                            s_stg6A52 <=  s_stg6M521 + s_stg6M432;
                            s_stg6A53 <=  s_stg6M531 + s_stg6M422;
                            s_stg6A58 <=  s_stg6M581 - s_stg6M372;
                            s_stg6A59 <=  s_stg6M591 - s_stg6M362;
                            s_stg6A60 <=  s_stg6M602 + s_stg6M351;
                            s_stg6A61 <=  s_stg6M612 + s_stg6M341;
                            s_stage6DEn <= '1';
                        end if;
                    end if;
                end process;

    stage6D:    process(clk, res, s_stage6DEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg6D34 <= 0;
                            s_stg6D35 <= 0;
                            s_stg6D36 <= 0;
                            s_stg6D37 <= 0;
                            s_stg6D42 <= 0;
                            s_stg6D43 <= 0;
                            s_stg6D44 <= 0;
                            s_stg6D45 <= 0;
                            s_stg6D50 <= 0;
                            s_stg6D51 <= 0;
                            s_stg6D52 <= 0;
                            s_stg6D53 <= 0;
                            s_stg6D58 <= 0;
                            s_stg6D59 <= 0;
                            s_stg6D60 <= 0;
                            s_stg6D61 <= 0;
                            s_stage7En <= '0';
                        elsif(s_stage6DEn = '1') then
                            s_stg6D34 <= to_integer(shift_right(to_signed(s_stg6A34,32),8));
                            s_stg6D35 <= to_integer(shift_right(to_signed(s_stg6A35,32),8));
                            s_stg6D36 <= to_integer(shift_right(to_signed(s_stg6A36,32),8));
                            s_stg6D37 <= to_integer(shift_right(to_signed(s_stg6A37,32),8));
                            s_stg6D42 <= to_integer(shift_right(to_signed(s_stg6A42,32),8));
                            s_stg6D43 <= to_integer(shift_right(to_signed(s_stg6A43,32),8));
                            s_stg6D44 <= to_integer(shift_right(to_signed(s_stg6A44,32),8));
                            s_stg6D45 <= to_integer(shift_right(to_signed(s_stg6A45,32),8));
                            s_stg6D50 <= to_integer(shift_right(to_signed(s_stg6A50,32),8));
                            s_stg6D51 <= to_integer(shift_right(to_signed(s_stg6A51,32),8));
                            s_stg6D52 <= to_integer(shift_right(to_signed(s_stg6A52,32),8));
                            s_stg6D53 <= to_integer(shift_right(to_signed(s_stg6A53,32),8));
                            s_stg6D58 <= to_integer(shift_right(to_signed(s_stg6A58,32),8));
                            s_stg6D59 <= to_integer(shift_right(to_signed(s_stg6A59,32),8));
                            s_stg6D60 <= to_integer(shift_right(to_signed(s_stg6A60,32),8));
                            s_stg6D61 <= to_integer(shift_right(to_signed(s_stg6A61,32),8));
                            s_stage7En <= '1';
                        end if;
                    end if;
                end process;

    stage7:     process(clk, res, s_stage7En)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg732 <= 0;
                            s_stg733 <= 0;
                            s_stg734 <= 0;
                            s_stg735 <= 0;
                            s_stg736 <= 0;
                            s_stg737 <= 0;
                            s_stg738 <= 0;
                            s_stg739 <= 0;
                            s_stg740 <= 0;
                            s_stg741 <= 0;
                            s_stg742 <= 0;
                            s_stg743 <= 0;
                            s_stg744 <= 0;
                            s_stg745 <= 0;
                            s_stg746 <= 0;
                            s_stg747 <= 0;
                            s_stg748 <= 0;
                            s_stg749 <= 0;
                            s_stg750 <= 0;
                            s_stg751 <= 0;
                            s_stg752 <= 0;
                            s_stg753 <= 0;
                            s_stg754 <= 0;
                            s_stg755 <= 0;
                            s_stg756 <= 0;
                            s_stg757 <= 0;
                            s_stg758 <= 0;
                            s_stg759 <= 0;
                            s_stg760 <= 0;
                            s_stg761 <= 0;
                            s_stg762 <= 0;
                            s_stg763 <= 0;
                            s_stage8MEn <= '0';
                        elsif(s_stage7En = '1') then
                            s_stg732 <=  s_stg532  + s_stg6D35;
                            s_stg733 <=  s_stg533  + s_stg6D34;
                            s_stg734 <= -s_stg6D34 + s_stg533;
                            s_stg735 <= -s_stg6D35 + s_stg532;
                            s_stg736 <= -s_stg6D36 + s_stg539;
                            s_stg737 <= -s_stg6D37 + s_stg538;
                            s_stg738 <=  s_stg538  + s_stg6D37;
                            s_stg739 <=  s_stg539  + s_stg6D36;
                            s_stg740 <=  s_stg540  + s_stg6D43;
                            s_stg741 <=  s_stg541  + s_stg6D42;
                            s_stg742 <= -s_stg6D42 + s_stg541;
                            s_stg743 <= -s_stg6D43 + s_stg540;
                            s_stg744 <= -s_stg6D44 + s_stg547;
                            s_stg745 <= -s_stg6D45 + s_stg546;
                            s_stg746 <=  s_stg546  + s_stg6D45;
                            s_stg747 <=  s_stg547  + s_stg6D44;
                            s_stg748 <=  s_stg548  + s_stg6D51;
                            s_stg749 <=  s_stg549  + s_stg6D50;
                            s_stg750 <= -s_stg6D50 + s_stg549;
                            s_stg751 <= -s_stg6D51 + s_stg548;
                            s_stg752 <= -s_stg6D52 + s_stg555;
                            s_stg753 <= -s_stg6D53 + s_stg554;
                            s_stg754 <=  s_stg554  + s_stg6D53;
                            s_stg755 <=  s_stg555  + s_stg6D52;
                            s_stg756 <=  s_stg556  + s_stg6D59;
                            s_stg757 <=  s_stg557  + s_stg6D58;
                            s_stg758 <= -s_stg6D58 + s_stg557 ;
                            s_stg759 <= -s_stg6D59 + s_stg556;
                            s_stg760 <= -s_stg6D60 + s_stg563;
                            s_stg761 <= -s_stg6D61 + s_stg562;
                            s_stg762 <=  s_stg562  + s_stg6D61; 
                            s_stg763 <=  s_stg563  + s_stg6D60;
                            s_stage8MEn <= '1';
                        end if;
                    end if;
                end process;

    stage8M:    process(clk, res, s_stage8MEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg8M331 <= 0;
                            s_stg8M332 <= 0;
                            s_stg8M341 <= 0;
                            s_stg8M342 <= 0;
                            s_stg8M371 <= 0;
                            s_stg8M372 <= 0;
                            s_stg8M381 <= 0;
                            s_stg8M382 <= 0;
                            s_stg8M411 <= 0;
                            s_stg8M412 <= 0;
                            s_stg8M421 <= 0;
                            s_stg8M422 <= 0;
                            s_stg8M451 <= 0;
                            s_stg8M452 <= 0;
                            s_stg8M461 <= 0;
                            s_stg8M462 <= 0;
                            s_stg8M491 <= 0;
                            s_stg8M492 <= 0;
                            s_stg8M501 <= 0;
                            s_stg8M502 <= 0;
                            s_stg8M531 <= 0;
                            s_stg8M532 <= 0;
                            s_stg8M541 <= 0;
                            s_stg8M542 <= 0;
                            s_stg8M571 <= 0;
                            s_stg8M572 <= 0;
                            s_stg8M581 <= 0;
                            s_stg8M582 <= 0;
                            s_stg8M611 <= 0;
                            s_stg8M612 <= 0;
                            s_stg8M621 <= 0;
                            s_stg8M622 <= 0;
                            s_stage8AEn <= '0';
                        elsif(s_stage8MEn = '1') then
                            s_stg8M331 <= s_stg733*31;
                            s_stg8M332 <= s_stg733*255;
                            s_stg8M341 <= s_stg734*31;
                            s_stg8M342 <= s_stg734*255;
                            s_stg8M371 <= s_stg737*167;
                            s_stg8M372 <= s_stg737*202;
                            s_stg8M381 <= s_stg738*167;
                            s_stg8M382 <= s_stg738*202;
                            s_stg8M411 <= s_stg741*126;
                            s_stg8M412 <= s_stg741*229;
                            s_stg8M421 <= s_stg742*126;
                            s_stg8M422 <= s_stg742*229;
                            s_stg8M451 <= s_stg745*80;
                            s_stg8M452 <= s_stg745*247;
                            s_stg8M461 <= s_stg746*80;
                            s_stg8M462 <= s_stg746*247;
                            s_stg8M491 <= s_stg749*80;
                            s_stg8M492 <= s_stg749*247;
                            s_stg8M501 <= s_stg750*80;
                            s_stg8M502 <= s_stg750*247;
                            s_stg8M531 <= s_stg753*126;
                            s_stg8M532 <= s_stg753*229;
                            s_stg8M541 <= s_stg754*126;
                            s_stg8M542 <= s_stg754*229;
                            s_stg8M571 <= s_stg757*167;
                            s_stg8M572 <= s_stg757*202;
                            s_stg8M581 <= s_stg758*167;
                            s_stg8M582 <= s_stg758*202;
                            s_stg8M611 <= s_stg761*31;
                            s_stg8M612 <= s_stg761*255;
                            s_stg8M621 <= s_stg762*31;
                            s_stg8M622 <= s_stg762*255;
                            s_stage8AEn <= '1';
                        end if;
                    end if;
                end process;

    stage8A:    process(clk, res, s_stage8AEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg8A33 <= 0;
                            s_stg8A34 <= 0;
                            s_stg8A37 <= 0;
                            s_stg8A38 <= 0;
                            s_stg8A41 <= 0;
                            s_stg8A42 <= 0;
                            s_stg8A45 <= 0;
                            s_stg8A46 <= 0;
                            s_stg8A49 <= 0;
                            s_stg8A50 <= 0;
                            s_stg8A53 <= 0;
                            s_stg8A54 <= 0;
                            s_stg8A57 <= 0;
                            s_stg8A58 <= 0;
                            s_stg8A61 <= 0;
                            s_stg8A62 <= 0;
                            s_stage8DEn <= '0';
                        elsif(s_stage8AEn = '1') then
                            s_stg8A33 <= -s_stg8M332 + s_stg8M621;
                            s_stg8A34 <= -s_stg8M341 - s_stg8M612;
                            s_stg8A37 <= -s_stg8M371 + s_stg8M582;
                            s_stg8A38 <= -s_stg8M382 - s_stg8M571;
                            s_stg8A41 <= -s_stg8M412 + s_stg8M541;
                            s_stg8A42 <= -s_stg8M421 - s_stg8M532;
                            s_stg8A45 <= -s_stg8M451 + s_stg8M502;
                            s_stg8A46 <= -s_stg8M462 - s_stg8M491;
                            s_stg8A49 <=  s_stg8M492 - s_stg8M461;
                            s_stg8A50 <=  s_stg8M501 + s_stg8M452;
                            s_stg8A53 <=  s_stg8M531 - s_stg8M422;
                            s_stg8A54 <=  s_stg8M542 + s_stg8M411;
                            s_stg8A57 <=  s_stg8M572 - s_stg8M381;
                            s_stg8A58 <=  s_stg8M581 + s_stg8M372;
                            s_stg8A61 <=  s_stg8M611 - s_stg8M342;
                            s_stg8A62 <=  s_stg8M622 + s_stg8M331;
                            s_stage8DEn <= '1';
                        end if;
                    end if;
                end process;

    stage8D:    process(clk, res, s_stage8DEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg8D33 <= 0;
                            s_stg8D34 <= 0;
                            s_stg8D37 <= 0;
                            s_stg8D38 <= 0;
                            s_stg8D41 <= 0;
                            s_stg8D42 <= 0;
                            s_stg8D45 <= 0;
                            s_stg8D46 <= 0;
                            s_stg8D49 <= 0;
                            s_stg8D50 <= 0;
                            s_stg8D53 <= 0;
                            s_stg8D54 <= 0;
                            s_stg8D57 <= 0;
                            s_stg8D58 <= 0;
                            s_stg8D61 <= 0;
                            s_stg8D62 <= 0;
                            s_stage9En <= '0';
                        elsif(s_stage8DEn = '1') then
                            s_stg8D33 <= to_integer(shift_right(to_signed(s_stg8A33,32),8));
                            s_stg8D34 <= to_integer(shift_right(to_signed(s_stg8A34,32),8));
                            s_stg8D37 <= to_integer(shift_right(to_signed(s_stg8A37,32),8));
                            s_stg8D38 <= to_integer(shift_right(to_signed(s_stg8A38,32),8));
                            s_stg8D41 <= to_integer(shift_right(to_signed(s_stg8A41,32),8));
                            s_stg8D42 <= to_integer(shift_right(to_signed(s_stg8A42,32),8));
                            s_stg8D45 <= to_integer(shift_right(to_signed(s_stg8A45,32),8));
                            s_stg8D46 <= to_integer(shift_right(to_signed(s_stg8A46,32),8));
                            s_stg8D49 <= to_integer(shift_right(to_signed(s_stg8A49,32),8));
                            s_stg8D50 <= to_integer(shift_right(to_signed(s_stg8A50,32),8));
                            s_stg8D53 <= to_integer(shift_right(to_signed(s_stg8A53,32),8));
                            s_stg8D54 <= to_integer(shift_right(to_signed(s_stg8A54,32),8));
                            s_stg8D57 <= to_integer(shift_right(to_signed(s_stg8A57,32),8));
                            s_stg8D58 <= to_integer(shift_right(to_signed(s_stg8A58,32),8));
                            s_stg8D61 <= to_integer(shift_right(to_signed(s_stg8A61,32),8));
                            s_stg8D62 <= to_integer(shift_right(to_signed(s_stg8A62,32),8));
                            s_stage9En <= '1';
                        end if;
                    end if;
                end process;

    stage9:     process(clk, res, s_stage9En)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg932 <= 0;
                            s_stg933 <= 0;
                            s_stg934 <= 0;
                            s_stg935 <= 0;
                            s_stg936 <= 0;
                            s_stg937 <= 0;
                            s_stg938 <= 0;
                            s_stg939 <= 0;
                            s_stg940 <= 0;
                            s_stg941 <= 0;
                            s_stg942 <= 0;
                            s_stg943 <= 0;
                            s_stg944 <= 0;
                            s_stg945 <= 0;
                            s_stg946 <= 0;
                            s_stg947 <= 0;
                            s_stg948 <= 0;
                            s_stg949 <= 0;
                            s_stg950 <= 0;
                            s_stg951 <= 0;
                            s_stg952 <= 0;
                            s_stg953 <= 0;
                            s_stg954 <= 0;
                            s_stg955 <= 0;
                            s_stg956 <= 0;
                            s_stg957 <= 0;
                            s_stg958 <= 0;
                            s_stg959 <= 0;
                            s_stg960 <= 0;
                            s_stg961 <= 0;
                            s_stg962 <= 0;
                            s_stg963 <= 0;
                            s_stage10MEn <= '0';
                        elsif(s_stage9En = '1') then
                            s_stg932 <=  s_stg732  + s_stg8D33;
                            s_stg933 <= -s_stg8D33 + s_stg732; 
                            s_stg934 <= -s_stg8D34 + s_stg735;
                            s_stg935 <=  s_stg735  + s_stg8D34;
                            s_stg936 <=  s_stg736  + s_stg8D37;
                            s_stg937 <= -s_stg8D37 + s_stg736;
                            s_stg938 <= -s_stg8D38 + s_stg739;
                            s_stg939 <=  s_stg739  + s_stg8D38;
                            s_stg940 <=  s_stg740  + s_stg8D41;
                            s_stg941 <= -s_stg8D41 + s_stg740;
                            s_stg942 <= -s_stg8D42 + s_stg743;
                            s_stg943 <=  s_stg743  + s_stg8D42;
                            s_stg944 <=  s_stg744  + s_stg8D45;
                            s_stg945 <= -s_stg8D45 + s_stg744;
                            s_stg946 <= -s_stg8D46 + s_stg747;
                            s_stg947 <=  s_stg747  + s_stg8D46; 
                            s_stg948 <=  s_stg748  + s_stg8D49;
                            s_stg949 <= -s_stg8D49 + s_stg748;
                            s_stg950 <= -s_stg8D50 + s_stg751;
                            s_stg951 <=  s_stg751  + s_stg8D50;
                            s_stg952 <=  s_stg752  + s_stg8D53;
                            s_stg953 <= -s_stg8D53 + s_stg752;
                            s_stg954 <= -s_stg8D54 + s_stg755;
                            s_stg955 <=  s_stg755  + s_stg8D54;
                            s_stg956 <=  s_stg756  + s_stg8D57;
                            s_stg957 <= -s_stg8D57 + s_stg756;
                            s_stg958 <= -s_stg8D58 + s_stg759;
                            s_stg959 <=  s_stg759  + s_stg8D58;
                            s_stg960 <=  s_stg760  + s_stg8D61;
                            s_stg961 <= -s_stg8D61 + s_stg760;
                            s_stg962 <= -s_stg8D62 + s_stg763;
                            s_stg963 <=  s_stg763  + s_stg8D62;
                            s_stage10MEn <= '1';
                        end if;
                    end if;
                end process;

    
    stage10M:   process(clk, res, s_stage10MEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg10M321 <= 0;
                            s_stg10M322 <= 0;
                            s_stg10M331 <= 0;
                            s_stg10M332 <= 0;
                            s_stg10M341 <= 0;
                            s_stg10M342 <= 0;
                            s_stg10M351 <= 0;
                            s_stg10M352 <= 0;
                            s_stg10M361 <= 0;
                            s_stg10M362 <= 0;
                            s_stg10M371 <= 0;
                            s_stg10M372 <= 0;
                            s_stg10M381 <= 0;
                            s_stg10M382 <= 0;
                            s_stg10M391 <= 0;
                            s_stg10M392 <= 0;
                            s_stg10M401 <= 0;
                            s_stg10M402 <= 0;
                            s_stg10M411 <= 0;
                            s_stg10M412 <= 0;
                            s_stg10M421 <= 0;
                            s_stg10M422 <= 0;
                            s_stg10M431 <= 0;
                            s_stg10M432 <= 0;
                            s_stg10M441 <= 0;
                            s_stg10M442 <= 0;
                            s_stg10M451 <= 0;
                            s_stg10M452 <= 0;
                            s_stg10M461 <= 0;
                            s_stg10M462 <= 0;
                            s_stg10M471 <= 0;
                            s_stg10M472 <= 0;
                            s_stg10M481 <= 0;
                            s_stg10M482 <= 0;
                            s_stg10M491 <= 0;
                            s_stg10M492 <= 0;
                            s_stg10M501 <= 0;
                            s_stg10M502 <= 0;
                            s_stg10M511 <= 0;
                            s_stg10M512 <= 0;
                            s_stg10M521 <= 0;
                            s_stg10M522 <= 0;
                            s_stg10M531 <= 0;
                            s_stg10M532 <= 0;
                            s_stg10M541 <= 0;
                            s_stg10M542 <= 0;
                            s_stg10M551 <= 0;
                            s_stg10M552 <= 0;
                            s_stg10M561 <= 0;
                            s_stg10M562 <= 0;
                            s_stg10M571 <= 0;
                            s_stg10M572 <= 0;
                            s_stg10M581 <= 0;
                            s_stg10M582 <= 0;
                            s_stg10M591 <= 0;
                            s_stg10M592 <= 0;
                            s_stg10M601 <= 0;
                            s_stg10M602 <= 0;
                            s_stg10M611 <= 0;
                            s_stg10M612 <= 0;
                            s_stg10M621 <= 0;
                            s_stg10M622 <= 0;
                            s_stg10M631 <= 0;
                            s_stg10M632 <= 0;
                            s_stage10AEn <= '0';
                        elsif(s_stage10MEn = '1') then
                            s_stg10M321 <= s_stg932*13;
                            s_stg10M322 <= s_stg932*256;
                            s_stg10M331 <= s_stg933*181;
                            s_stg10M332 <= s_stg933*190;
                            s_stg10M341 <= s_stg934*109;
                            s_stg10M342 <= s_stg934*237;
                            s_stg10M351 <= s_stg935*98;
                            s_stg10M352 <= s_stg935*241;
                            s_stg10M361 <= s_stg936*62;
                            s_stg10M362 <= s_stg936*251;
                            s_stg10M371 <= s_stg937*142;
                            s_stg10M372 <= s_stg937*220;
                            s_stg10M381 <= s_stg938*152;
                            s_stg10M382 <= s_stg938*213;
                            s_stg10M391 <= s_stg939*50;
                            s_stg10M392 <= s_stg939*253;
                            s_stg10M401 <= s_stg940*38;
                            s_stg10M402 <= s_stg940*255;
                            s_stg10M411 <= s_stg941*162;
                            s_stg10M412 <= s_stg941*206;
                            s_stg10M421 <= s_stg942*132;
                            s_stg10M422 <= s_stg942*226;
                            s_stg10M431 <= s_stg943*74;
                            s_stg10M432 <= s_stg943*248;
                            s_stg10M441 <= s_stg944*86;
                            s_stg10M442 <= s_stg944*245;
                            s_stg10M451 <= s_stg945*121;
                            s_stg10M452 <= s_stg945*231;
                            s_stg10M461 <= s_stg946*172;
                            s_stg10M462 <= s_stg946*198;
                            s_stg10M471 <= s_stg947*25;
                            s_stg10M472 <= s_stg947*256;
                            s_stg10M481 <= s_stg948*25;
                            s_stg10M482 <= s_stg948*256;
                            s_stg10M491 <= s_stg949*172;
                            s_stg10M492 <= s_stg949*198;
                            s_stg10M501 <= s_stg950*121;
                            s_stg10M502 <= s_stg950*231;
                            s_stg10M511 <= s_stg951*86;
                            s_stg10M512 <= s_stg951*245;
                            s_stg10M521 <= s_stg952*74;
                            s_stg10M522 <= s_stg952*248;
                            s_stg10M531 <= s_stg953*132;
                            s_stg10M532 <= s_stg953*226;
                            s_stg10M541 <= s_stg954*162;
                            s_stg10M542 <= s_stg954*206;
                            s_stg10M551 <= s_stg955*38;
                            s_stg10M552 <= s_stg955*255;
                            s_stg10M561 <= s_stg956*50;
                            s_stg10M562 <= s_stg956*253;
                            s_stg10M571 <= s_stg957*152;
                            s_stg10M572 <= s_stg957*213;
                            s_stg10M581 <= s_stg958*142;
                            s_stg10M582 <= s_stg958*220;
                            s_stg10M591 <= s_stg959*62;
                            s_stg10M592 <= s_stg959*251;
                            s_stg10M601 <= s_stg960*98;
                            s_stg10M602 <= s_stg960*241;
                            s_stg10M611 <= s_stg961*109;
                            s_stg10M612 <= s_stg961*237;
                            s_stg10M621 <= s_stg962*181;
                            s_stg10M622 <= s_stg962*190;
                            s_stg10M631 <= s_stg963*13;
                            s_stg10M632 <= s_stg963*256;
                            s_stage10AEn <= '1';
                        end if;
                    end if;
                end process;

    stage10A:   process(clk, res, s_stage10AEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_stg10A32 <= 0;
                            s_stg10A33 <= 0;
                            s_stg10A34 <= 0;
                            s_stg10A35 <= 0;
                            s_stg10A36 <= 0;
                            s_stg10A37 <= 0;
                            s_stg10A38 <= 0;
                            s_stg10A39 <= 0;
                            s_stg10A40 <= 0;
                            s_stg10A41 <= 0;
                            s_stg10A42 <= 0;
                            s_stg10A43 <= 0;
                            s_stg10A44 <= 0;
                            s_stg10A45 <= 0;
                            s_stg10A46 <= 0;
                            s_stg10A47 <= 0;
                            s_stg10A48 <= 0;
                            s_stg10A49 <= 0;
                            s_stg10A50 <= 0;
                            s_stg10A51 <= 0;
                            s_stg10A52 <= 0;
                            s_stg10A53 <= 0;
                            s_stg10A54 <= 0;
                            s_stg10A55 <= 0;
                            s_stg10A56 <= 0;
                            s_stg10A57 <= 0;
                            s_stg10A58 <= 0;
                            s_stg10A59 <= 0;
                            s_stg10A60 <= 0;
                            s_stg10A61 <= 0;
                            s_stg10A62 <= 0;
                            s_stg10A63 <= 0;
                            s_valOut <= '0';
                        elsif(s_stage10AEn = '1') then
                            s_stg10A32 <= s_stg10M321 + s_stg10M632;
                            s_stg10A33 <= s_stg10M332 + s_stg10M621;
                            s_stg10A34 <= s_stg10M341 + s_stg10M612;
                            s_stg10A35 <= s_stg10M352 + s_stg10M601;
                            s_stg10A36 <= s_stg10M361 + s_stg10M592;
                            s_stg10A37 <= s_stg10M372 + s_stg10M581;
                            s_stg10A38 <= s_stg10M381 + s_stg10M572;
                            s_stg10A39 <= s_stg10M392 + s_stg10M561;
                            s_stg10A40 <= s_stg10M401 + s_stg10M552;
                            s_stg10A41 <= s_stg10M412 + s_stg10M541;
                            s_stg10A42 <= s_stg10M421 + s_stg10M532;
                            s_stg10A43 <= s_stg10M432 + s_stg10M521;
                            s_stg10A44 <= s_stg10M441 + s_stg10M512;
                            s_stg10A45 <= s_stg10M452 + s_stg10M501;
                            s_stg10A46 <= s_stg10M461 + s_stg10M492;
                            s_stg10A47 <= s_stg10M472 + s_stg10M481;
                            s_stg10A48 <= s_stg10M482 - s_stg10M471;
                            s_stg10A49 <= s_stg10M491 - s_stg10M462;
                            s_stg10A50 <= s_stg10M502 - s_stg10M451;
                            s_stg10A51 <= s_stg10M511 - s_stg10M442;
                            s_stg10A52 <= s_stg10M522 - s_stg10M431;
                            s_stg10A53 <= s_stg10M531 - s_stg10M422;
                            s_stg10A54 <= s_stg10M542 - s_stg10M411;
                            s_stg10A55 <= s_stg10M551 - s_stg10M402;
                            s_stg10A56 <= s_stg10M562 - s_stg10M391;
                            s_stg10A57 <= s_stg10M571 - s_stg10M382;
                            s_stg10A58 <= s_stg10M582 - s_stg10M371;
                            s_stg10A59 <= s_stg10M591 - s_stg10M362;
                            s_stg10A60 <= s_stg10M602 - s_stg10M351;
                            s_stg10A61 <= s_stg10M611 - s_stg10M342;
                            s_stg10A62 <= s_stg10M622 - s_stg10M331;
                            s_stg10A63 <= s_stg10M631 - s_stg10M322;
                            s_valOut <= '1';
                        end if;
                    end if;
                end process;                            


    outReg:     process(clk, res, s_valOut)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            dataOut32 <= 0;
                            dataOut33 <= 0;
                            dataOut34 <= 0;
                            dataOut35 <= 0;
                            dataOut36 <= 0;
                            dataOut37 <= 0;
                            dataOut38 <= 0;
                            dataOut39 <= 0;
                            dataOut40 <= 0;
                            dataOut41 <= 0;
                            dataOut42 <= 0;
                            dataOut43 <= 0;
                            dataOut44 <= 0;
                            dataOut45 <= 0;
                            dataOut46 <= 0;
                            dataOut47 <= 0;
                            dataOut48 <= 0;
                            dataOut49 <= 0;
                            dataOut50 <= 0;
                            dataOut51 <= 0;
                            dataOut52 <= 0;
                            dataOut53 <= 0;
                            dataOut54 <= 0;
                            dataOut55 <= 0;
                            dataOut56 <= 0;
                            dataOut57 <= 0;
                            dataOut58 <= 0;
                            dataOut59 <= 0;
                            dataOut60 <= 0;
                            dataOut61 <= 0;
                            dataOut62 <= 0;
                            dataOut63 <= 0;
                            validOut <= '0';
                        elsif(s_valOut = '1') then
                            dataOut32 <= to_integer(shift_right(to_signed(s_stg10A32,32), 8));
                            dataOut33 <= to_integer(shift_right(to_signed(s_stg10A33,32), 8));
                            dataOut34 <= to_integer(shift_right(to_signed(s_stg10A34,32), 8));
                            dataOut35 <= to_integer(shift_right(to_signed(s_stg10A35,32), 8));
                            dataOut36 <= to_integer(shift_right(to_signed(s_stg10A36,32), 8));
                            dataOut37 <= to_integer(shift_right(to_signed(s_stg10A37,32), 8));
                            dataOut38 <= to_integer(shift_right(to_signed(s_stg10A38,32), 8));
                            dataOut39 <= to_integer(shift_right(to_signed(s_stg10A39,32), 8));
                            dataOut40 <= to_integer(shift_right(to_signed(s_stg10A40,32), 8));
                            dataOut41 <= to_integer(shift_right(to_signed(s_stg10A41,32), 8));
                            dataOut42 <= to_integer(shift_right(to_signed(s_stg10A42,32), 8));
                            dataOut43 <= to_integer(shift_right(to_signed(s_stg10A43,32), 8));
                            dataOut44 <= to_integer(shift_right(to_signed(s_stg10A44,32), 8));
                            dataOut45 <= to_integer(shift_right(to_signed(s_stg10A45,32), 8));
                            dataOut46 <= to_integer(shift_right(to_signed(s_stg10A46,32), 8));
                            dataOut47 <= to_integer(shift_right(to_signed(s_stg10A47,32), 8));
                            dataOut48 <= to_integer(shift_right(to_signed(s_stg10A48,32), 8));
                            dataOut49 <= to_integer(shift_right(to_signed(s_stg10A49,32), 8));
                            dataOut50 <= to_integer(shift_right(to_signed(s_stg10A50,32), 8));
                            dataOut51 <= to_integer(shift_right(to_signed(s_stg10A51,32), 8));
                            dataOut52 <= to_integer(shift_right(to_signed(s_stg10A52,32), 8));
                            dataOut53 <= to_integer(shift_right(to_signed(s_stg10A53,32), 8));
                            dataOut54 <= to_integer(shift_right(to_signed(s_stg10A54,32), 8));
                            dataOut55 <= to_integer(shift_right(to_signed(s_stg10A55,32), 8));
                            dataOut56 <= to_integer(shift_right(to_signed(s_stg10A56,32), 8));
                            dataOut57 <= to_integer(shift_right(to_signed(s_stg10A57,32), 8));
                            dataOut58 <= to_integer(shift_right(to_signed(s_stg10A58,32), 8));
                            dataOut59 <= to_integer(shift_right(to_signed(s_stg10A59,32), 8));
                            dataOut60 <= to_integer(shift_right(to_signed(s_stg10A60,32), 8));
                            dataOut61 <= to_integer(shift_right(to_signed(s_stg10A61,32), 8));
                            dataOut62 <= to_integer(shift_right(to_signed(s_stg10A62,32), 8));
                            dataOut63 <= to_integer(shift_right(to_signed(s_stg10A63,32), 8));
                            validOut <= '1';
                        end if;
                    end if;
                end process;
end Behavioral;