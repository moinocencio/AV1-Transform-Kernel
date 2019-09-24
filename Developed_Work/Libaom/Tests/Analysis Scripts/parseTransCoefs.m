%% Parser for Global Transform Parameters
close all
clear all
clc

%% Initializers
filen = 'TransformStats_waterfall.txt';

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
data = readmatrix(filen);

col_size_data = data(:,1);
col_type_data = data(:,2);
col_flip_data = data(:,3);
col_cosbit_data = data(:,4);

row_size_data = data(:,6);
row_type_data = data(:,7);
row_flip_data = data(:,8);
row_cosbit_data = data(:,9);

length_data = length(col_size_data);

%% Histogram Data
% Columns
col_sizes = zeros(1,5);     % 4 8 16 32 64
col_types = zeros(1,4);     % DCT ADST FADST IDTX
col_cosbit = zeros(1,7);    % 10 11 12 13 14 15 16

col_sizes(1) = sum(col_size_data == 4);
col_sizes(2) = sum(col_size_data == 8);
col_sizes(3) = sum(col_size_data == 16);
col_sizes(4) = sum(col_size_data == 32);
col_sizes(5) = sum(col_size_data == 64);

col_types(1) =  sum(col_type_data == TXFM_TYPE_DCT4) + ...
                sum(col_type_data == TXFM_TYPE_DCT8) + ...
                sum(col_type_data == TXFM_TYPE_DCT16) + ...
                sum(col_type_data == TXFM_TYPE_DCT32) + ...
                sum(col_type_data == TXFM_TYPE_DCT64);

col_types(2) =  sum((col_type_data == TXFM_TYPE_ADST4) & (col_flip_data == 0)) + ...
                sum((col_type_data == TXFM_TYPE_ADST8) & (col_flip_data == 0)) + ...
                sum((col_type_data == TXFM_TYPE_ADST16) & (col_flip_data == 0));

col_types(3) =  sum((col_type_data == TXFM_TYPE_ADST4) & (col_flip_data == 1)) + ...
                sum((col_type_data == TXFM_TYPE_ADST8) & (col_flip_data == 1)) + ...
                sum((col_type_data == TXFM_TYPE_ADST16) & (col_flip_data == 1));

col_types(4) =  sum(col_type_data == TXFM_TYPE_IDENTITY4) + ...
                sum(col_type_data == TXFM_TYPE_IDENTITY8) + ...
                sum(col_type_data == TXFM_TYPE_IDENTITY16) + ...
                sum(col_type_data == TXFM_TYPE_IDENTITY32);

col_cosbit(1) = sum(col_cosbit_data == 10);
col_cosbit(2) = sum(col_cosbit_data == 11);
col_cosbit(3) = sum(col_cosbit_data == 12);
col_cosbit(4) = sum(col_cosbit_data == 13);
col_cosbit(5) = sum(col_cosbit_data == 14);
col_cosbit(6) = sum(col_cosbit_data == 15);
col_cosbit(7) = sum(col_cosbit_data == 16);

% Rows
row_sizes = zeros(1,5);     % 4 8 16 32 64
row_types = zeros(1,4);     % DCT ADST FADST IDTX
row_cosbits = zeros(1,7);   % 10 11 12 13 14 15 16

row_sizes(1) = sum(row_size_data == 4);
row_sizes(2) = sum(row_size_data == 8);
row_sizes(3) = sum(row_size_data == 16);
row_sizes(4) = sum(row_size_data == 32);
row_sizes(5) = sum(row_size_data == 64);

row_types(1) =  sum(row_type_data == TXFM_TYPE_DCT4) + ...
                sum(row_type_data == TXFM_TYPE_DCT8) + ...
                sum(row_type_data == TXFM_TYPE_DCT16) + ...
                sum(row_type_data == TXFM_TYPE_DCT32) + ...
                sum(row_type_data == TXFM_TYPE_DCT64);

row_types(2) =  sum((row_type_data == TXFM_TYPE_ADST4) & (row_flip_data == 0)) + ...
                sum((row_type_data == TXFM_TYPE_ADST8) & (row_flip_data == 0)) + ...
                sum((row_type_data == TXFM_TYPE_ADST16) & (row_flip_data == 0));

row_types(3) =  sum((row_type_data == TXFM_TYPE_ADST4) & (row_flip_data == 1)) + ...
                sum((row_type_data == TXFM_TYPE_ADST8) & (row_flip_data == 1)) + ...
                sum((row_type_data == TXFM_TYPE_ADST16) & (row_flip_data == 1));

row_types(4) =  sum(row_type_data == TXFM_TYPE_IDENTITY4) + ...
                sum(row_type_data == TXFM_TYPE_IDENTITY8) + ...
                sum(row_type_data == TXFM_TYPE_IDENTITY16) + ...
                sum(row_type_data == TXFM_TYPE_IDENTITY32);

row_cosbit(1) = sum(row_cosbit_data == 10);
row_cosbit(2) = sum(row_cosbit_data == 11);
row_cosbit(3) = sum(row_cosbit_data == 12);
row_cosbit(4) = sum(row_cosbit_data == 13);
row_cosbit(5) = sum(row_cosbit_data == 14);
row_cosbit(6) = sum(row_cosbit_data == 15);
row_cosbit(7) = sum(row_cosbit_data == 16);

% Blocks
square_sizes = sum(col_size_data == row_size_data);

square_types = sum(col_type_data == row_type_data);

%% Histograms
% Sizes
sizes = categorical({'4','8','16','32','64'});
sizes = reordercats(sizes,{'4','8','16','32','64'});
cum_siz_per = (row_sizes+col_sizes)/(length_data*2)*100;
figure(1)
setGraphs();
b_siz = bar(sizes,cum_siz_per,'FaceColor',[0 0.2 0.5]);
text(1:5,cum_siz_per,compose("%.2f %%",cum_siz_per),'HorizontalAlignment','center',...
    'VerticalAlignment','bottom','FontSize',15)

set(gca,'box','off', ...
    'YGrid','on', ...
    'XGrid','off', ...
    'GridLineStyle','-');
ax = gca;
ax.GridAlpha = 0.7;
ylim([0 100]);

xlabel('Vector Size'),ylabel('Relative Use')

% Types
types = categorical({'DCT','ADST','FADST','IDTX'});
types = reordercats(types,{'DCT','ADST','FADST','IDTX'});
cum_typ_per = (row_types+col_types)/(length_data*2)*100;
figure(2)
setGraphs();
b_typ = bar(types,cum_typ_per,'FaceColor',[0 0.2 0.5]);
text(1:4,cum_typ_per,compose("%.2f %%",cum_typ_per),'HorizontalAlignment','center',...
    'VerticalAlignment','bottom','FontSize',15)

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
cum_bit_per = (row_cosbit+col_cosbit)/(length_data*2)*100;
figure(3)
setGraphs();
b_typ = bar(bits,cum_bit_per,'FaceColor',[0 0.2 0.5]);
text(1:length(bits),cum_bit_per,compose("%.2f %%",cum_bit_per),'HorizontalAlignment','center',...
    'VerticalAlignment','bottom','FontSize',15)

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