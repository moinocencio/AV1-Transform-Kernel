%% Timing Analysis
close all
clear
clc

%% Timing results
frame_e = 20;       % Encoded frames

% CIF HD FHD UHD
time_T = [664318 905688 1083804 1852647];   % Total encoding time (ms)
time_fw = [75132 106874 117106 305368];     % Forward Transform time (ms)
time_inv = [100532 154364 152575 161075];   % Inverse Transform time (ms)

res_w =[352 1280 1920 3840];

res_h =[288 720 1080 2160];

%% Timing analysis
% Time to encode vs resolution
pixels = res_w.*res_w;
fps_e = frame_e./time_T*1000*60;
fps_pixel = fps_e./pixels;

figure(1)
setGraphs();
yyaxis left
plot(pixels,fps_e,'x')
yyaxis right
stem(pixels,fps_pixel)
