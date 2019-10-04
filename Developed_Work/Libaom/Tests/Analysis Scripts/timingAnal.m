%% Timing Analysis
close all
clear
clc

% Start by parsing the timing results of each video and quality.

% TestCosBitLog is divided by:
%
% Encoding of video "X":
% High Quality encode
% ...
% Low Quality encode
% ...
% Medium Quality encode
% ...
% Encode of video "K"

%% Constants
totalt_id = '10/10';
transt_id = 'Cumulative'

nFrames = 10;                   % Number of encoded frames

res =      [288 352; ...                % Video Resolutions
            720 1280; ...
            1080 1920; ...
            2160 3840];

f_n = '/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/TestCosBitLog.txt';

%% Parse Timing Results
f = fopen(f_n);
t = textscan(f,'%s','Delimiter','\n');
fclose(f);


%% Timing results

