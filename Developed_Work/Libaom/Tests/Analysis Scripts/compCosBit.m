%% Compare cosbit Encode/Decode error
close all
clear all 
clc

%% Initializers
v_ori_n =  ["/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/waterfall_cif.y4m" ,...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/ducks_take_off_420_720p50.y4m",...      
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/park_joy_1080p50.y4m",...      
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Test_Videos/in_to_tree_2160p50.y4m"];

v_dec_n =  ["/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/waterfall20f_reg_dec.y4m" ...   % Encoded/Decoded normally
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/duckstakeoff50f_reg_dec.y4m" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/parkjoy20f_reg_dec.y4m" ...
            "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/intotree20f_reg_dec.y4m"];

v_dec10b_n =   ["/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/waterfall20f_10b_dec.y4m" ...  % Encoded/Decoded with 10 bit cosine
                "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/duckstakeoff50f_10b_dec.y4m" ...
                "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/parkjoy20f_10b_dec.y4m" ...
                "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/intotree20f_10b_dec.y4m"];

v_dec16b_n =   ["/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/waterfall20f_16b_dec.y4m" ...  % Encoded/Decoded with 16 bit cosine
                "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/duckstakeoff50f_16b_dec.y4m" ...
                "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/parkjoy20f_16b_dec.y4m" ...
                "/run/media/moinocencio/Data/Tese/Master-Thesis/Developed_Work/Libaom/Tests/Enc_DecVideos/intotree20f_16b_dec.y4m"];
vw =   [352;
        1280;
        1920;
        3840];

vh =   [288;
        720;
        1080;
        2160];

nFrames = 5;

%% Open Videos
ems = zeros(4,3);
PSNR = zeros(4,3);

for j=1:4
    v_ori_s = yuv4mpeg2mov(v_ori_n(j),nFrames);
    %v_ori_s = loadFileYuv(v_ori_n,vw,vh,1:nFrames);
    v_dec_s = loadFileYuv(v_dec_n(j),vw(j),vh(j),1:nFrames);
    v_dec10b_s = loadFileYuv(v_dec10b_n(j),vw(j),vh(j),1:nFrames);
    v_dec16b_s = loadFileYuv(v_dec16b_n(j),vw(j),vh(j),1:nFrames);

    %% Error Mean Square
    e_cum_dec = 0;
    e_cum_dec10b = 0;
    e_cum_dec16b = 0;

    for i=1:nFrames
        e_dec(i) = im2frame(v_ori_s(i).cdata - v_dec_s(i).cdata);
        e_dec10b(i) = im2frame(v_ori_s(i).cdata - v_dec10b_s(i).cdata);
        e_dec16b(i) = im2frame(v_ori_s(i).cdata - v_dec16b_s(i).cdata);

        e_cum_dec = e_cum_dec + sum(sum(sum((v_ori_s(i).cdata - v_dec_s(i).cdata).^2)));
        e_cum_dec10b = e_cum_dec10b + sum(sum(sum((v_ori_s(i).cdata - v_dec10b_s(i).cdata).^2)));
        e_cum_dec16b = e_cum_dec16b + sum(sum(sum((v_ori_s(i).cdata - v_dec16b_s(i).cdata).^2)));
    end

    ems(j,1) = e_cum_dec/(vw(j)*vh(j)*3*nFrames);
    ems(j,2) = e_cum_dec10b/(vw(j)*vh(j)*3*nFrames);
    ems(j,3) = e_cum_dec16b/(vw(j)*vh(j)*3*nFrames);

    PSNR(j,1) = 10*log10(255^2/ems(j,1));
    PSNR(j,2) = 10*log10(255^2/ems(j,2));
    PSNR(j,3) = 10*log10(255^2/ems(j,3));

    %% Display Results
    figure(j)
    subplot(2,3,1),imshow(v_dec_s(3).cdata);
    title('Regular'),xlabel(string(PSNR(j,1)))
    subplot(2,3,2),imshow(v_dec10b_s(3).cdata);
    title('10 bit'),xlabel(string(PSNR(j,2)))
    subplot(2,3,3),imshow(v_dec16b_s(3).cdata);
    title('16 bit'),xlabel(string(PSNR(j,3)))

    subplot(2,3,4),imshow(255 - e_dec(4).cdata);
    subplot(2,3,5),imshow(255 - e_dec(4).cdata);
    subplot(2,3,6),imshow(255 - e_dec(4).cdata);
end

%% Hist
res = categorical({'CIF','HD','FHD','UHD'});
res = reordercats(res,{'CIF','HD','FHD','UHD'});

figure(5)
b_psnr = bar(res,PSNR,'FaceColor','flat');
setGraphs();

ylim([min(min(PSNR))-2 max(max(PSNR))+2])

font_s = 16;
xPos = (1:4)-b_psnr(1).BarWidth/3*linspace(0.9,-0.9,3)';
text(xPos(1,:),PSNR(:,1)+0.1,compose("%.2f %%",PSNR(:,1)),'HorizontalAlignment','center',...
    'VerticalAlignment','middle','HorizontalAlignment','left','FontSize',font_s,'Rotation',90)
text(xPos(2,:),PSNR(:,1)+0.1,compose("%.2f %%",PSNR(:,2)),'HorizontalAlignment','center',...
    'VerticalAlignment','middle','HorizontalAlignment','left','FontSize',font_s,'Rotation',90)
text(xPos(3,:),PSNR(:,1)+0.1,compose("%.2f %%",PSNR(:,3)),'HorizontalAlignment','center',...
    'VerticalAlignment','middle','HorizontalAlignment','left','FontSize',font_s,'Rotation',90)

setGraphs();
b_psnr(1).CData = 1;
b_psnr(2).CData = 2;
b_psnr(3).CData = 3;

l = cell(1,3);
l{1} = 'Regular';l{2} = '10 bit';l{3} = '16 bit';
legend(b_psnr,l);