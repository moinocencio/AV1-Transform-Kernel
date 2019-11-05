function [v, vori, err] = getErrorIm(v_p, vori_p, res, nFrames, invert) 
% getErrorIm outputs error image of input video with original
%
%	v_p         - Video input path
%   vori_p      - Original Video input path
%   res         - 2 Size vector with [v_h v_w]
%   nFrames     - Number of frames to decode
%   invert      - Invert error image (non zero to invert)
%
% Outputs video struct of error image sequence

    vori = yuv4mpeg2mov(vori_p,nFrames);
    v = loadFileYuv(v_p,res(2),res(1),1:nFrames);

    if(invert ~= 0) 
        for i=1:nFrames
            err(i) = im2frame(255 - (vori(i).cdata - v(i).cdata));
        end
    else
        for i=1:nFrames
            err(i) = im2frame(vori(i).cdata - v(i).cdata);
        end
    end
end