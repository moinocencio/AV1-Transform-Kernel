%% Transform Timing Analysis
close all
clear
clc

% Start by parsing the timing results of each video and quality.

% TestTransLog is divided by:
%
% Encoding of video "X":
% Regular Transform
% High Quality encode
% ...
% Medium Quality encode
% ...
% Low Quality encode
% ...
% Experimental Transform
% High Quality encode
% ...
% Medium Quality encode
% ...
% Low Quality encode
% ...
% Encode of video "K"

%load transTimingW.mat

%% Constants
totalt_id = '10/10';     % Identifier in string for Total time identification
ftranst_id = 'Forward';         % Identifier in string for Forward time identification
itranst_id = 'Inverse';         % Identifier in string for Inverse time identification

nFrames = 10;                   % Number of encoded frames

res =      [288 352; ...                % Video Resolutions
            720 1280; ...
            1080 1920; ...
            2160 3840];

v_r = ["CIF" "HD" "FHD" "UHD"];      % Tested video resolutions
v_n = [ "waterfall"       "flower"      "bridge"; ...
        "parkrun"         "ducks"       "shields";... 
        "dinner"          "factory"     "parkjoy";... 
        "oldtowncross"    "intotree"    "crowdrun"];

q_n = ["Low" "Medium" "High"];
t_n = ["Regular" "Experimental"];

f_n = '/run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/Libaom/Tests/Encode_Stats/TestTransLog.txt';

%% Parse Timing Results
f = fopen(f_n);
t = textscan(f,'%s','Delimiter','\n');
fclose(f);

time = zeros(length(t_n),size(v_n,1),size(v_n,2),length(q_n),3);
time_m = zeros(length(t_n),size(v_n,1),length(q_n),3);

aux_id = contains(t{1},totalt_id);
ttime_temp = {t{1}{aux_id}};
ttime_temp = squeeze(split(ttime_temp));
us_temp = contains(ttime_temp(:,140),'us');
ttime_temp = ttime_temp(:,139);
ttime_temp = cellfun(@str2num,ttime_temp);
ttime_temp = (ttime_temp./(1000.^us_temp))./1e3;

aux_id = contains(t{1},ftranst_id);
fwdtime_temp = {t{1}{aux_id}};
fwdtime_temp = squeeze(split(fwdtime_temp));
fwdtime_temp = fwdtime_temp(:,7);
fwdtime_temp = cellfun(@str2num,fwdtime_temp)./1e6;

aux_id = contains(t{1},itranst_id);
invtime_temp = {t{1}{aux_id}};
invtime_temp = squeeze(split(invtime_temp));
invtime_temp = invtime_temp(:,7);
invtime_temp = cellfun(@str2num,invtime_temp)./1e6;

for i_t = 1:length(t_n)    
    for i_r = 1:size(v_n,1)             % Resolution Index
        for i_v = 1:size(v_n,2)         % Video Index
            for i_q = 1:length(q_n)
                time(i_t,i_r,i_v,i_q,:) = [ttime_temp((i_r-1)*18 + (i_v-1)*6 + (i_t-1)*3 + i_q) fwdtime_temp((i_r-1)*18 + (i_v-1)*6 + (i_t-1)*3 + i_q) invtime_temp((i_r-1)*18 + (i_v-1)*6 + (i_t-1)*3 + i_q)];
            end
        end
    end
end

time = time(:,:,:,[3 2 1],:);

for i_t = 1:length(t_n)    
    for i_r = 1:length(v_r)
        for i_q = 1:length(q_n)
            time_m(i_t,i_r,i_q,:) = mean(squeeze(time(i_t, i_r,:,i_q,:)),1);
        end
    end
end

transtime_m = time_m(:,:,:,2) + time_m(:,:,:,3);
transtime_per = transtime_m./time_m(2,:,:,1)*100;
transtime_gain = squeeze(transtime_per(2,:,:)-transtime_per(1,:,:));
ttime_gain = squeeze((time_m(2,:,:,1) - time_m(1,:,:,1))./time_m(1,:,:,1)*100);


%% Timing results
h = figure('Name','Timing Results','NumberTitle','off','units','normalized','outerposition',[0 0 1 1]);
setGraphs();
hold on

x = categorical(v_r);
x = reordercats(x,v_r);
bartot = bar(x,squeeze(time_m(1,:,:,1)),'FaceColor', [1 1 1],'LineStyle',':','LineWidth',2);
bartrans1 = bar(x,squeeze(time_m(2,:,:,1)),'FaceColor', 'flat');
bartrans2 = bar(x,squeeze(transtime_m(2,:,:)),'FaceColor', 'flat');

xPos = (1:size(transtime_m,2)) - bartrans1(1).BarWidth/size(transtime_m,3) * linspace(0.85, -0.85, size(transtime_m,3))';

colorm = colormap;

for i=1:size(transtime_m,3)    
    bartrans1(i).BarWidth = bartrans1(i).BarWidth*0.9;
    bartrans2(i).BarWidth = bartrans2(i).BarWidth*0.9;
    bartot(i).EdgeColor = colorm(i,:);
    bartrans1(i).CData = i;
    bartrans2(i).CData = i+3;
    text(   xPos(i,:),time_m(1,:,i,1)'+30, ...
        compose("%.1f",ttime_gain(:,i))+"$\%$", ...
        'HorizontalAlignment','center',...
        'VerticalAlignment','middle', ...
        'HorizontalAlignment','left', ...
        'FontName', 'Times New Roman', ...
        'Interpreter','latex',...
        'Rotation',90);
end
leg = legend(bartrans1,q_n,'Location','northwest');
xlabel('Resolution'),ylabel('Time (s)')

