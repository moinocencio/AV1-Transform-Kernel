function v_stats = getTransStats(f_p) 
    % getTransStats gets transforms statistics from input file
    %	
    %   f_p     - Statistics file path
    %
    % Outputs structure v_stats with:
    %   v_stats.sizes     - [4 8 16 32 64;          cols
    %                        4 8 16 32 64]          rows
    %   v_stats.types     - [DCT ADST FADST IDTX]
    %                        DCT ADST FADST IDTX]       
    %   v_stats.cosbit    - [10 11 12 13 14 15 16;
    %                        10 11 12 13 14 15 16]
    %   v_stats.length
    %   v_stats.sqTypes
    %   v_stats.sqSizes

    v_stats.sizes = zeros(2,5);
    v_stats.types = zeros(2,4);
    v_stats.cosbit = zeros(2,7);
    v_stats.length = 0;
    v_stats.sqTypes= 0;
    v_stats.sqSizes= 0;

    % Libaom Transform Enumerations
    TXFM_TYPE_DCT4 = uint8(0);
    TXFM_TYPE_DCT8 = uint8(1);
    TXFM_TYPE_DCT16 = uint8(2);
    TXFM_TYPE_DCT32 = uint8(3);
    TXFM_TYPE_DCT64 = uint8(4);
    TXFM_TYPE_ADST4 = uint8(5);
    TXFM_TYPE_ADST8 = uint8(6);
    TXFM_TYPE_ADST16 = uint8(7);
    TXFM_TYPE_IDENTITY4 = uint8(8);
    TXFM_TYPE_IDENTITY8 = uint8(9);
    TXFM_TYPE_IDENTITY16 = uint8(10);
    TXFM_TYPE_IDENTITY32 = uint8(11);

%    data = uint8(readmatrix(f_p));         % [col_size col_type col_flip col_cosbit | row_size row_type row_flip row_cosbit]
%
%    v_stats.sizes(1,:) = hist(data(:,1),2.^(2:6));
%    v_stats.sizes(2,:) = hist(data(:,6),2.^(2:6));
%    
%    v_stats.types(1,1) = sum(ismember(data(:,2),[TXFM_TYPE_DCT4 TXFM_TYPE_DCT8 TXFM_TYPE_DCT16 TXFM_TYPE_DCT32 TXFM_TYPE_DCT64]));
%    v_stats.types(1,2) = sum(ismember(data(:,2),[TXFM_TYPE_ADST4 TXFM_TYPE_ADST8 TXFM_TYPE_ADST16]).*(data(:,3) == 0));
%    v_stats.types(1,3) = sum(ismember(data(:,2),[TXFM_TYPE_ADST4 TXFM_TYPE_ADST8 TXFM_TYPE_ADST16]).*(data(:,3) == 1));
%    v_stats.types(1,4) = sum(ismember(data(:,2),[TXFM_TYPE_IDENTITY4 TXFM_TYPE_IDENTITY8 TXFM_TYPE_IDENTITY16 TXFM_TYPE_IDENTITY32]));
%    v_stats.types(2,1) = sum(ismember(data(:,7),[TXFM_TYPE_DCT4 TXFM_TYPE_DCT8 TXFM_TYPE_DCT16 TXFM_TYPE_DCT32 TXFM_TYPE_DCT64]));
%    v_stats.types(2,2) = sum(ismember(data(:,7),[TXFM_TYPE_ADST4 TXFM_TYPE_ADST8 TXFM_TYPE_ADST16]).*(data(:,8) == 0));
%    v_stats.types(2,3) = sum(ismember(data(:,7),[TXFM_TYPE_ADST4 TXFM_TYPE_ADST8 TXFM_TYPE_ADST16]).*(data(:,8) == 1));
%    v_stats.types(2,4) = sum(ismember(data(:,7),[TXFM_TYPE_IDENTITY4 TXFM_TYPE_IDENTITY8 TXFM_TYPE_IDENTITY16 TXFM_TYPE_IDENTITY32]));
%
%    v_stats.cosbit(1,:) = hist(data(:,4),(10:16));
%    v_stats.cosbit(2,:) = hist(data(:,9),(10:16));
%
%    v_stats.length = size(data,1);
%
%    v_stats.sqSizes = sum(data(:,1) == data(:,6));
%    v_stats.sqTypes = sum(data(:,2) == data(:,7));

    data_t = [uint8(readmatrix(f_p, 'Range','A:A')) uint8(readmatrix(f_p, 'Range','F:F'))];         % [col_size col_type col_flip col_cosbit | row_size row_type row_flip row_cosbit]
    v_stats.sizes(1,:) = hist(data_t(:,1),2.^(2:6));
    v_stats.sizes(2,:) = hist(data_t(:,2),2.^(2:6));

    v_stats.sqSizes = sum(data_t(:,1) == data_t(:,2));

    v_stats.length = size(data_t,1);

    data_t = [uint8(readmatrix(f_p, 'Range','B:B')) uint8(readmatrix(f_p, 'Range','C:C')) uint8(readmatrix(f_p, 'Range','G:G')) uint8(readmatrix(f_p, 'Range','H:H'))];
    v_stats.types(1,1) = sum(ismember(data_t(:,1),[TXFM_TYPE_DCT4 TXFM_TYPE_DCT8 TXFM_TYPE_DCT16 TXFM_TYPE_DCT32 TXFM_TYPE_DCT64]));
    v_stats.types(1,2) = sum(ismember(data_t(:,1),[TXFM_TYPE_ADST4 TXFM_TYPE_ADST8 TXFM_TYPE_ADST16]).*(data_t(:,2) == 0));
    v_stats.types(1,3) = sum(ismember(data_t(:,1),[TXFM_TYPE_ADST4 TXFM_TYPE_ADST8 TXFM_TYPE_ADST16]).*(data_t(:,2) == 1));
    v_stats.types(1,4) = sum(ismember(data_t(:,1),[TXFM_TYPE_IDENTITY4 TXFM_TYPE_IDENTITY8 TXFM_TYPE_IDENTITY16 TXFM_TYPE_IDENTITY32]));
    v_stats.types(2,1) = sum(ismember(data_t(:,3),[TXFM_TYPE_DCT4 TXFM_TYPE_DCT8 TXFM_TYPE_DCT16 TXFM_TYPE_DCT32 TXFM_TYPE_DCT64]));
    v_stats.types(2,2) = sum(ismember(data_t(:,3),[TXFM_TYPE_ADST4 TXFM_TYPE_ADST8 TXFM_TYPE_ADST16]).*(data_t(:,4) == 0));
    v_stats.types(2,3) = sum(ismember(data_t(:,3),[TXFM_TYPE_ADST4 TXFM_TYPE_ADST8 TXFM_TYPE_ADST16]).*(data_t(:,4) == 1));
    v_stats.types(2,4) = sum(ismember(data_t(:,3),[TXFM_TYPE_IDENTITY4 TXFM_TYPE_IDENTITY8 TXFM_TYPE_IDENTITY16 TXFM_TYPE_IDENTITY32]));

    v_stats.sqTypes = sum((data_t(:,1) == data_t(:,3)) & (data_t(:,2) == data_t(:,4)));

    data_t = [uint8(readmatrix(f_p, 'Range','D:D')) uint8(readmatrix(f_p, 'Range','I:I'))];
    v_stats.cosbit(1,:) = hist(data_t(:,1),(10:16));
    v_stats.cosbit(2,:) = hist(data_t(:,2),(10:16));
end