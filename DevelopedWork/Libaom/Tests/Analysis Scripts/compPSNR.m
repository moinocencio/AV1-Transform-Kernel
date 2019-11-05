function [PSNR, v1, v2, v3, vori] = compPSNR(v1_p, v2_p, v3_p, vori_p, res, nFrames)
% compPSNR compares PSNR between 3 input videos and its original sequence
%	
%   v1_p        - Video 1 input path
%   v2_p        - Video 2 input path
%   v3_p        - Video 3 input path
%   vori_p      - Original Video input path
%   res         - 2 Size vector with [v_h v_w]
%   nFrames     - Number of frames to decode
%
% Outputs PSNR of 3 input videos, and structures 

    vori = yuv4mpeg2mov(vori_p,nFrames);
    v1 = loadFileYuv(v1_p,res(2),res(1),1:nFrames);
    v2 = loadFileYuv(v2_p,res(2),res(1),1:nFrames);
    v3 = loadFileYuv(v3_p,res(2),res(1),1:nFrames);

    e_cum = zeros(1,3);
    ems = zeros(1,3);

    for i=1:nFrames
        e_cum(1) = e_cum(1) + sum(sum(sum((vori(i).cdata - v1(i).cdata).^2)));
        e_cum(2) = e_cum(2) + sum(sum(sum((vori(i).cdata - v2(i).cdata).^2)));
        e_cum(3) = e_cum(3) + sum(sum(sum((vori(i).cdata - v3(i).cdata).^2)));
    end

    ems = e_cum./(res(1)*res(1)*3*nFrames);

    PSNR = 10*log10(255^2./ems);
end