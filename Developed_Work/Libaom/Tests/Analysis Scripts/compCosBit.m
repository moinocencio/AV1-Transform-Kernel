%% Compare cosbit Encode/Decode error
close all
clear all 
clc

%% Constants
m_terms =  ["_q25_reg_dec.y4m" ...      % Medium Quality encoding termination
            "_q25_10b_dec.y4m" ...
            "_q25_16b_dec.y4m"];

l_terms =  ["_q60_reg_dec.y4m" ...      % Low Quality encoding termination
            "_q60_10b_dec.y4m" ...
            "_q60_16b_dec.y4m"];

h_terms =  ["_q5_reg_dec.y4m" ...       % High Quality encoding termination
            "_q5_10b_dec.y4m" ...
            "_q5_16b_dec.y4m"];

terms =    [m_terms ; ...
            l_terms ; ...
            h_terms];

res =      [288 352; ...                % Video Resolutions
            720 1280; ...
            1080 1920; ...
            2160 3840];

nFrames = 5;            

%% Input Paths
cif_ori_p =["/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/waterfall_cif.y4m" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/flower_cif.y4m" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/flower_cif.y4m"];
cif_p =    ["/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/CIF/waterfall" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/CIF/flower" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/CIF/flower"];

hd_ori_p = ["/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/720p50_mobcal_ter.y4m" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/ducks_take_off_420_720p50.y4m" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/HD/sintel_trailer_2k_720p24.y4m"];
hd_p =     ["/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/HD/mobcal" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/HD/ducks" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/HD/sintel"];

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

v_n = split(v_p,'/');
v_n = squeeze(v_n(:,:,end));        % Video Names

s_t = size(terms);
s_v = size(ori_p);

%% Get PSNR's
PSNR = zeros(s_t(1), s_v(1), s_v(2), s_t(2));
PSNR_m = zeros(s_t(1), s_v(1), s_t(2));

for i_q = 1:s_t(1)              % Quality Index
    for i_r = 1:s_v(1)          % Resolution Index
        for i_v = 1:s_v(2)      % Video Index
            PSNR(i_q, i_r, i_v, :) =   compPSNR(v_p(i_r,i_v)+terms(i_q,1), ...
                                                v_p(i_r,i_v)+terms(i_q,2), ...
                                                v_p(i_r,i_v)+terms(i_q,3), ...
                                                ori_p(i_r,i_v), ...
                                                res(i_r), ...
                                                nFrames);                                          
        end
        PSNR_m(i_q,i_r,:) = mean(squeeze(PSNR(i_q,i_r,:,:)),1);
    end
end

%% Hist
for i_q = 1:s_t(1)              % Quality Index
    for i_r = 1:s_v(1)+1          % Resolution Index
        n_temp = categorical([v_n(i_r,:) "Average"]);
        n_temp = reordercats(n_temp,[v_n(i_r,:) "Average"]);

        figure(i_q),subplot(1,s_v(1)+1,i_r)
        bar(n_temp,[squeeze(PSNR(i_q,i_r,:,:)) PSNR_m(i_q,i_r,:)])
    end
end
%res = categorical({'CIF','HD','FHD','UHD'});
%res = reordercats(res,{'CIF','HD','FHD','UHD'});
%
%figure(5)
%b_psnr = bar(res,PSNR,'FaceColor','flat');
%setGraphs();
%
%ylim([min(min(PSNR))-2 max(max(PSNR))+2])
%
%font_s = 16;
%xPos = (1:4)-b_psnr(1).BarWidth/3*linspace(0.9,-0.9,3)';
%text(xPos(1,:),PSNR(:,1)+0.1,compose("%.2f %%",PSNR(:,1)),'HorizontalAlignment','center',...
%    'VerticalAlignment','middle','HorizontalAlignment','left','FontSize',font_s,'Rotation',90)
%text(xPos(2,:),PSNR(:,1)+0.1,compose("%.2f %%",PSNR(:,2)),'HorizontalAlignment','center',...
%    'VerticalAlignment','middle','HorizontalAlignment','left','FontSize',font_s,'Rotation',90)
%text(xPos(3,:),PSNR(:,1)+0.1,compose("%.2f %%",PSNR(:,3)),'HorizontalAlignment','center',...
%    'VerticalAlignment','middle','HorizontalAlignment','left','FontSize',font_s,'Rotation',90)
%
%setGraphs();
%b_psnr(1).CData = 1;
%b_psnr(2).CData = 2;
%b_psnr(3).CData = 3;
%
%l = cell(1,3);
%l{1} = 'Regular';l{2} = '10 bit';l{3} = '16 bit';
%legend(b_psnr,l);
%
%xlabel('Resolution'),ylabel('PSNR (dB)')