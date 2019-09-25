%% Parser for Global Transform Parameters
close all
clear
clc

%% Initializers
filen_CIF = 'TransformStats_waterfall.txt';
filen_HD = 'TransformStats_ducks.txt';
filen_FHD = 'TransformStats_park1080.txt';
filen_UHD = 'TransformStats_crosswalk.txt';

% Libaom Transform Enumerations
TXFM_TYPE_DCT4 = 0;
TXFM_TYPE_DCT8 = 1;
TXFM_TYPE_DCT16 = 2;
TXFM_TYPE_DCT32 = 3;
TXFM_TYPE_DCT64 = 4;
TXFM_TYPE_ADST4 = 5;
TXFM_TYPE_ADST8 = 6;
TXFM_TYPE_ADST16 = 7;
TXFM_TYPE_IDENTITY4 = 8;
TXFM_TYPE_IDENTITY8 = 9;
TXFM_TYPE_IDENTITY16 = 10;
TXFM_TYPE_IDENTITY32 = 11;


%% Open file and read vectors
% CIF
data_CIF = readmatrix(filen_CIF);

col_size_data_CIF = data_CIF(:,1);
col_type_data_CIF = data_CIF(:,2);
col_flip_data_CIF = data_CIF(:,3);
col_cosbit_data_CIF = data_CIF(:,4);

row_size_data_CIF = data_CIF(:,6);
row_type_data_CIF = data_CIF(:,7);
row_flip_data_CIF = data_CIF(:,8);
row_cosbit_data_CIF = data_CIF(:,9);

clear data_CIF

% HD
data_HD = readmatrix(filen_HD);

col_size_data_HD = data_HD(:,1);
col_type_data_HD = data_HD(:,2);
col_flip_data_HD = data_HD(:,3);
col_cosbit_data_HD = data_HD(:,4);

row_size_data_HD = data_HD(:,6);
row_type_data_HD = data_HD(:,7);
row_flip_data_HD = data_HD(:,8);
row_cosbit_data_HD = data_HD(:,9);

clear data_HD

% FHD
data_FHD = readmatrix(filen_FHD);

col_size_data_FHD = data_FHD(:,1);
col_type_data_FHD = data_FHD(:,2);
col_flip_data_FHD = data_FHD(:,3);
col_cosbit_data_FHD = data_FHD(:,4);

row_size_data_FHD = data_FHD(:,6);
row_type_data_FHD = data_FHD(:,7);
row_flip_data_FHD = data_FHD(:,8);
row_cosbit_data_FHD = data_FHD(:,9);

clear data_FHD

% UHD
data_UHD = readmatrix(filen_UHD);

col_size_data_UHD = data_UHD(:,1);
col_type_data_UHD = data_UHD(:,2);
col_flip_data_UHD = data_UHD(:,3);
col_cosbit_data_UHD = data_UHD(:,4);

row_size_data_UHD = data_UHD(:,6);
row_type_data_UHD = data_UHD(:,7);
row_flip_data_UHD = data_UHD(:,8);
row_cosbit_data_UHD = data_UHD(:,9);

lengths = [length(col_size_data_CIF); length(col_size_data_HD); length(col_size_data_FHD); length(col_size_data_UHD)];

clear data_UHD

%% Histogram Data
% Columns
col_sizes = zeros(4,5);     % 4 8 16 32 64
col_types = zeros(4,4);     % DCT ADST FADST IDTX
col_cosbit = zeros(4,7);    % 10 11 12 13 14 15 16
square_sizes = zeros(4,1);
square_types = zeros(4,1);

% CIF
col_sizes(1,1) = sum(col_size_data_CIF == 4);
col_sizes(1,2) = sum(col_size_data_CIF == 8);
col_sizes(1,3) = sum(col_size_data_CIF == 16);
col_sizes(1,4) = sum(col_size_data_CIF == 32);
col_sizes(1,5) = sum(col_size_data_CIF == 64);

% HD
col_sizes(2,1) = sum(col_size_data_HD == 4);
col_sizes(2,2) = sum(col_size_data_HD == 8);
col_sizes(2,3) = sum(col_size_data_HD == 16);
col_sizes(2,4) = sum(col_size_data_HD == 32);
col_sizes(2,5) = sum(col_size_data_HD == 64);

% FHD
col_sizes(3,1) = sum(col_size_data_FHD == 4);
col_sizes(3,2) = sum(col_size_data_FHD == 8);
col_sizes(3,3) = sum(col_size_data_FHD == 16);
col_sizes(3,4) = sum(col_size_data_FHD == 32);
col_sizes(3,5) = sum(col_size_data_FHD == 64);

% UHD
col_sizes(4,1) = sum(col_size_data_UHD == 4);
col_sizes(4,2) = sum(col_size_data_UHD == 8);
col_sizes(4,3) = sum(col_size_data_UHD == 16);
col_sizes(4,4) = sum(col_size_data_UHD == 32);
col_sizes(4,5) = sum(col_size_data_UHD == 64);


% CIF
col_types(1,1) =  sum(col_type_data_CIF == TXFM_TYPE_DCT4) + ...
                sum(col_type_data_CIF == TXFM_TYPE_DCT8) + ...
                sum(col_type_data_CIF == TXFM_TYPE_DCT16) + ...
                sum(col_type_data_CIF == TXFM_TYPE_DCT32) + ...
                sum(col_type_data_CIF == TXFM_TYPE_DCT64);

col_types(1,2) =  sum((col_type_data_CIF == TXFM_TYPE_ADST4) & (col_flip_data_CIF == 0)) + ...
                sum((col_type_data_CIF == TXFM_TYPE_ADST8) & (col_flip_data_CIF == 0)) + ...
                sum((col_type_data_CIF == TXFM_TYPE_ADST16) & (col_flip_data_CIF == 0));

col_types(1,3) =  sum((col_type_data_CIF == TXFM_TYPE_ADST4) & (col_flip_data_CIF == 1)) + ...
                sum((col_type_data_CIF == TXFM_TYPE_ADST8) & (col_flip_data_CIF == 1)) + ...
                sum((col_type_data_CIF == TXFM_TYPE_ADST16) & (col_flip_data_CIF == 1));

col_types(1,4) =  sum(col_type_data_CIF == TXFM_TYPE_IDENTITY4) + ...
                sum(col_type_data_CIF == TXFM_TYPE_IDENTITY8) + ...
                sum(col_type_data_CIF == TXFM_TYPE_IDENTITY16) + ...
                sum(col_type_data_CIF == TXFM_TYPE_IDENTITY32);

% HD
col_types(2,1) =  sum(col_type_data_HD == TXFM_TYPE_DCT4) + ...
                sum(col_type_data_HD == TXFM_TYPE_DCT8) + ...
                sum(col_type_data_HD == TXFM_TYPE_DCT16) + ...
                sum(col_type_data_HD == TXFM_TYPE_DCT32) + ...
                sum(col_type_data_HD == TXFM_TYPE_DCT64);

col_types(2,2) =  sum((col_type_data_HD == TXFM_TYPE_ADST4) & (col_flip_data_HD == 0)) + ...
                sum((col_type_data_HD == TXFM_TYPE_ADST8) & (col_flip_data_HD == 0)) + ...
                sum((col_type_data_HD == TXFM_TYPE_ADST16) & (col_flip_data_HD == 0));

col_types(2,3) =  sum((col_type_data_HD == TXFM_TYPE_ADST4) & (col_flip_data_HD == 1)) + ...
                sum((col_type_data_HD == TXFM_TYPE_ADST8) & (col_flip_data_HD == 1)) + ...
                sum((col_type_data_HD == TXFM_TYPE_ADST16) & (col_flip_data_HD == 1));

col_types(2,4) =  sum(col_type_data_HD == TXFM_TYPE_IDENTITY4) + ...
                sum(col_type_data_HD == TXFM_TYPE_IDENTITY8) + ...
                sum(col_type_data_HD == TXFM_TYPE_IDENTITY16) + ...
                sum(col_type_data_HD == TXFM_TYPE_IDENTITY32);

% FHD
col_types(3,1) =  sum(col_type_data_FHD == TXFM_TYPE_DCT4) + ...
                sum(col_type_data_FHD == TXFM_TYPE_DCT8) + ...
                sum(col_type_data_FHD == TXFM_TYPE_DCT16) + ...
                sum(col_type_data_FHD == TXFM_TYPE_DCT32) + ...
                sum(col_type_data_FHD == TXFM_TYPE_DCT64);

col_types(3,2) =  sum((col_type_data_FHD == TXFM_TYPE_ADST4) & (col_flip_data_FHD == 0)) + ...
                sum((col_type_data_FHD == TXFM_TYPE_ADST8) & (col_flip_data_FHD == 0)) + ...
                sum((col_type_data_FHD == TXFM_TYPE_ADST16) & (col_flip_data_FHD == 0));

col_types(3,3) =  sum((col_type_data_FHD == TXFM_TYPE_ADST4) & (col_flip_data_FHD == 1)) + ...
                sum((col_type_data_FHD == TXFM_TYPE_ADST8) & (col_flip_data_FHD == 1)) + ...
                sum((col_type_data_FHD == TXFM_TYPE_ADST16) & (col_flip_data_FHD == 1));

col_types(3,4) =  sum(col_type_data_FHD == TXFM_TYPE_IDENTITY4) + ...
                sum(col_type_data_FHD == TXFM_TYPE_IDENTITY8) + ...
                sum(col_type_data_FHD == TXFM_TYPE_IDENTITY16) + ...
                sum(col_type_data_FHD == TXFM_TYPE_IDENTITY32);

% UHD                
col_types(4,1) =  sum(col_type_data_UHD == TXFM_TYPE_DCT4) + ...
                sum(col_type_data_UHD == TXFM_TYPE_DCT8) + ...
                sum(col_type_data_UHD == TXFM_TYPE_DCT16) + ...
                sum(col_type_data_UHD == TXFM_TYPE_DCT32) + ...
                sum(col_type_data_UHD == TXFM_TYPE_DCT64);

col_types(4,2) =  sum((col_type_data_UHD == TXFM_TYPE_ADST4) & (col_flip_data_UHD == 0)) + ...
                sum((col_type_data_UHD == TXFM_TYPE_ADST8) & (col_flip_data_UHD == 0)) + ...
                sum((col_type_data_UHD == TXFM_TYPE_ADST16) & (col_flip_data_UHD == 0));

col_types(4,3) =  sum((col_type_data_UHD == TXFM_TYPE_ADST4) & (col_flip_data_UHD == 1)) + ...
                sum((col_type_data_UHD == TXFM_TYPE_ADST8) & (col_flip_data_UHD == 1)) + ...
                sum((col_type_data_UHD == TXFM_TYPE_ADST16) & (col_flip_data_UHD == 1));

col_types(4,4) =  sum(col_type_data_UHD == TXFM_TYPE_IDENTITY4) + ...
                sum(col_type_data_UHD == TXFM_TYPE_IDENTITY8) + ...
                sum(col_type_data_UHD == TXFM_TYPE_IDENTITY16) + ...
                sum(col_type_data_UHD == TXFM_TYPE_IDENTITY32);

% CIF
col_cosbit(1,1) = sum(col_cosbit_data_CIF == 10);
col_cosbit(1,2) = sum(col_cosbit_data_CIF == 11);
col_cosbit(1,3) = sum(col_cosbit_data_CIF == 12);
col_cosbit(1,4) = sum(col_cosbit_data_CIF == 13);
col_cosbit(1,5) = sum(col_cosbit_data_CIF == 14);
col_cosbit(1,6) = sum(col_cosbit_data_CIF == 15);
col_cosbit(1,7) = sum(col_cosbit_data_CIF == 16);

% HD
col_cosbit(2,1) = sum(col_cosbit_data_HD == 10);
col_cosbit(2,2) = sum(col_cosbit_data_HD == 11);
col_cosbit(2,3) = sum(col_cosbit_data_HD == 12);
col_cosbit(2,4) = sum(col_cosbit_data_HD == 13);
col_cosbit(2,5) = sum(col_cosbit_data_HD == 14);
col_cosbit(2,6) = sum(col_cosbit_data_HD == 15);
col_cosbit(2,7) = sum(col_cosbit_data_HD == 16);

% FHD
col_cosbit(3,1) = sum(col_cosbit_data_FHD == 10);
col_cosbit(3,2) = sum(col_cosbit_data_FHD == 11);
col_cosbit(3,3) = sum(col_cosbit_data_FHD == 12);
col_cosbit(3,4) = sum(col_cosbit_data_FHD == 13);
col_cosbit(3,5) = sum(col_cosbit_data_FHD == 14);
col_cosbit(3,6) = sum(col_cosbit_data_FHD == 15);
col_cosbit(3,7) = sum(col_cosbit_data_FHD == 16);

% UHD
col_cosbit(4,1) = sum(col_cosbit_data_UHD == 10);
col_cosbit(4,2) = sum(col_cosbit_data_UHD == 11);
col_cosbit(4,3) = sum(col_cosbit_data_UHD == 12);
col_cosbit(4,4) = sum(col_cosbit_data_UHD == 13);
col_cosbit(4,5) = sum(col_cosbit_data_UHD == 14);
col_cosbit(4,6) = sum(col_cosbit_data_UHD == 15);
col_cosbit(4,7) = sum(col_cosbit_data_UHD == 16);

% Rows
row_sizes = zeros(4,5);     % 4 8 16 32 64
row_types = zeros(4,4);     % DCT ADST FADST IDTX
row_cosbit = zeros(4,7);    % 10 11 12 13 14 15 16

% CIF
row_sizes(1,1) = sum(row_size_data_CIF == 4);
row_sizes(1,2) = sum(row_size_data_CIF == 8);
row_sizes(1,3) = sum(row_size_data_CIF == 16);
row_sizes(1,4) = sum(row_size_data_CIF == 32);
row_sizes(1,5) = sum(row_size_data_CIF == 64);

% HD
row_sizes(2,1) = sum(row_size_data_HD == 4);
row_sizes(2,2) = sum(row_size_data_HD == 8);
row_sizes(2,3) = sum(row_size_data_HD == 16);
row_sizes(2,4) = sum(row_size_data_HD == 32);
row_sizes(2,5) = sum(row_size_data_HD == 64);

% FHD
row_sizes(3,1) = sum(row_size_data_FHD == 4);
row_sizes(3,2) = sum(row_size_data_FHD == 8);
row_sizes(3,3) = sum(row_size_data_FHD == 16);
row_sizes(3,4) = sum(row_size_data_FHD == 32);
row_sizes(3,5) = sum(row_size_data_FHD == 64);

% UHD
row_sizes(4,1) = sum(row_size_data_UHD == 4);
row_sizes(4,2) = sum(row_size_data_UHD == 8);
row_sizes(4,3) = sum(row_size_data_UHD == 16);
row_sizes(4,4) = sum(row_size_data_UHD == 32);
row_sizes(4,5) = sum(row_size_data_UHD == 64);


% CIF
row_types(1,1) =  sum(row_type_data_CIF == TXFM_TYPE_DCT4) + ...
                sum(row_type_data_CIF == TXFM_TYPE_DCT8) + ...
                sum(row_type_data_CIF == TXFM_TYPE_DCT16) + ...
                sum(row_type_data_CIF == TXFM_TYPE_DCT32) + ...
                sum(row_type_data_CIF == TXFM_TYPE_DCT64);

row_types(1,2) =  sum((row_type_data_CIF == TXFM_TYPE_ADST4) & (row_flip_data_CIF == 0)) + ...
                sum((row_type_data_CIF == TXFM_TYPE_ADST8) & (row_flip_data_CIF == 0)) + ...
                sum((row_type_data_CIF == TXFM_TYPE_ADST16) & (row_flip_data_CIF == 0));

row_types(1,3) =  sum((row_type_data_CIF == TXFM_TYPE_ADST4) & (row_flip_data_CIF == 1)) + ...
                sum((row_type_data_CIF == TXFM_TYPE_ADST8) & (row_flip_data_CIF == 1)) + ...
                sum((row_type_data_CIF == TXFM_TYPE_ADST16) & (row_flip_data_CIF == 1));

row_types(1,4) =  sum(row_type_data_CIF == TXFM_TYPE_IDENTITY4) + ...
                sum(row_type_data_CIF == TXFM_TYPE_IDENTITY8) + ...
                sum(row_type_data_CIF == TXFM_TYPE_IDENTITY16) + ...
                sum(row_type_data_CIF == TXFM_TYPE_IDENTITY32);

% HD
row_types(2,1) =  sum(row_type_data_HD == TXFM_TYPE_DCT4) + ...
                sum(row_type_data_HD == TXFM_TYPE_DCT8) + ...
                sum(row_type_data_HD == TXFM_TYPE_DCT16) + ...
                sum(row_type_data_HD == TXFM_TYPE_DCT32) + ...
                sum(row_type_data_HD == TXFM_TYPE_DCT64);

row_types(2,2) =  sum((row_type_data_HD == TXFM_TYPE_ADST4) & (row_flip_data_HD == 0)) + ...
                sum((row_type_data_HD == TXFM_TYPE_ADST8) & (row_flip_data_HD == 0)) + ...
                sum((row_type_data_HD == TXFM_TYPE_ADST16) & (row_flip_data_HD == 0));

row_types(2,3) =  sum((row_type_data_HD == TXFM_TYPE_ADST4) & (row_flip_data_HD == 1)) + ...
                sum((row_type_data_HD == TXFM_TYPE_ADST8) & (row_flip_data_HD == 1)) + ...
                sum((row_type_data_HD == TXFM_TYPE_ADST16) & (row_flip_data_HD == 1));

row_types(2,4) =  sum(row_type_data_HD == TXFM_TYPE_IDENTITY4) + ...
                sum(row_type_data_HD == TXFM_TYPE_IDENTITY8) + ...
                sum(row_type_data_HD == TXFM_TYPE_IDENTITY16) + ...
                sum(row_type_data_HD == TXFM_TYPE_IDENTITY32);

% FHD
row_types(3,1) =  sum(row_type_data_FHD == TXFM_TYPE_DCT4) + ...
                sum(row_type_data_FHD == TXFM_TYPE_DCT8) + ...
                sum(row_type_data_FHD == TXFM_TYPE_DCT16) + ...
                sum(row_type_data_FHD == TXFM_TYPE_DCT32) + ...
                sum(row_type_data_FHD == TXFM_TYPE_DCT64);

row_types(3,2) =  sum((row_type_data_FHD == TXFM_TYPE_ADST4) & (row_flip_data_FHD == 0)) + ...
                sum((row_type_data_FHD == TXFM_TYPE_ADST8) & (row_flip_data_FHD == 0)) + ...
                sum((row_type_data_FHD == TXFM_TYPE_ADST16) & (row_flip_data_FHD == 0));

row_types(3,3) =  sum((row_type_data_FHD == TXFM_TYPE_ADST4) & (row_flip_data_FHD == 1)) + ...
                sum((row_type_data_FHD == TXFM_TYPE_ADST8) & (row_flip_data_FHD == 1)) + ...
                sum((row_type_data_FHD == TXFM_TYPE_ADST16) & (row_flip_data_FHD == 1));

row_types(3,4) =  sum(row_type_data_FHD == TXFM_TYPE_IDENTITY4) + ...
                sum(row_type_data_FHD == TXFM_TYPE_IDENTITY8) + ...
                sum(row_type_data_FHD == TXFM_TYPE_IDENTITY16) + ...
                sum(row_type_data_FHD == TXFM_TYPE_IDENTITY32);

% UHD                
row_types(4,1) =  sum(row_type_data_UHD == TXFM_TYPE_DCT4) + ...
                sum(row_type_data_UHD == TXFM_TYPE_DCT8) + ...
                sum(row_type_data_UHD == TXFM_TYPE_DCT16) + ...
                sum(row_type_data_UHD == TXFM_TYPE_DCT32) + ...
                sum(row_type_data_UHD == TXFM_TYPE_DCT64);

row_types(4,2) =  sum((row_type_data_UHD == TXFM_TYPE_ADST4) & (row_flip_data_UHD == 0)) + ...
                sum((row_type_data_UHD == TXFM_TYPE_ADST8) & (row_flip_data_UHD == 0)) + ...
                sum((row_type_data_UHD == TXFM_TYPE_ADST16) & (row_flip_data_UHD == 0));

row_types(4,3) =  sum((row_type_data_UHD == TXFM_TYPE_ADST4) & (row_flip_data_UHD == 1)) + ...
                sum((row_type_data_UHD == TXFM_TYPE_ADST8) & (row_flip_data_UHD == 1)) + ...
                sum((row_type_data_UHD == TXFM_TYPE_ADST16) & (row_flip_data_UHD == 1));

row_types(4,4) =  sum(row_type_data_UHD == TXFM_TYPE_IDENTITY4) + ...
                sum(row_type_data_UHD == TXFM_TYPE_IDENTITY8) + ...
                sum(row_type_data_UHD == TXFM_TYPE_IDENTITY16) + ...
                sum(row_type_data_UHD == TXFM_TYPE_IDENTITY32);

% CIF
row_cosbit(1,1) = sum(row_cosbit_data_CIF == 10);
row_cosbit(1,2) = sum(row_cosbit_data_CIF == 11);
row_cosbit(1,3) = sum(row_cosbit_data_CIF == 12);
row_cosbit(1,4) = sum(row_cosbit_data_CIF == 13);
row_cosbit(1,5) = sum(row_cosbit_data_CIF == 14);
row_cosbit(1,6) = sum(row_cosbit_data_CIF == 15);
row_cosbit(1,7) = sum(row_cosbit_data_CIF == 16);

% CIF
row_cosbit(2,1) = sum(row_cosbit_data_HD == 10);
row_cosbit(2,2) = sum(row_cosbit_data_HD == 11);
row_cosbit(2,3) = sum(row_cosbit_data_HD == 12);
row_cosbit(2,4) = sum(row_cosbit_data_HD == 13);
row_cosbit(2,5) = sum(row_cosbit_data_HD == 14);
row_cosbit(2,6) = sum(row_cosbit_data_HD == 15);
row_cosbit(2,7) = sum(row_cosbit_data_HD == 16);

% CIF
row_cosbit(3,1) = sum(row_cosbit_data_FHD == 10);
row_cosbit(3,2) = sum(row_cosbit_data_FHD == 11);
row_cosbit(3,3) = sum(row_cosbit_data_FHD == 12);
row_cosbit(3,4) = sum(row_cosbit_data_FHD == 13);
row_cosbit(3,5) = sum(row_cosbit_data_FHD == 14);
row_cosbit(3,6) = sum(row_cosbit_data_FHD == 15);
row_cosbit(3,7) = sum(row_cosbit_data_FHD == 16);

% CIF
row_cosbit(4,1) = sum(row_cosbit_data_UHD == 10);
row_cosbit(4,2) = sum(row_cosbit_data_UHD == 11);
row_cosbit(4,3) = sum(row_cosbit_data_UHD == 12);
row_cosbit(4,4) = sum(row_cosbit_data_UHD == 13);
row_cosbit(4,5) = sum(row_cosbit_data_UHD == 14);
row_cosbit(4,6) = sum(row_cosbit_data_UHD == 15);
row_cosbit(4,7) = sum(row_cosbit_data_UHD == 16);

% Blocks
square_sizes(1,1) = sum(col_size_data_CIF == row_size_data_CIF);
square_sizes(2,1) = sum(col_size_data_HD == row_size_data_HD);
square_sizes(3,1) = sum(col_size_data_FHD == row_size_data_FHD);
square_sizes(4,1) = sum(col_size_data_UHD == row_size_data_UHD);

square_types(1,1) = sum(col_type_data_CIF == row_type_data_CIF);
square_types(2,1) = sum(col_type_data_HD == row_type_data_HD);
square_types(3,1) = sum(col_type_data_FHD == row_type_data_FHD);
square_types(4,1) = sum(col_type_data_UHD == row_type_data_UHD);

clear col_size_data_CIF col_type_data_CIF col_flip_data_CIF col_cosbit_data_CIF row_size_data_CIF row_type_data_CIF row_flip_data_CIF row_cosbit_data_CIF 
clear col_size_data_HD col_type_data_HD col_flip_data_HD col_cosbit_data_HD row_size_data_HD row_type_data_HD row_flip_data_HD row_cosbit_data_HD 
clear col_size_data_FHD col_type_data_FHD col_flip_data_FHD col_cosbit_data_FHD row_size_data_FHD row_type_data_FHD row_flip_data_FHD row_cosbit_data_FHD 
clear col_size_data_UHD col_type_data_UHD col_flip_data_UHD col_cosbit_data_UHD row_size_data_UHD row_type_data_UHD row_flip_data_UHD row_cosbit_data_UHD 

%% Histograms
% Sizes
sizes = categorical({'4','8','16','32','64'});
sizes = reordercats(sizes,{'4','8','16','32','64'});

cum_siz_per = (row_sizes+col_sizes)./(lengths*2)*100;

figure(1)
b_siz = bar(sizes,cum_siz_per',0.9,'FaceColor','flat');

b_siz(1).CData = 1;
b_siz(2).CData = 2;
b_siz(3).CData = 3;
b_siz(4).CData = 4;
setGraphs();

xPos = (1:5)-b_siz(1).BarWidth/4*linspace(1.25,-1.25,4)';
font_s = 12;

text(xPos(1,:),cum_siz_per(1,:)+1,compose("%.2f %%",cum_siz_per(1,:)),'HorizontalAlignment','center',...
    'VerticalAlignment','middle','HorizontalAlignment','left','FontSize',font_s,'Rotation',90)
text(xPos(2,:),cum_siz_per(2,:)+1,compose("%.2f %%",cum_siz_per(2,:)),'HorizontalAlignment','center',...
    'VerticalAlignment','middle','HorizontalAlignment','left','FontSize',font_s,'Rotation',90)
text(xPos(3,:),cum_siz_per(3,:)+1,compose("%.2f %%",cum_siz_per(3,:)),'HorizontalAlignment','center',...
    'VerticalAlignment','middle','HorizontalAlignment','left','FontSize',font_s,'Rotation',90)
text(xPos(4,:),cum_siz_per(4,:)+1,compose("%.2f %%",cum_siz_per(4,:)),'HorizontalAlignment','center',...
    'VerticalAlignment','middle','HorizontalAlignment','left','FontSize',font_s,'Rotation',90)

l = cell(1,4);
l{1} = 'CIF';l{2} = 'HD';l{3} = 'FHD';l{4} = 'UHD';
legend(b_siz,l);

set(gca,'box','off', ...
    'YGrid','on', ...
    'XGrid','off', ...
    'GridLineStyle','-');
ax = gca;
ax.GridAlpha = 0.7;
ylim([0 60]);

xlabel('Vector Size'),ylabel('Relative Use')

% Types
types = categorical({'DCT','ADST','FADST','IDTX'});
types = reordercats(types,{'DCT','ADST','FADST','IDTX'});

cum_typ_per = (row_types+col_types)./(lengths*2)*100;

figure(2)
b_typ = bar(types,cum_typ_per',0.9,'FaceColor','flat');

setGraphs();
b_typ(1).CData = 1;
b_typ(2).CData = 2;
b_typ(3).CData = 3;
b_typ(4).CData = 4;

xPos = (1:4)-b_siz(1).BarWidth/4*linspace(1.25,-1.25,4)';

text(xPos(1,:),cum_typ_per(1,:)+1,compose("%.2f %%",cum_typ_per(1,:)),'HorizontalAlignment','center',...
    'VerticalAlignment','middle','HorizontalAlignment','left','FontSize',font_s,'Rotation',90)
text(xPos(2,:),cum_typ_per(2,:)+1,compose("%.2f %%",cum_typ_per(2,:)),'HorizontalAlignment','center',...
    'VerticalAlignment','middle','HorizontalAlignment','left','FontSize',font_s,'Rotation',90)
text(xPos(3,:),cum_typ_per(3,:)+1,compose("%.2f %%",cum_typ_per(3,:)),'HorizontalAlignment','center',...
    'VerticalAlignment','middle','HorizontalAlignment','left','FontSize',font_s,'Rotation',90)
text(xPos(4,:),cum_typ_per(4,:)+1,compose("%.2f %%",cum_typ_per(4,:)),'HorizontalAlignment','center',...
    'VerticalAlignment','middle','HorizontalAlignment','left','FontSize',font_s,'Rotation',90)

l = cell(1,4);
l{1} = 'CIF';l{2} = 'HD';l{3} = 'FHD';l{4} = 'UHD';
legend(b_typ,l);
set(gca,'box','off', ...
    'YGrid','on', ...
    'XGrid','off', ...
    'GridLineStyle','-');
ax = gca;
ax.GridAlpha = 0.7;
ylim([0 100]);

xlabel('Transform'),ylabel('Relative Use')

% Cos bits
bits = categorical({'10','11','12','13','14','15','16'});
bits = reordercats(bits,{'10','11','12','13','14','15','16'});

cum_bit_per = (row_cosbit+col_cosbit)./(lengths*2)*100;

figure(3)
b_cos = bar(bits,cum_bit_per','FaceColor','flat');

setGraphs();
b_cos(1).CData = 1;
b_cos(2).CData = 2;
b_cos(3).CData = 3;
b_cos(4).CData = 4;

xPos = (1:7)-b_siz(1).BarWidth/4*linspace(1.25,-1.25,4)';

text(xPos(1,:),cum_bit_per(1,:)+1,compose("%.2f %%",cum_bit_per(1,:)),'HorizontalAlignment','center',...
    'VerticalAlignment','middle','HorizontalAlignment','left','FontSize',font_s,'Rotation',90)
text(xPos(2,:),cum_bit_per(2,:)+1,compose("%.2f %%",cum_bit_per(2,:)),'HorizontalAlignment','center',...
    'VerticalAlignment','middle','HorizontalAlignment','left','FontSize',font_s,'Rotation',90)
text(xPos(3,:),cum_bit_per(3,:)+1,compose("%.2f %%",cum_bit_per(3,:)),'HorizontalAlignment','center',...
    'VerticalAlignment','middle','HorizontalAlignment','left','FontSize',font_s,'Rotation',90)
text(xPos(4,:),cum_bit_per(4,:)+1,compose("%.2f %%",cum_bit_per(4,:)),'HorizontalAlignment','center',...
    'VerticalAlignment','middle','HorizontalAlignment','left','FontSize',font_s,'Rotation',90)

set(gca,'box','off', ...
    'YGrid','on', ...
    'XGrid','off', ...
    'GridLineStyle','-');
ax = gca;
ax.GridAlpha = 0.7;
ylim([0 100]);

xlabel('Nº Bits used for cosine'),ylabel('Relative Use')

% Symmetry tests
fprintf("Nº of square blocks: %i -> %.2f %%\n",square_sizes,square_sizes/length_data*100);
fprintf("Nº of square types: %i -> %.2f %%\n",square_types,square_types/length_data*100);