function [M] = getTransMatrix(siz,scale_f)
%  getTransMatrix returns string matrix with coefficients for 1D DCT
%
%   siz - Size of the 1D vector to transform
    cos_v = ((2*(0:siz-1)+1)'*(0:siz-1))';  
    %M_s = [compose("sqrt(1/%d)",repmat(siz,1,siz)); compose("sqrt(2/%d)",repmat(siz,siz-1,siz))] + compose("cos(%d pi",cos_v) + compose("/%d)",repmat(2*siz,siz,siz));
    %M_s = compose("cos(%d pi",cos_v) + compose("/%d)",repmat(2*siz,siz,siz));
    M = cos(cos_v*pi/(2*siz)).*[repmat(sqrt(1/siz),1,siz); repmat(sqrt(2/siz),siz-1,siz);];
end    