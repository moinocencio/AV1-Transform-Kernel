%% Horizontal shift correlation
% Performs various horizontal shifts to an image, and calculates the
% autocorrelation with the original image
% Made for an example in my master thesis
clear all
close all
clc

%% Parameters
im_in_name = 'paisagemOri.jpg';
n_shifts = 15;

%% Calculate Correlation
im_in = imread(im_in_name);
im_temp = zeros(size(im_in));