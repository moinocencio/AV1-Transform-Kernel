----------------------------------------------------------------------------------
-- DCT64 Implementation, with same # bits in input and output and internal integer
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DCT6432 is
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
            dataIn32     : in    std_logic_vector(K - 1 downto 0);
            dataIn33     : in    std_logic_vector(K - 1 downto 0);
            dataIn34     : in    std_logic_vector(K - 1 downto 0);
            dataIn35     : in    std_logic_vector(K - 1 downto 0);
            dataIn36     : in    std_logic_vector(K - 1 downto 0);
            dataIn37     : in    std_logic_vector(K - 1 downto 0);
            dataIn38     : in    std_logic_vector(K - 1 downto 0);
            dataIn39     : in    std_logic_vector(K - 1 downto 0);
            dataIn40     : in    std_logic_vector(K - 1 downto 0);
            dataIn41     : in    std_logic_vector(K - 1 downto 0);
            dataIn42     : in    std_logic_vector(K - 1 downto 0);
            dataIn43     : in    std_logic_vector(K - 1 downto 0);
            dataIn44     : in    std_logic_vector(K - 1 downto 0);
            dataIn45     : in    std_logic_vector(K - 1 downto 0);
            dataIn46     : in    std_logic_vector(K - 1 downto 0);
            dataIn47     : in    std_logic_vector(K - 1 downto 0);
            dataIn48     : in    std_logic_vector(K - 1 downto 0);
            dataIn49     : in    std_logic_vector(K - 1 downto 0);
            dataIn50     : in    std_logic_vector(K - 1 downto 0);
            dataIn51     : in    std_logic_vector(K - 1 downto 0);
            dataIn52     : in    std_logic_vector(K - 1 downto 0);
            dataIn53     : in    std_logic_vector(K - 1 downto 0);
            dataIn54     : in    std_logic_vector(K - 1 downto 0);
            dataIn55     : in    std_logic_vector(K - 1 downto 0);
            dataIn56     : in    std_logic_vector(K - 1 downto 0);
            dataIn57     : in    std_logic_vector(K - 1 downto 0);
            dataIn58     : in    std_logic_vector(K - 1 downto 0);
            dataIn59     : in    std_logic_vector(K - 1 downto 0);
            dataIn60     : in    std_logic_vector(K - 1 downto 0);
            dataIn61     : in    std_logic_vector(K - 1 downto 0);
            dataIn62     : in    std_logic_vector(K - 1 downto 0);
            dataIn63     : in    std_logic_vector(K - 1 downto 0);
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
            dataOut32     : out    std_logic_vector(K - 1 downto 0);
            dataOut33     : out    std_logic_vector(K - 1 downto 0);
            dataOut34     : out    std_logic_vector(K - 1 downto 0);
            dataOut35     : out    std_logic_vector(K - 1 downto 0);
            dataOut36     : out    std_logic_vector(K - 1 downto 0);
            dataOut37     : out    std_logic_vector(K - 1 downto 0);
            dataOut38     : out    std_logic_vector(K - 1 downto 0);
            dataOut39     : out    std_logic_vector(K - 1 downto 0);
            dataOut40     : out    std_logic_vector(K - 1 downto 0);
            dataOut41     : out    std_logic_vector(K - 1 downto 0);
            dataOut42     : out    std_logic_vector(K - 1 downto 0);
            dataOut43     : out    std_logic_vector(K - 1 downto 0);
            dataOut44     : out    std_logic_vector(K - 1 downto 0);
            dataOut45     : out    std_logic_vector(K - 1 downto 0);
            dataOut46     : out    std_logic_vector(K - 1 downto 0);
            dataOut47     : out    std_logic_vector(K - 1 downto 0);
            dataOut48     : out    std_logic_vector(K - 1 downto 0);
            dataOut49     : out    std_logic_vector(K - 1 downto 0);
            dataOut50     : out    std_logic_vector(K - 1 downto 0);
            dataOut51     : out    std_logic_vector(K - 1 downto 0);
            dataOut52     : out    std_logic_vector(K - 1 downto 0);
            dataOut53     : out    std_logic_vector(K - 1 downto 0);
            dataOut54     : out    std_logic_vector(K - 1 downto 0);
            dataOut55     : out    std_logic_vector(K - 1 downto 0);
            dataOut56     : out    std_logic_vector(K - 1 downto 0);
            dataOut57     : out    std_logic_vector(K - 1 downto 0);
            dataOut58     : out    std_logic_vector(K - 1 downto 0);
            dataOut59     : out    std_logic_vector(K - 1 downto 0);
            dataOut60     : out    std_logic_vector(K - 1 downto 0);
            dataOut61     : out    std_logic_vector(K - 1 downto 0);
            dataOut62     : out    std_logic_vector(K - 1 downto 0);
            dataOut63     : out    std_logic_vector(K - 1 downto 0);
            -- Control Outputs
            validOut    : out   std_logic
    );
end DCT6432;

architecture Behavioral of DCT6432 is
    signal s_dataIn0, s_dataIn1, s_dataIn2, s_dataIn3, s_dataIn4, s_dataIn5, s_dataIn6, s_dataIn7, s_dataIn8, s_dataIn9, s_dataIn10, s_dataIn11, s_dataIn12, s_dataIn13, s_dataIn14, s_dataIn15, s_dataIn16, s_dataIn17, s_dataIn18, s_dataIn19, s_dataIn20, s_dataIn21, s_dataIn22, s_dataIn23, s_dataIn24, s_dataIn25, s_dataIn26, s_dataIn27, s_dataIn28, s_dataIn29, s_dataIn30, s_dataIn31, s_dataIn32, s_dataIn33, s_dataIn34, s_dataIn35, s_dataIn36, s_dataIn37, s_dataIn38, s_dataIn39, s_dataIn40, s_dataIn41, s_dataIn42, s_dataIn43, s_dataIn44, s_dataIn45, s_dataIn46, s_dataIn47, s_dataIn48, s_dataIn49, s_dataIn50, s_dataIn51, s_dataIn52, s_dataIn53, s_dataIn54,s_dataIn55, s_dataIn56, s_dataIn57, s_dataIn58, s_dataIn59, s_dataIn60, s_dataIn61, s_dataIn62, s_dataIn63          :   integer := 0;
    signal s_stg10, s_stg11, s_stg12, s_stg13, s_stg14, s_stg15, s_stg16, s_stg17, s_stg18, s_stg19, s_stg110, s_stg111, s_stg112, s_stg113, s_stg114, s_stg115, s_stg116, s_stg117, s_stg118, s_stg119, s_stg120, s_stg121, s_stg122, s_stg123, s_stg124, s_stg125, s_stg126, s_stg127, s_stg128, s_stg129, s_stg130, s_stg131, s_stg132, s_stg133, s_stg134, s_stg135, s_stg136, s_stg137, s_stg138, s_stg139, s_stg140, s_stg141, s_stg142, s_stg143, s_stg144, s_stg145, s_stg146, s_stg147, s_stg148, s_stg149, s_stg150, s_stg151, s_stg152, s_stg153, s_stg154,s_stg155, s_stg156, s_stg157, s_stg158, s_stg159, s_stg160, s_stg161, s_stg162, s_stg163          :   integer := 0;
    signal s_DCT32In0, s_DCT32In1, s_DCT32In2, s_DCT32In3, s_DCT32In4, s_DCT32In5, s_DCT32In6, s_DCT32In7, s_DCT32In8, s_DCT32In9, s_DCT32In10, s_DCT32In11, s_DCT32In12, s_DCT32In13, s_DCT32In14, s_DCT32In15, s_DCT32In16, s_DCT32In17, s_DCT32In18, s_DCT32In19, s_DCT32In20, s_DCT32In21, s_DCT32In22, s_DCT32In23, s_DCT32In24, s_DCT32In25, s_DCT32In26, s_DCT32In27, s_DCT32In28, s_DCT32In29, s_DCT32In30, s_DCT32In31       :   std_logic_vector(K-1 downto 0)     := (others => '0');
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
    --------
    signal s_dataOut0, s_dataOut1, s_dataOut2, s_dataOut3, s_dataOut4, s_dataOut5, s_dataOut6, s_dataOut7, s_dataOut8, s_dataOut9, s_dataOut10, s_dataOut11, s_dataOut12, s_dataOut13, s_dataOut14, s_dataOut15, s_dataOut16, s_dataOut17, s_dataOut18, s_dataOut19, s_dataOut20, s_dataOut21, s_dataOut22, s_dataOut23, s_dataOut24, s_dataOut25, s_dataOut26, s_dataOut27, s_dataOut28, s_dataOut29, s_dataOut30, s_dataOut31       :   std_logic_vector(K-1 downto 0)     := (others => '0');
    signal s_stage1En, s_stage2MEn, s_DCT32En, s_stage2AEn, s_stage2DEn, s_stage3En, s_stage4MEn, s_stage4AEn, s_stage4DEn, s_stage5En, s_stage6MEn, s_stage6AEn, s_stage6DEn, s_stage7En, s_stage8MEn, s_stage8AEn, s_stage8DEn, s_stage9En, s_stage10MEn, s_stage10AEn, s_valOutDCT32, s_outCastEn, s_end64, s_valOut       :   std_logic := '0';
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
                            s_dataIn32 <= 0;
                            s_dataIn33 <= 0;
                            s_dataIn34 <= 0;
                            s_dataIn35 <= 0;
                            s_dataIn36 <= 0;
                            s_dataIn37 <= 0;
                            s_dataIn38 <= 0;
                            s_dataIn39 <= 0;
                            s_dataIn40 <= 0;
                            s_dataIn41 <= 0;
                            s_dataIn42 <= 0;
                            s_dataIn43 <= 0;
                            s_dataIn44 <= 0;
                            s_dataIn45 <= 0;
                            s_dataIn46 <= 0;
                            s_dataIn47 <= 0;
                            s_dataIn48 <= 0;
                            s_dataIn49 <= 0;
                            s_dataIn50 <= 0;
                            s_dataIn51 <= 0;
                            s_dataIn52 <= 0;
                            s_dataIn53 <= 0;
                            s_dataIn54 <= 0;
                            s_dataIn55 <= 0;
                            s_dataIn56 <= 0;
                            s_dataIn57 <= 0;
                            s_dataIn58 <= 0;
                            s_dataIn59 <= 0;
                            s_dataIn60 <= 0;
                            s_dataIn61 <= 0;
                            s_dataIn62 <= 0;
                            s_dataIn63 <= 0;
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
                            s_dataIn32 <= to_integer(signed(dataIn32));
                            s_dataIn33 <= to_integer(signed(dataIn33));
                            s_dataIn34 <= to_integer(signed(dataIn34));
                            s_dataIn35 <= to_integer(signed(dataIn35));
                            s_dataIn36 <= to_integer(signed(dataIn36));
                            s_dataIn37 <= to_integer(signed(dataIn37));
                            s_dataIn38 <= to_integer(signed(dataIn38));
                            s_dataIn39 <= to_integer(signed(dataIn39));
                            s_dataIn40 <= to_integer(signed(dataIn40));
                            s_dataIn41 <= to_integer(signed(dataIn41));
                            s_dataIn42 <= to_integer(signed(dataIn42));
                            s_dataIn43 <= to_integer(signed(dataIn43));
                            s_dataIn44 <= to_integer(signed(dataIn44));
                            s_dataIn45 <= to_integer(signed(dataIn45));
                            s_dataIn46 <= to_integer(signed(dataIn46));
                            s_dataIn47 <= to_integer(signed(dataIn47));
                            s_dataIn48 <= to_integer(signed(dataIn48));
                            s_dataIn49 <= to_integer(signed(dataIn49));
                            s_dataIn50 <= to_integer(signed(dataIn50));
                            s_dataIn51 <= to_integer(signed(dataIn51));
                            s_dataIn52 <= to_integer(signed(dataIn52));
                            s_dataIn53 <= to_integer(signed(dataIn53));
                            s_dataIn54 <= to_integer(signed(dataIn54));
                            s_dataIn55 <= to_integer(signed(dataIn55));
                            s_dataIn56 <= to_integer(signed(dataIn56));
                            s_dataIn57 <= to_integer(signed(dataIn57));
                            s_dataIn58 <= to_integer(signed(dataIn58));
                            s_dataIn59 <= to_integer(signed(dataIn59));
                            s_dataIn60 <= to_integer(signed(dataIn60));
                            s_dataIn61 <= to_integer(signed(dataIn61));
                            s_dataIn62 <= to_integer(signed(dataIn62));
                            s_dataIn63 <= to_integer(signed(dataIn63));
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
                            s_stg132 <= 0;
                            s_stg133 <= 0;
                            s_stg134 <= 0;
                            s_stg135 <= 0;
                            s_stg136 <= 0;
                            s_stg137 <= 0;
                            s_stg138 <= 0;
                            s_stg139 <= 0;
                            s_stg140 <= 0;
                            s_stg141 <= 0;
                            s_stg142 <= 0;
                            s_stg143 <= 0;
                            s_stg144 <= 0;
                            s_stg145 <= 0;
                            s_stg146 <= 0;
                            s_stg147 <= 0;
                            s_stg148 <= 0;
                            s_stg149 <= 0;
                            s_stg150 <= 0;
                            s_stg151 <= 0;
                            s_stg152 <= 0;
                            s_stg153 <= 0;
                            s_stg154 <= 0;
                            s_stg155 <= 0;
                            s_stg156 <= 0;
                            s_stg157 <= 0;
                            s_stg158 <= 0;
                            s_stg159 <= 0;
                            s_stg160 <= 0;
                            s_stg161 <= 0;
                            s_stg162 <= 0;
                            s_stg163 <= 0;
                            s_stage2MEn <= '0';
                        elsif(s_stage1En = '1') then
                            s_stg10  <= s_dataIn0  + s_dataIn63;
                            s_stg11  <= s_dataIn1  + s_dataIn62;
                            s_stg12  <= s_dataIn2  + s_dataIn61;
                            s_stg13  <= s_dataIn3  + s_dataIn60;
                            s_stg14  <= s_dataIn4  + s_dataIn59;
                            s_stg15  <= s_dataIn5  + s_dataIn58;
                            s_stg16  <= s_dataIn6  + s_dataIn57;
                            s_stg17  <= s_dataIn7  + s_dataIn56;
                            s_stg18  <= s_dataIn8  + s_dataIn55;
                            s_stg19  <= s_dataIn9  + s_dataIn54;
                            s_stg110 <= s_dataIn10 + s_dataIn53;
                            s_stg111 <= s_dataIn11 + s_dataIn52;
                            s_stg112 <= s_dataIn12 + s_dataIn51;
                            s_stg113 <= s_dataIn13 + s_dataIn50;
                            s_stg114 <= s_dataIn14 + s_dataIn49;
                            s_stg115 <= s_dataIn15 + s_dataIn48;
                            s_stg116 <= s_dataIn16 + s_dataIn47;
                            s_stg117 <= s_dataIn17 + s_dataIn46;
                            s_stg118 <= s_dataIn18 + s_dataIn45;
                            s_stg119 <= s_dataIn19 + s_dataIn44;
                            s_stg120 <= s_dataIn20 + s_dataIn43;
                            s_stg121 <= s_dataIn21 + s_dataIn42;
                            s_stg122 <= s_dataIn22 + s_dataIn41;
                            s_stg123 <= s_dataIn23 + s_dataIn40;
                            s_stg124 <= s_dataIn24 + s_dataIn39;
                            s_stg125 <= s_dataIn25 + s_dataIn38;
                            s_stg126 <= s_dataIn26 + s_dataIn37;
                            s_stg127 <= s_dataIn27 + s_dataIn36;
                            s_stg128 <= s_dataIn28 + s_dataIn35;
                            s_stg129 <= s_dataIn29 + s_dataIn34;
                            s_stg130 <= s_dataIn30 + s_dataIn33;
                            s_stg131 <= s_dataIn31 + s_dataIn32;
                            s_stg132 <= s_dataIn31 - s_dataIn32;
                            s_stg133 <= s_dataIn30 - s_dataIn33;
                            s_stg134 <= s_dataIn29 - s_dataIn34;
                            s_stg135 <= s_dataIn28 - s_dataIn35;
                            s_stg136 <= s_dataIn27 - s_dataIn36;
                            s_stg137 <= s_dataIn26 - s_dataIn37;
                            s_stg138 <= s_dataIn25 - s_dataIn38;
                            s_stg139 <= s_dataIn24 - s_dataIn39;
                            s_stg140 <= s_dataIn23 - s_dataIn40;
                            s_stg141 <= s_dataIn22 - s_dataIn41;
                            s_stg142 <= s_dataIn21 - s_dataIn42;
                            s_stg143 <= s_dataIn20 - s_dataIn43;
                            s_stg144 <= s_dataIn19 - s_dataIn44;
                            s_stg145 <= s_dataIn18 - s_dataIn45;
                            s_stg146 <= s_dataIn17 - s_dataIn46;
                            s_stg147 <= s_dataIn16 - s_dataIn47;
                            s_stg148 <= s_dataIn15 - s_dataIn48;
                            s_stg149 <= s_dataIn14 - s_dataIn49;
                            s_stg150 <= s_dataIn13 - s_dataIn50;
                            s_stg151 <= s_dataIn12 - s_dataIn51;
                            s_stg152 <= s_dataIn11 - s_dataIn52;
                            s_stg153 <= s_dataIn10 - s_dataIn53;
                            s_stg154 <= s_dataIn9  - s_dataIn54;
                            s_stg155 <= s_dataIn8  - s_dataIn55;
                            s_stg156 <= s_dataIn7  - s_dataIn56;
                            s_stg157 <= s_dataIn6  - s_dataIn57;
                            s_stg158 <= s_dataIn5  - s_dataIn58;
                            s_stg159 <= s_dataIn4  - s_dataIn59;
                            s_stg160 <= s_dataIn3  - s_dataIn60;
                            s_stg161 <= s_dataIn2  - s_dataIn61;
                            s_stg162 <= s_dataIn1  - s_dataIn62;
                            s_stg163 <= s_dataIn0  - s_dataIn63;
                            s_stage2MEn <= '1';
                        end if;
                    end if;
                end process;

    DCT32InCast:process(clk, res, s_stage2MEn)
                begin
                    if(rising_edge(clk)) then
                        if(res = '1') then
                            s_DCT32In0  <= (others => '0');
                            s_DCT32In1  <= (others => '0');
                            s_DCT32In2  <= (others => '0');
                            s_DCT32In3  <= (others => '0');
                            s_DCT32In4  <= (others => '0');
                            s_DCT32In5  <= (others => '0');
                            s_DCT32In6  <= (others => '0');
                            s_DCT32In7  <= (others => '0');
                            s_DCT32In8  <= (others => '0');
                            s_DCT32In9  <= (others => '0');
                            s_DCT32In10 <= (others => '0');
                            s_DCT32In11 <= (others => '0');
                            s_DCT32In12 <= (others => '0');
                            s_DCT32In13 <= (others => '0');
                            s_DCT32In14 <= (others => '0');
                            s_DCT32In15 <= (others => '0');
                            s_DCT32In16 <= (others => '0');
                            s_DCT32In17 <= (others => '0');
                            s_DCT32In18 <= (others => '0');
                            s_DCT32In19 <= (others => '0');
                            s_DCT32In20 <= (others => '0');
                            s_DCT32In21 <= (others => '0');
                            s_DCT32In22 <= (others => '0');
                            s_DCT32In23 <= (others => '0');
                            s_DCT32In24 <= (others => '0');
                            s_DCT32In25 <= (others => '0');
                            s_DCT32In26 <= (others => '0');
                            s_DCT32In27 <= (others => '0');
                            s_DCT32In28 <= (others => '0');
                            s_DCT32In29 <= (others => '0');
                            s_DCT32In30 <= (others => '0');
                            s_DCT32In31 <= (others => '0');
                            s_DCT32En   <= '0';
                        elsif(s_stage2MEn = '1') then
                            s_DCT32In0  <=  std_logic_vector(to_signed(s_stg10,K));
                            s_DCT32In1  <=  std_logic_vector(to_signed(s_stg11,K));
                            s_DCT32In2  <=  std_logic_vector(to_signed(s_stg12,K));
                            s_DCT32In3  <=  std_logic_vector(to_signed(s_stg13,K));
                            s_DCT32In4  <=  std_logic_vector(to_signed(s_stg14,K));
                            s_DCT32In5  <=  std_logic_vector(to_signed(s_stg15,K));
                            s_DCT32In6  <=  std_logic_vector(to_signed(s_stg16,K));
                            s_DCT32In7  <=  std_logic_vector(to_signed(s_stg17,K));
                            s_DCT32In8  <=  std_logic_vector(to_signed(s_stg18,K));
                            s_DCT32In9  <=  std_logic_vector(to_signed(s_stg19,K));
                            s_DCT32In10 <=  std_logic_vector(to_signed(s_stg110,K));
                            s_DCT32In11 <=  std_logic_vector(to_signed(s_stg111,K));
                            s_DCT32In12 <=  std_logic_vector(to_signed(s_stg112,K));
                            s_DCT32In13 <=  std_logic_vector(to_signed(s_stg113,K));
                            s_DCT32In14 <=  std_logic_vector(to_signed(s_stg114,K));
                            s_DCT32In15 <=  std_logic_vector(to_signed(s_stg115,K));
                            s_DCT32In16 <=  std_logic_vector(to_signed(s_stg116,K));
                            s_DCT32In17 <=  std_logic_vector(to_signed(s_stg117,K));
                            s_DCT32In18 <=  std_logic_vector(to_signed(s_stg118,K));
                            s_DCT32In19 <=  std_logic_vector(to_signed(s_stg119,K));
                            s_DCT32In20 <=  std_logic_vector(to_signed(s_stg120,K));
                            s_DCT32In21 <=  std_logic_vector(to_signed(s_stg121,K));
                            s_DCT32In22 <=  std_logic_vector(to_signed(s_stg122,K));
                            s_DCT32In23 <=  std_logic_vector(to_signed(s_stg123,K));
                            s_DCT32In24 <=  std_logic_vector(to_signed(s_stg124,K));
                            s_DCT32In25 <=  std_logic_vector(to_signed(s_stg125,K));
                            s_DCT32In26 <=  std_logic_vector(to_signed(s_stg126,K));
                            s_DCT32In27 <=  std_logic_vector(to_signed(s_stg127,K));
                            s_DCT32In28 <=  std_logic_vector(to_signed(s_stg128,K));
                            s_DCT32In29 <=  std_logic_vector(to_signed(s_stg129,K));
                            s_DCT32In30 <=  std_logic_vector(to_signed(s_stg130,K));
                            s_DCT32In31 <=  std_logic_vector(to_signed(s_stg131,K));
                            s_DCT32En   <= '1';
                        end if;
                    end if;
                end process;

    DCT32:      entity work.DCT3232(Behavioral)
                generic map(K           =>  K)
                port map(   dataIn0   =>  s_DCT32In0,
                            dataIn1   =>  s_DCT32In1,
                            dataIn2   =>  s_DCT32In2,
                            dataIn3   =>  s_DCT32In3,
                            dataIn4   =>  s_DCT32In4,
                            dataIn5   =>  s_DCT32In5,
                            dataIn6   =>  s_DCT32In6,
                            dataIn7   =>  s_DCT32In7,
                            dataIn8   =>  s_DCT32In8,
                            dataIn9   =>  s_DCT32In9,
                            dataIn10  =>  s_DCT32In10,
                            dataIn11  =>  s_DCT32In11,
                            dataIn12  =>  s_DCT32In12,
                            dataIn13  =>  s_DCT32In13,
                            dataIn14  =>  s_DCT32In14,
                            dataIn15  =>  s_DCT32In15,
                            dataIn16  =>  s_DCT32In16,
                            dataIn17  =>  s_DCT32In17,
                            dataIn18  =>  s_DCT32In18,
                            dataIn19  =>  s_DCT32In19,
                            dataIn20  =>  s_DCT32In20,
                            dataIn21  =>  s_DCT32In21,
                            dataIn22  =>  s_DCT32In22,
                            dataIn23  =>  s_DCT32In23,
                            dataIn24  =>  s_DCT32In24,
                            dataIn25  =>  s_DCT32In25,
                            dataIn26  =>  s_DCT32In26,
                            dataIn27  =>  s_DCT32In27,
                            dataIn28  =>  s_DCT32In28,
                            dataIn29  =>  s_DCT32In29,
                            dataIn30  =>  s_DCT32In30,
                            dataIn31  =>  s_DCT32In31,
                            res       =>  res,
                            en        =>  s_DCT32En,
                            clk       =>  clk,
                            dataOut0  =>  s_dataOut0,
                            dataOut1  =>  s_dataOut1,
                            dataOut2  =>  s_dataOut2,
                            dataOut3  =>  s_dataOut3,
                            dataOut4  =>  s_dataOut4,
                            dataOut5  =>  s_dataOut5,
                            dataOut6  =>  s_dataOut6,
                            dataOut7  =>  s_dataOut7,
                            dataOut8  =>  s_dataOut8,
                            dataOut9  =>  s_dataOut9,
                            dataOut10 =>  s_dataOut10,
                            dataOut11 =>  s_dataOut11,
                            dataOut12 =>  s_dataOut12,
                            dataOut13 =>  s_dataOut13,
                            dataOut14 =>  s_dataOut14,
                            dataOut15 =>  s_dataOut15,
                            dataOut16 =>  s_dataOut16,
                            dataOut17 =>  s_dataOut17,
                            dataOut18 =>  s_dataOut18,
                            dataOut19 =>  s_dataOut19,
                            dataOut20 =>  s_dataOut20,
                            dataOut21 =>  s_dataOut21,
                            dataOut22 =>  s_dataOut22,
                            dataOut23 =>  s_dataOut23,
                            dataOut24 =>  s_dataOut24,
                            dataOut25 =>  s_dataOut25,
                            dataOut26 =>  s_dataOut26,
                            dataOut27 =>  s_dataOut27,
                            dataOut28 =>  s_dataOut28,
                            dataOut29 =>  s_dataOut29,
                            dataOut30 =>  s_dataOut30,
                            dataOut31 =>  s_dataOut31,
                            validOut  =>  s_valOutDCT32
                        );

    stage2M:    process(clk, res, s_stage2MEn)
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
                        elsif(s_stage2MEn = '1') then
                            s_stg2M40 <= s_stg140*185;
                            s_stg2M41 <= s_stg141*185;
                            s_stg2M42 <= s_stg142*185;
                            s_stg2M43 <= s_stg143*185;
                            s_stg2M44 <= s_stg144*185;
                            s_stg2M45 <= s_stg145*185;
                            s_stg2M46 <= s_stg146*185;
                            s_stg2M47 <= s_stg147*185;
                            s_stg2M48 <= s_stg148*185;
                            s_stg2M49 <= s_stg149*185;
                            s_stg2M50 <= s_stg150*185;
                            s_stg2M51 <= s_stg151*185;
                            s_stg2M52 <= s_stg152*185;
                            s_stg2M53 <= s_stg153*185;
                            s_stg2M54 <= s_stg154*185;
                            s_stg2M55 <= s_stg155*185;
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
                            s_stg2D40 <= to_integer(shift_right(to_signed(s_stg2A40,K),8));
                            s_stg2D41 <= to_integer(shift_right(to_signed(s_stg2A41,K),8));
                            s_stg2D42 <= to_integer(shift_right(to_signed(s_stg2A42,K),8));
                            s_stg2D43 <= to_integer(shift_right(to_signed(s_stg2A43,K),8));
                            s_stg2D44 <= to_integer(shift_right(to_signed(s_stg2A44,K),8));
                            s_stg2D45 <= to_integer(shift_right(to_signed(s_stg2A45,K),8));
                            s_stg2D46 <= to_integer(shift_right(to_signed(s_stg2A46,K),8));
                            s_stg2D47 <= to_integer(shift_right(to_signed(s_stg2A47,K),8));
                            s_stg2D48 <= to_integer(shift_right(to_signed(s_stg2A48,K),8));
                            s_stg2D49 <= to_integer(shift_right(to_signed(s_stg2A49,K),8));
                            s_stg2D50 <= to_integer(shift_right(to_signed(s_stg2A50,K),8));
                            s_stg2D51 <= to_integer(shift_right(to_signed(s_stg2A51,K),8));
                            s_stg2D52 <= to_integer(shift_right(to_signed(s_stg2A52,K),8));
                            s_stg2D53 <= to_integer(shift_right(to_signed(s_stg2A53,K),8));
                            s_stg2D54 <= to_integer(shift_right(to_signed(s_stg2A54,K),8));
                            s_stg2D55 <= to_integer(shift_right(to_signed(s_stg2A55,K),8));
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
                            s_stg332 <= s_stg132 + s_stg2D47;
                            s_stg333 <= s_stg133 + s_stg2D46;
                            s_stg334 <= s_stg134 + s_stg2D45;
                            s_stg335 <= s_stg135 + s_stg2D44;
                            s_stg336 <= s_stg136 + s_stg2D43;
                            s_stg337 <= s_stg137 + s_stg2D42;
                            s_stg338 <= s_stg138 + s_stg2D41;
                            s_stg339 <= s_stg139 + s_stg2D40;
                            s_stg340 <= s_stg139 - s_stg2D40;
                            s_stg341 <= s_stg138 - s_stg2D41;
                            s_stg342 <= s_stg137 - s_stg2D42;
                            s_stg343 <= s_stg136 - s_stg2D43;
                            s_stg344 <= s_stg135 - s_stg2D44;
                            s_stg345 <= s_stg134 - s_stg2D45;
                            s_stg346 <= s_stg133 - s_stg2D46;
                            s_stg347 <= s_stg132 - s_stg2D47;
                            s_stg348 <= s_stg163 - s_stg2D48;
                            s_stg349 <= s_stg162 - s_stg2D49;
                            s_stg350 <= s_stg161 - s_stg2D50;
                            s_stg351 <= s_stg160 - s_stg2D51;
                            s_stg352 <= s_stg159 - s_stg2D52;
                            s_stg353 <= s_stg158 - s_stg2D53;
                            s_stg354 <= s_stg157 - s_stg2D54;
                            s_stg355 <= s_stg156 - s_stg2D55;
                            s_stg356 <= s_stg156 + s_stg2D55;
                            s_stg357 <= s_stg157 + s_stg2D54;
                            s_stg358 <= s_stg158 + s_stg2D53;
                            s_stg359 <= s_stg159 + s_stg2D52;
                            s_stg360 <= s_stg160 + s_stg2D51;
                            s_stg361 <= s_stg161 + s_stg2D50;
                            s_stg362 <= s_stg162 + s_stg2D49;
                            s_stg363 <= s_stg163 + s_stg2D48;
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
                            s_stg4D36 <= to_integer(shift_right(to_signed(s_stg4A36,K),8));
                            s_stg4D37 <= to_integer(shift_right(to_signed(s_stg4A37,K),8));
                            s_stg4D38 <= to_integer(shift_right(to_signed(s_stg4A38,K),8));
                            s_stg4D39 <= to_integer(shift_right(to_signed(s_stg4A39,K),8));
                            s_stg4D40 <= to_integer(shift_right(to_signed(s_stg4A40,K),8));
                            s_stg4D41 <= to_integer(shift_right(to_signed(s_stg4A41,K),8));
                            s_stg4D42 <= to_integer(shift_right(to_signed(s_stg4A42,K),8));
                            s_stg4D43 <= to_integer(shift_right(to_signed(s_stg4A43,K),8));

                            s_stg4D52 <= to_integer(shift_right(to_signed(s_stg4A52,K),8));
                            s_stg4D53 <= to_integer(shift_right(to_signed(s_stg4A53,K),8));
                            s_stg4D54 <= to_integer(shift_right(to_signed(s_stg4A54,K),8));
                            s_stg4D55 <= to_integer(shift_right(to_signed(s_stg4A55,K),8));
                            s_stg4D56 <= to_integer(shift_right(to_signed(s_stg4A56,K),8));
                            s_stg4D57 <= to_integer(shift_right(to_signed(s_stg4A57,K),8));
                            s_stg4D58 <= to_integer(shift_right(to_signed(s_stg4A58,K),8));
                            s_stg4D59 <= to_integer(shift_right(to_signed(s_stg4A59,K),8));
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
                            s_stg6D34 <= to_integer(shift_right(to_signed(s_stg6A34,K),8));
                            s_stg6D35 <= to_integer(shift_right(to_signed(s_stg6A35,K),8));
                            s_stg6D36 <= to_integer(shift_right(to_signed(s_stg6A36,K),8));
                            s_stg6D37 <= to_integer(shift_right(to_signed(s_stg6A37,K),8));
                            s_stg6D42 <= to_integer(shift_right(to_signed(s_stg6A42,K),8));
                            s_stg6D43 <= to_integer(shift_right(to_signed(s_stg6A43,K),8));
                            s_stg6D44 <= to_integer(shift_right(to_signed(s_stg6A44,K),8));
                            s_stg6D45 <= to_integer(shift_right(to_signed(s_stg6A45,K),8));
                            s_stg6D50 <= to_integer(shift_right(to_signed(s_stg6A50,K),8));
                            s_stg6D51 <= to_integer(shift_right(to_signed(s_stg6A51,K),8));
                            s_stg6D52 <= to_integer(shift_right(to_signed(s_stg6A52,K),8));
                            s_stg6D53 <= to_integer(shift_right(to_signed(s_stg6A53,K),8));
                            s_stg6D58 <= to_integer(shift_right(to_signed(s_stg6A58,K),8));
                            s_stg6D59 <= to_integer(shift_right(to_signed(s_stg6A59,K),8));
                            s_stg6D60 <= to_integer(shift_right(to_signed(s_stg6A60,K),8));
                            s_stg6D61 <= to_integer(shift_right(to_signed(s_stg6A61,K),8));
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
                            s_stg8D33 <= to_integer(shift_right(to_signed(s_stg8A33,K),8));
                            s_stg8D34 <= to_integer(shift_right(to_signed(s_stg8A34,K),8));
                            s_stg8D37 <= to_integer(shift_right(to_signed(s_stg8A37,K),8));
                            s_stg8D38 <= to_integer(shift_right(to_signed(s_stg8A38,K),8));
                            s_stg8D41 <= to_integer(shift_right(to_signed(s_stg8A41,K),8));
                            s_stg8D42 <= to_integer(shift_right(to_signed(s_stg8A42,K),8));
                            s_stg8D45 <= to_integer(shift_right(to_signed(s_stg8A45,K),8));
                            s_stg8D46 <= to_integer(shift_right(to_signed(s_stg8A46,K),8));
                            s_stg8D49 <= to_integer(shift_right(to_signed(s_stg8A49,K),8));
                            s_stg8D50 <= to_integer(shift_right(to_signed(s_stg8A50,K),8));
                            s_stg8D53 <= to_integer(shift_right(to_signed(s_stg8A53,K),8));
                            s_stg8D54 <= to_integer(shift_right(to_signed(s_stg8A54,K),8));
                            s_stg8D57 <= to_integer(shift_right(to_signed(s_stg8A57,K),8));
                            s_stg8D58 <= to_integer(shift_right(to_signed(s_stg8A58,K),8));
                            s_stg8D61 <= to_integer(shift_right(to_signed(s_stg8A61,K),8));
                            s_stg8D62 <= to_integer(shift_right(to_signed(s_stg8A62,K),8));
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
                            --s_outCastEn <= '0';
                            s_end64 <= '0';
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
                            s_end64 <= '1';
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

    s_valOut    <=  s_valOutDCT32 and s_end64;

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
                            dataOut32 <= (others => '0');
                            dataOut33 <= (others => '0');
                            dataOut34 <= (others => '0');
                            dataOut35 <= (others => '0');
                            dataOut36 <= (others => '0');
                            dataOut37 <= (others => '0');
                            dataOut38 <= (others => '0');
                            dataOut39 <= (others => '0');
                            dataOut40 <= (others => '0');
                            dataOut41 <= (others => '0');
                            dataOut42 <= (others => '0');
                            dataOut43 <= (others => '0');
                            dataOut44 <= (others => '0');
                            dataOut45 <= (others => '0');
                            dataOut46 <= (others => '0');
                            dataOut47 <= (others => '0');
                            dataOut48 <= (others => '0');
                            dataOut49 <= (others => '0');
                            dataOut50 <= (others => '0');
                            dataOut51 <= (others => '0');
                            dataOut52 <= (others => '0');
                            dataOut53 <= (others => '0');
                            dataOut54 <= (others => '0');
                            dataOut55 <= (others => '0');
                            dataOut56 <= (others => '0');
                            dataOut57 <= (others => '0');
                            dataOut58 <= (others => '0');
                            dataOut59 <= (others => '0');
                            dataOut60 <= (others => '0');
                            dataOut61 <= (others => '0');
                            dataOut62 <= (others => '0');
                            dataOut63 <= (others => '0');
                            validOut <= '0';
                        elsif(s_valOut = '1') then
                            dataOut0  <= s_dataOut0;
                            dataOut1  <= std_logic_vector(shift_right(to_signed(s_stg10A32,K), 8));
                            dataOut2  <= s_dataOut1;
                            dataOut3  <= std_logic_vector(shift_right(to_signed(s_stg10A48,K), 8));
                            dataOut4  <= s_dataOut2;
                            dataOut5  <= std_logic_vector(shift_right(to_signed(s_stg10A40,K), 8));
                            dataOut6  <= s_dataOut3;
                            dataOut7  <= std_logic_vector(shift_right(to_signed(s_stg10A56,K), 8));
                            dataOut8  <= s_dataOut4;
                            dataOut9  <= std_logic_vector(shift_right(to_signed(s_stg10A36,K), 8));
                            dataOut10 <= s_dataOut5;
                            dataOut11 <= std_logic_vector(shift_right(to_signed(s_stg10A52,K), 8));
                            dataOut12 <= s_dataOut6;
                            dataOut13 <= std_logic_vector(shift_right(to_signed(s_stg10A44,K), 8));
                            dataOut14 <= s_dataOut7;
                            dataOut15 <= std_logic_vector(shift_right(to_signed(s_stg10A60,K), 8));
                            dataOut16 <= s_dataOut8;
                            dataOut17 <= std_logic_vector(shift_right(to_signed(s_stg10A34,K), 8));
                            dataOut18 <= s_dataOut9;
                            dataOut19 <= std_logic_vector(shift_right(to_signed(s_stg10A50,K), 8));
                            dataOut20 <= s_dataOut10;
                            dataOut21 <= std_logic_vector(shift_right(to_signed(s_stg10A42,K), 8));
                            dataOut22 <= s_dataOut11;
                            dataOut23 <= std_logic_vector(shift_right(to_signed(s_stg10A58,K), 8));
                            dataOut24 <= s_dataOut12;
                            dataOut25 <= std_logic_vector(shift_right(to_signed(s_stg10A38,K), 8));
                            dataOut26 <= s_dataOut13;
                            dataOut27 <= std_logic_vector(shift_right(to_signed(s_stg10A54,K), 8));
                            dataOut28 <= s_dataOut14;
                            dataOut29 <= std_logic_vector(shift_right(to_signed(s_stg10A46,K), 8));
                            dataOut30 <= s_dataOut15;
                            dataOut31 <= std_logic_vector(shift_right(to_signed(s_stg10A62,K), 8));
                            dataOut32 <= s_dataOut16;
                            dataOut33 <= std_logic_vector(shift_right(to_signed(s_stg10A33,K), 8));
                            dataOut34 <= s_dataOut17;
                            dataOut35 <= std_logic_vector(shift_right(to_signed(s_stg10A49,K), 8));
                            dataOut36 <= s_dataOut18;
                            dataOut37 <= std_logic_vector(shift_right(to_signed(s_stg10A41,K), 8));
                            dataOut38 <= s_dataOut19;
                            dataOut39 <= std_logic_vector(shift_right(to_signed(s_stg10A57,K), 8));
                            dataOut40 <= s_dataOut20;
                            dataOut41 <= std_logic_vector(shift_right(to_signed(s_stg10A37,K), 8));
                            dataOut42 <= s_dataOut21;
                            dataOut43 <= std_logic_vector(shift_right(to_signed(s_stg10A53,K), 8));
                            dataOut44 <= s_dataOut22;
                            dataOut45 <= std_logic_vector(shift_right(to_signed(s_stg10A45,K), 8));
                            dataOut46 <= s_dataOut23;
                            dataOut47 <= std_logic_vector(shift_right(to_signed(s_stg10A61,K), 8));
                            dataOut48 <= s_dataOut24;
                            dataOut49 <= std_logic_vector(shift_right(to_signed(s_stg10A35,K), 8));
                            dataOut50 <= s_dataOut25;
                            dataOut51 <= std_logic_vector(shift_right(to_signed(s_stg10A51,K), 8));
                            dataOut52 <= s_dataOut26;
                            dataOut53 <= std_logic_vector(shift_right(to_signed(s_stg10A43,K), 8));
                            dataOut54 <= s_dataOut27;
                            dataOut55 <= std_logic_vector(shift_right(to_signed(s_stg10A59,K), 8));
                            dataOut56 <= s_dataOut28;
                            dataOut57 <= std_logic_vector(shift_right(to_signed(s_stg10A39,K), 8));
                            dataOut58 <= s_dataOut29;
                            dataOut59 <= std_logic_vector(shift_right(to_signed(s_stg10A55,K), 8));
                            dataOut60 <= s_dataOut30;
                            dataOut61 <= std_logic_vector(shift_right(to_signed(s_stg10A47,K), 8));
                            dataOut62 <= s_dataOut31;
                            dataOut63 <= std_logic_vector(shift_right(to_signed(s_stg10A63,K), 8));
                            validOut <= '1';
                        end if;
                    end if;
                end process;
end Behavioral;