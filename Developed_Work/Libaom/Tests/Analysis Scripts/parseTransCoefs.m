%% Parser for Global Transform Parameters
close all
clear all
clc

%% Constants
terms =["_q60.txt" ...
        "_q25.txt" ...
        "_q5.txt"];
       
cif_p =    ["/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/CIF/waterfall_stats" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/CIF/flower_stats" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/CIF/bridge_stats"];
hd_p =     ["/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/HD/parkrun_stats" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/HD/ducks_stats" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/HD/shields_stats"];
fhd_p =    ["/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/FHD/dinner_stats" ... 
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/FHD/factory_stats" ... 
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/FHD/parkjoy_stats"];
uhd_p =    ["/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/UHD/oldtowncross_stats" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/UHD/intotree_stats" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/UHD/crowdrun_stats"];            

v_p =  [cif_p;
        hd_p;
        fhd_p;
        uhd_p];

clear cif_p hd_p fhd_p uhd_p;

%% Get Statistics
sizes_p = zeros(length(terms),size(v_p,1),5);
types_p = zeros(length(terms),size(v_p,1),4);
cosbit_p = zeros(length(terms),size(v_p,1),7);
sqsiz_p = zeros(length(terms),size(v_p,1));
sqtyp_p = zeros(length(terms),size(v_p,1));

vars = who;
vars = {vars{:} 'i_q' 'i_r' 'i_v' 'vars'};

for i_q = 1:length(terms)             % Quality Index
    for i_r = 1:size(v_p,1)           % Resolution Index
        l_temp = 0;
        sizes_temp = zeros(2,5);
        types_temp = zeros(2,4);
        cosbit_temp = zeros(2,7);
        sqsiz_temp = 0;
        sqtyp_temp = 0;
        for i_v = 1:size(v_p,2)       % Video Index
            v_temp = getTransStats(v_p(i_r,i_v)+terms(i_q));

            l_temp = l_temp + v_temp.length;
            sizes_temp = sizes_temp + v_temp.sizes;
            types_temp = types_temp + v_temp.types;
            cosbit_temp = cosbit_temp + v_temp.cosbit;
            sqsiz_temp = sqsiz_temp + v_temp.sqSizes;
            sqtyp_temp = sqtyp_temp + v_temp.sqTypes;
        end
        sizes_p(i_q, i_r, :) = sum(sizes_temp,1)./(l_temp*2)*100;
        types_p(i_q, i_r, :) = sum(types_temp,1)./(l_temp*2)*100;
        cosbit_p(i_q, i_r, :) = sum(cosbit_temp,1)./(l_temp*2)*100;
        sqsiz_p(i_q, i_r) = sqsiz_temp / l_temp;
        sqtyp_p(i_q, i_r) = sqtyp_temp / l_temp;
        clearvars('-except',vars{:});
    end
end

%% Histograms
for i_q = 1:s_t(1)              % Quality Index
    figure(i_q),
    subplot(2,2,1), makePrettyBar(  ["4","8","16","32","64"], ...
                                    squeeze(sizes_p(i_q,:,:)), ...
                                    ["CIF" "HD" "FHD" "UHD"], ...
                                    'Vector Size', 'Relative Use (%)');
    
    subplot(2,2,2), makePrettyBar(  ["DCT", "ADST", "FADST", "IDTX"], ...
                                    squeeze(types_p(i_q,:,:)), ...
                                    ["CIF" "HD" "FHD" "UHD"], ...
                                    'Transform Kernel', 'Relative Use (%)');

    subplot(2,2,3), makePrettyBar(  ["10","11","12","13","14", "15", "16"], ...
                                    squeeze(cosbit_p(i_q,:,:)), ...
                                    ["CIF" "HD" "FHD" "UHD"], ...
                                    'Cosine bits', 'Relative Use (%)');
    
    subplot(2,2,4), makePrettyBar(  ["CIF" "HD" "FHD" "UHD"], ...
                                    [squeeze(sqtyp_p(i_q,:)) squeeze(sqsize_p(i_q,:))], ...
                                    ["Square Size" "Square Kernel"], ...
                                    'Resolution', 'Relative Use (%)');
end