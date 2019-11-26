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
totalt_id = '10/10';            % Identifier in string for Total time identification
ftranst_id = 'Forward';         % Identifier in string for Forward time identification
itranst_id = 'Inverse';         % Identifier in string for Inverse time identification
quant_id = 'Quantizer';         % Quantizer histogram identifier

nFrames = 10;                   % Number of encoded frames

res =      [288 352; ...                % Video Resolutions
            720 1280; ...
            1080 1920; ...
            2160 3840];

v_r = ["CIF" "HD" "FHD" "UHD"];      % Tested video resolutions
v_n = [ "waterfall"       "flower"      "bridge" ...
        "parkrun"         "ducks"       "shields"... 
        "dinner"          "factory"     "parkjoy"... 
        "oldtowncross"    "intotree"    "crowdrun"];

q_n = ["Low" "Medium" "High"];

f_n = '/run/media/moinocencio/Data/Tese/Master-Thesis/DevelopedWork/Libaom/Tests/Encode_Stats/TestCosBitLog.txt';

%% Parse Timing Results
f = fopen(f_n);
t = textscan(f,'%s','Delimiter','\n');
fclose(f);

time = zeros(numel(v_n),length(q_n),3);

aux_id = contains(t{1},totalt_id);
ttime_temp = {t{1}{aux_id}};
ttime_temp = squeeze(split(ttime_temp));
us_temp = contains(ttime_temp(:,9),'us');
ttime_temp = ttime_temp(:,8);
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

aux_id = find(contains(t{1},quant_id))+1;
quantq_i = [aux_id(2:3:end)'; aux_id(3:3:end)'; aux_id(1:3:end)'];   % Low Medium High quality start quantizer index
quanthist = zeros(3,64);
for i_q = 1:size(quantq_i,1)     % Quality Index        
    for i_v = 1:size(quantq_i,2)     % Video Index        
        temp_s = squeeze(split({t{1}{quantq_i(i_q,i_v)+(0:5)}}));
        quanthist(i_q,cellfun(@str2num,temp_s(:,1))+1) = quanthist(i_q,cellfun(@str2num,temp_s(:,1))+1) + cellfun(@str2num,temp_s(:,4))';
    end
end
quanthist = quanthist(1:3,:)./sum(quanthist,2)*100;

for i_v = 1:numel(v_n)          % Video Index
    for i_q = 1:length(q_n)     % Quality Index        
        time(i_v,i_q,:) = [ttime_temp((i_v - 1)*3 + i_q) fwdtime_temp((i_v - 1)*3 + i_q) invtime_temp((i_v - 1)*3 + i_q)];
    end
end

time = reshape(time,[3 4 3 3]);
time = permute(time,[2 1 3 4]);
time = time(:,:,[2 3 1],:);

for i_r = 1:length(v_r)
    for i_q = 1:length(q_n)
        time_m(i_r,i_q,:) = mean(squeeze(time(i_r,:,i_q,:)),1);
    end
end

transtime_m = time_m(:,:,2) + time_m(:,:,3);
transtime_per = transtime_m./time_m(:,:,1)*100;

%% Timing results
h = figure('Name','Timing Results','NumberTitle','off','units','normalized','outerposition',[0 0 1 1]);
hold on
setGraphs();

x = categorical(v_r);
x = reordercats(x,v_r);
bartot = bar(1:length(x),time_m(:,:,1), 'FaceColor','flat');
bartrans = bar(1:length(x),transtime_m,'FaceColor','flat');
xticklabels(x);
xPos = (1:size(transtime_m,1)) - bartrans(1).BarWidth/size(transtime_m,2) * linspace(0.85, -0.85, size(transtime_m,2))';
for i=1:size(transtime_m,2)    
    l{i} = q_n(i);
    bartot(i).CData = i;
    bartrans(i).CData = i+3;
    text(   xPos(i,:),time_m(:,i,1)'+10, ...
        compose("%.1f",transtime_per(:,i))+"$\%$", ...
        'HorizontalAlignment','center',...
        'VerticalAlignment','middle', ...
        'HorizontalAlignment','left', ...
        'FontName', 'Times New Roman', ...
        'Interpreter','latex',...
        'Rotation',90);
end
leg = legend(bartot,l(:),'Location','northwest');
xlabel('Resolution'),ylabel('Time (s)')

%% Quantizer Histogram
h = figure('Name','Quantizer Histogram','NumberTitle','off','units','normalized','outerposition',[0 0 1 1]);
setGraphs();
hold on

b_q = bar(0:1,[quanthist(:,1)' ; zeros(1,3)],'FaceColor','flat');
b_q(1).CData = 1;
b_q(2).CData = 2;
b_q(3).CData = 3;
b_q(1).LineWidth = 0.01;
b_q(2).LineWidth = 0.01;
b_q(3).LineWidth = 0.01;
b_q(1).BarWidth = 1;
b_q(2).BarWidth = 1;
b_q(3).BarWidth = 1;

heck = bar(1:63,quanthist(1,2:end),'FaceColor','flat');
    heck.CData = 1;
heck = bar(1:63,quanthist(2,2:end),'FaceColor','flat');
    heck.CData = 2;
heck = bar(1:63,quanthist(3,2:end),'FaceColor','flat');
    heck.CData = 3;

legend(b_q,q_n);
xlabel('Quantizer'),ylabel('Relative Use (\%)')

save timingAnalW.mat