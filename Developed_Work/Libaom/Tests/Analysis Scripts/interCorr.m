%% Get inter correlation off series of frames
clear all
close all
clc

%% Parameters
video_name = '/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/CIF/stefan_sif.y4m';
vw = 288;
vh = 352;
nFrames = 10;

%% Read frames
v_seq = yuv4mpeg2mov(video_name,nFrames);
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
figure('units','normalized','outerposition',[0 0 1 1])
plot(1:nFrames,corr);
xlabel('Frame number'),ylabel('Normalized cross-correlation')
xlim([1 nFrames]);

setGraphs();