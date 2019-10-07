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

f_n = '/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Encode_Stats/TestCosBitLog.txt';

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
figure('Name','Timing Results','NumberTitle','off')
hold on

x = categorical(v_r);
x = reordercats(x,v_r);
bartot = bar(x,time_m(:,:,1), 'FaceColor','flat');
bartrans = bar(x,transtime_m,'FaceColor','flat');
xPos = (1:size(transtime_m,1)) - bartrans(1).BarWidth/size(transtime_m,2) * linspace(0.85, -0.85, size(transtime_m,2))';
for i=1:size(transtime_m,2)    
    l{i} = q_n(i);
    bartot(i).CData = i;
    bartrans(i).CData = i+3;
    text(   xPos(i,:),time_m(:,i,1)'+10, ...
        compose("%.1f %%",transtime_per(:,i)), ...
        'HorizontalAlignment','center',...
        'VerticalAlignment','middle', ...
        'HorizontalAlignment','left', ...
        'FontName', 'Helvetica', ...
        'Rotation',90);
end
legend(bartot,l,'Location','bestoutside')
xlabel('Resolution'),ylabel('Time (s)')
setGraphs();
