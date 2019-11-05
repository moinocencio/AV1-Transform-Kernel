%% Horizontal shift correlation
% Performs various horizontal shifts to an image, and calculates the
% autocorrelation with the original image
% Made for an example in my master thesis
clear all
close all
clc

%% Parameters
im_in_name = '/run/media/moinocencio/Data/Tese/Master-Thesis/Escrita/Template TOS/Sections/2AV1/Diagrams/passeioOri.jpg';
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
figure('units','normalized','outerposition',[0 0 1 1])
plot(0:n_shifts,corr_v);
xlabel('Number of shifts'),ylabel('Normalized auto-correlation')
setGraphs();