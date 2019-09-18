%% Get inter correlation off series of frames
clear all
close all
clc

%% Parameters
video_name = 'stefan_cif.yuv';
vw = 288;
vh = 352;
nFrames = 10;

%% Read frames
v_seq = loadFileYuv(video_name,vh,vw,1:nFrames);
refFrame = v_seq(1).cdata;
refFrame = refFrame(:,:,1);

corr = zeros(1,nFrames);
corr(1) = sum(sum(corr2(refFrame,refFrame)));

for i = 2:nFrames
    tFrame = v_seq(i).cdata;
    corr(i) = sum(sum(corr2(refFrame,tFrame(:,:,1))));
end

corr = corr/corr(1);

%% Plot values
set(groot, ...
'DefaultFigureColor', 'w', ...
'DefaultAxesLineWidth', 0.5, ...
'DefaultAxesXColor', 'k', ...
'DefaultAxesYColor', 'k', ...
'DefaultAxesFontUnits', 'points', ...
'DefaultAxesFontSize', 20, ...
'DefaultAxesFontName', 'Times', ...
'DefaultLineLineWidth', 4, ...
'DefaultTextFontUnits', 'Points', ...
'DefaultTextFontSize', 20, ...
'DefaultTextFontName', 'Times', ...
'DefaultAxesBox', 'off', ...
'DefaultAxesTickLength', [0.02 0.025]);
% set the tickdirs to go out - need this specific order
set(groot, 'DefaultAxesTickDir', 'out');
set(groot, 'DefaultAxesTickDirMode', 'manual');

figure('units','normalized','outerposition',[0 0 1 1])
plot(1:nFrames,corr);
xlabel('Frame nº')
xlim([1 nFrames]);
set(gca,'box','off', ...
    'YGrid','on', ...
    'XGrid','off', ...
    'GridLineStyle','-',...
    'GridAlpha','0.7');

print('intercorr.eps','-depsc2')
close