function [err] = getQuantError(siz,scale_f)
%   getQuantError returns the quantization error for a certain transformation matrix

%   siz - Vector size
%   scale_f - scaling factor in number of bits

    M = getTransMatrix(siz);
    err = (max(max(M)) - min(min(M)))/(2^scale_f);
end