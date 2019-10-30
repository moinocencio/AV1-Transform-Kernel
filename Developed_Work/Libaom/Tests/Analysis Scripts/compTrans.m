%% Compare cosbit Encode/Decode error
close all
clear all 
clc

load compTransW.mat
%{
%% Constants
reg_terms =["_ttest_reg_trans60.y4m" ...      % Regular transform Termination
            "_ttest_reg_trans25.y4m" ...
            "_ttest_reg_trans5.y4m"];

butt_terms =["_ttest_butt_trans60.y4m" ...    % Experimental transform Termination
             "_ttest_butt_trans25.y4m" ...
             "_ttest_butt_trans5.y4m"];

terms =    [reg_terms ; ...
            butt_terms];

res =      [288 352; ...                     % Video Resolutions
            720 1280; ...
            1080 1920; ...
            2160 3840];

nFrames = 10;            

%% Input Paths
cif_ori_p =["/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/waterfall_cif.y4m" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/flower_cif.y4m" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/bridge_close_cif.y4m"];
cif_p =    ["/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/CIF/waterfall" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/CIF/flower" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/CIF/bridge"];

hd_ori_p = ["/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/720p50_parkrun_ter.y4m" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/ducks_take_off_420_720p50.y4m" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/720p50_shields_ter.y4m"];
hd_p =     ["/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/HD/parkrun" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/HD/ducks" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/HD/shields"];

fhd_ori_p =["/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/FHD/dinner_1080p30.y4m" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/FHD/factory_1080p30.y4m" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/FHD/park_joy_1080p50.y4m"];
fhd_p =    ["/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/FHD/dinner" ... 
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/FHD/factory" ... 
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/FHD/parkjoy"];

uhd_ori_p =["/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/UHD/old_town_cross_2160p50.y4m" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/UHD/in_to_tree_2160p50.y4m" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/UHD/crowd_run_2160p50.y4m"];            
uhd_p =    ["/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/UHD/oldtowncross" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/UHD/intotree" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/UHD/crowdrun"];            

ori_p = [cif_ori_p; hd_ori_p; fhd_ori_p; uhd_ori_p];
v_p = [cif_p; hd_p; fhd_p; uhd_p];

v_p_s = split(v_p,'/');
v_n = squeeze(v_p_s(:,:,end));          % Video Names
v_r = squeeze(v_p_s(:,1,end - 1));      % Video Resolutions
v_q = ["Regular" "Experimental"];       % Transform Type

s_t = size(terms);
s_v = size(ori_p);

%% Get PSNR's
PSNR = zeros(s_t(1), s_v(1), s_v(2), s_t(2));   % PSNR for each video
mPSNR_r = zeros(s_t(1), s_v(1), s_t(2));        % Average PSNR for all videos in each quality
mPSNR_q = zeros(s_t(1), s_t(2));                % Average PSNR for all resolutions in each quality

for i_q = 1:s_t(1)              % Transform Index
    for i_r = 1:s_v(1)          % Resolution Index
        for i_v = 1:s_v(2)      % Video Index
            PSNR(i_q, i_r, i_v, :) =   compPSNR(v_p(i_r,i_v)+terms(i_q,1), ...
                                                v_p(i_r,i_v)+terms(i_q,2), ...
                                                v_p(i_r,i_v)+terms(i_q,3), ...
                                                ori_p(i_r,i_v), ...
                                                res(i_r,:), ...
                                                nFrames);                                          
        end
        mPSNR_r(i_q,i_r,:) = mean(squeeze(PSNR(i_q,i_r,:,:)),1);
    end
    mPSNR_q(i_q,:) = mean(squeeze(mPSNR_r(i_q,:,:)),1);
end

%% Bar graph
%{
for i_q = 1:s_t(1)              % Quality Index
    for i_r = 1:s_v(1)          % Resolution Index
        %figure('Name', v_q(i_q)+" Videos")
        %title(sprintf("%s - %s", v_q(i_q), v_r(i_r)))
        %makePrettyBar(  [v_n(i_r,:) "Average"], ...
        %                [squeeze(PSNR(i_q,i_r,:,:)); squeeze(mPSNR_r(i_q,i_r,:))'], ...
        %                ["Regular" "10bit" "16bit"], ...
        %                v_r(i_r) + " Video", "PSNR (dB)");
    end
    figure('Name',v_q(i_q)+" Average",'units','normalized','outerposition',[0 0 1 1])
    title(sprintf("%s Average PSNR", v_q(i_q)))
    makePrettyBar(  [v_r' "Average"], ...
                    [squeeze(mPSNR_r(i_q,:,:)); mPSNR_q(i_q,:)], ...
                    ["Regular" "10bit" "16bit"], ...
                    v_q(i_q) + " Quality", "PSNR (dB)");
end
%}
%}  
figure('Name','Transform Average', 'units','normalized','outerposition',[0 0 1 1])
setGraphs();
makePrettyBar(["Low" "Medium" "High" "Average"],[mPSNR_q mean(mPSNR_q,2)]',["Original" "Alternative"],"Quality","PSNR (dB)");
