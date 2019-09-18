%% Horizontal shift correlation
% Performs various horizontal shifts to an image, and calculates the
% autocorrelation with the original image
% Made for an example in my master thesis
clear all
close all
clc

%% Parameters
im_in_name = 'passeioOri.jpg';
n_shifts = 10;

%% Calculate Correlation
im_in = imread(im_in_name);
im_in_r = im_in(:,:,1);
im_in_g = im_in(:,:,2);
im_in_b = im_in(:,:,3);

t_size = size(im_in_r);
corr_v = zeros(1,n_shifts+1);
corr_v(1) = sum(sum(corr2(im_in_r,im_in_r)));

for i = 1:n_shifts    
    im_temp_r = [zeros(t_size(1),i) im_in_r(:,1:end-i)];
    corr_v(i+1) = sum(sum(corr2(im_in_r,im_temp_r)));
end

corr_v = corr_v/corr_v(1);

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
plot(0:n_shifts,corr_v);
xlabel('Nº of shifts')
set(gca,'box','off', ...
    'YGrid','on', ...
    'XGrid','off', ...
    'GridLineStyle',':');
print('intracorr.eps','-depsc2')
close;


