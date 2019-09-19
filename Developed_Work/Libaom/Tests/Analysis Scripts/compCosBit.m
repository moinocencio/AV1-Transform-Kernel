%% Compare cosbit Encode/Decode error
close all
clear all 
clc

%% Initializers
v_ori_n = 'waterfall_cif.yuv';      % Name of original raw sequence
v_dec_n = 'waterfall_normal.yuv';   % Encoded/Decoded normally
v_dec10b_n = 'waterfall_10b.yuv';  % Encoded/Decoded with 10 bit cosine
v_dec16b_n = 'waterfall_16b.yuv';  % Encoded/Decoded with 16 bit cosine

vw = 288;
vh = 352;
nFrames = 5;

%% Open Videos
v_ori_s = loadFileYuv(v_ori_n,vh,vw,1:nFrames);
v_dec_s = loadFileYuv(v_dec_n,vh,vw,1:nFrames);
v_dec10b_s = loadFileYuv(v_dec10b_n,vh,vw,1:nFrames);
v_dec16b_s = loadFileYuv(v_dec16b_n,vh,vw,1:nFrames);

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

subplot(2,3,4),imshow(e_dec(3).cdata);
subplot(2,3,5),imshow(e_dec(3).cdata);
subplot(2,3,6),imshow(e_dec(3).cdata);