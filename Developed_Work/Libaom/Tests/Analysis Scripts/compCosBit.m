%% Compare cosbit Encode/Decode error
close all
clear all 
clc

%% Initializers
res = 4;
switch res
    case 1
        v_ori_n = '/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/waterfall_cif.y4m';      % Name of original raw sequence
        v_dec_n = '/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/waterfall20f_reg_dec.y4m';   % Encoded/Decoded normally
        v_dec10b_n = '/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/waterfall20f_10b_dec.y4m';  % Encoded/Decoded with 10 bit cosine
        v_dec16b_n = '/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/waterfall20f_16b_dec.y4m';  % Encoded/Decoded with 16 bit cosine
        
        vw = 352;
        vh = 288;

    case 2
        v_ori_n = '/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/ducks_take_off_420_720p50.y4m';      % Name of original raw sequence
        v_dec_n = '/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/duckstakeoff50f_reg_dec.y4m';   % Encoded/Decoded normally
        v_dec10b_n = '/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/duckstakeoff50f_10b_dec.y4m';  % Encoded/Decoded with 10 bit cosine
        v_dec16b_n = '/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/duckstakeoff50f_16b_dec.y4m';  % Encoded/Decoded with 16 bit cosine
        
        vw = 1280;
        vh = 720;    

    case 3
        v_ori_n = '/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/park_joy_1080p50.y4m';      % Name of original raw sequence
        v_dec_n = '/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/parkjoy20f_reg_dec.y4m';   % Encoded/Decoded normally
        v_dec10b_n = '/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/parkjoy20f_10b_dec.y4m';  % Encoded/Decoded with 10 bit cosine
        v_dec16b_n = '/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/parkjoy20f_16b_dec.y4m';  % Encoded/Decoded with 16 bit cosine

        vw = 1920;
        vh = 1080;

    case 4
        v_ori_n = '/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/in_to_tree_2160p50.y4m';      % Name of original raw sequence
        v_dec_n = '/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/intotree20f_reg_dec.y4m';   % Encoded/Decoded normally
        v_dec10b_n = '/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/intotree20f_10b_dec.y4m';  % Encoded/Decoded with 10 bit cosine
        v_dec16b_n = '/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/intotree20f_16b_dec.y4m';  % Encoded/Decoded with 16 bit cosine

        vw = 3840;
        vh = 2160;
end

nFrames = 5;

%% Open Videos
v_ori_s = yuv4mpeg2mov(v_ori_n,nFrames);
%v_ori_s = loadFileYuv(v_ori_n,vw,vh,1:nFrames);
v_dec_s = loadFileYuv(v_dec_n,vw,vh,1:nFrames);
v_dec10b_s = loadFileYuv(v_dec10b_n,vw,vh,1:nFrames);
v_dec16b_s = loadFileYuv(v_dec16b_n,vw,vh,1:nFrames);

%% Error Mean Square
e_cum_dec = 0;
e_cum_dec10b = 0;
e_cum_dec16b = 0;

for i=1:nFrames
    e_dec(i) = im2frame(v_ori_s(i).cdata - v_dec_s(i).cdata);
    e_dec10b(i) = im2frame(v_ori_s(i).cdata - v_dec10b_s(i).cdata);
    e_dec16b(i) = im2frame(v_ori_s(i).cdata - v_dec16b_s(i).cdata);

    e_cum_dec = e_cum_dec + sum(sum(sum((v_ori_s(i).cdata - v_dec_s(i).cdata).^2)));
    e_cum_dec10b = e_cum_dec10b + sum(sum(sum((v_ori_s(i).cdata - v_dec10b_s(i).cdata).^2)));
    e_cum_dec16b = e_cum_dec16b + sum(sum(sum((v_ori_s(i).cdata - v_dec16b_s(i).cdata).^2)));
end

ems_dec = e_cum_dec/(vw*vh*3*nFrames);
ems_dec10b = e_cum_dec10b/(vw*vh*3*nFrames);
ems_dec16b = e_cum_dec16b/(vw*vh*3*nFrames);

PSNR_dec = 10*log10(255^2/ems_dec);
PSNR_dec10b = 10*log10(255^2/ems_dec10b);
PSNR_dec16b = 10*log10(255^2/ems_dec16b);

%% Display Results
figure(1)
subplot(2,3,1),imshow(v_dec_s(3).cdata);
title('Regular'),xlabel(string(PSNR_dec))
subplot(2,3,2),imshow(v_dec10b_s(3).cdata);
title('10 bit'),xlabel(string(PSNR_dec10b))
subplot(2,3,3),imshow(v_dec16b_s(3).cdata);
title('16 bit'),xlabel(string(PSNR_dec16b))

subplot(2,3,4),imshow(255 - e_dec(3).cdata);
subplot(2,3,5),imshow(255 - e_dec(3).cdata);
subplot(2,3,6),imshow(255 - e_dec(3).cdata);