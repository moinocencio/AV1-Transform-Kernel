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

    data = readmatrix(f_p);         % [col_size col_type col_flip col_cosbit | row_size row_type row_flip row_cosbit]

    v_stats.sizes(1,:) = hist(data(:,1),2.^(2:6));
    v_stats.sizes(2,:) = hist(data(:,6),2.^(2:6));
    
    v_stats.types(1,1) = sum(ismember(data(:,2),[TXFM_TYPE_DCT4 TXFM_TYPE_DCT8 TXFM_TYPE_DCT16 TXFM_TYPE_DCT32 TXFM_TYPE_DCT64]));
    v_stats.types(1,2) = sum(ismember(data(:,2),[TXFM_TYPE_ADST4 TXFM_TYPE_ADST8 TXFM_TYPE_ADST16]).*(data(:,3) == 0));
    v_stats.types(1,3) = sum(ismember(data(:,2),[TXFM_TYPE_ADST4 TXFM_TYPE_ADST8 TXFM_TYPE_ADST16]).*(data(:,3) == 1));
    v_stats.types(1,4) = sum(ismember(data(:,2),[TXFM_TYPE_IDENTITY4 TXFM_TYPE_IDENTITY8 TXFM_TYPE_IDENTITY16 TXFM_TYPE_IDENTITY32]));
    v_stats.types(2,1) = sum(ismember(data(:,7),[TXFM_TYPE_DCT4 TXFM_TYPE_DCT8 TXFM_TYPE_DCT16 TXFM_TYPE_DCT32 TXFM_TYPE_DCT64]));
    v_stats.types(2,2) = sum(ismember(data(:,7),[TXFM_TYPE_ADST4 TXFM_TYPE_ADST8 TXFM_TYPE_ADST16]).*(data(:,8) == 0));
    v_stats.types(2,3) = sum(ismember(data(:,7),[TXFM_TYPE_ADST4 TXFM_TYPE_ADST8 TXFM_TYPE_ADST16]).*(data(:,8) == 1));
    v_stats.types(2,4) = sum(ismember(data(:,7),[TXFM_TYPE_IDENTITY4 TXFM_TYPE_IDENTITY8 TXFM_TYPE_IDENTITY16 TXFM_TYPE_IDENTITY32]));

    v_stats.cosbit(1,:) = hist(data(:,4),(10:16));
    v_stats.cosbit(2,:) = hist(data(:,9),(10:16));

    v_stats.length = size(data,1);

    v_stats.sqSizes = sum(data(:,1) == data(:,6));
    v_stats.sqTypes = sum(data(:,2) == data(:,7));
end