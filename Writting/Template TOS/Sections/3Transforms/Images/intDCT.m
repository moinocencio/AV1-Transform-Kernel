%% Effect of Integer DCT on image reconstruction
% Reconstruct an image with DCT and "Int DCT" and analyze effects of the
% approximations
clear all
close all 
clc

%% Parameters
nBits = 32;     % Number of bits to aproximate coefficients to
fName = 'boat.512.tiff';

%% Read image and calculate coefficients
im = imread(fName);
im = im2double(im);

T = dctmtx(8);
dct = @(block_struct) T * block_struct.data * T';
B = blockproc(im,[8 8],dct);

BInt = round(B);

invdct = @(block_struct) T' * block_struct.data * T;
imDCT = blockproc(B,[8 8],invdct);
imIntDCT = blockproc(BInt,[8 8],invdct);

figure
imshow(imDCT)

figure
imshow(imIntDCT)