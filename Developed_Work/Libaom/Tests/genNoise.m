%% Add noise to image
% Takes image, and returns same image corrupted with AWGN.
% Example made for example in my master thesis.
clear all
close all
clc

%% Parameters
im_in_name = 'passeioOri.jpg';
noise = 0.01;
im_out_name = 'passeioNoise.jpg';

%% Original Image
im_in = imread(im_in_name);
figure(1)
imshow(im_in),title('Original Image');

%% Corrupted Image
im_out = uint8(double(im_in) + 8*randn(size(im_in)));
figure(2)
imshow(im_out),title('Corrupted Image');

%% Save Corrupted Image
imwrite(im_out,im_out_name);