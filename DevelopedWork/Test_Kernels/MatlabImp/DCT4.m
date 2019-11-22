function [coefs] = DCT4(inVector)
    coefs = zeros(2,4);

    bf0(0+1) = inVector(0+1) + inVector(3+1);
    bf0(1+1) = inVector(1+1) + inVector(2+1);
    bf0(2+1) = -inVector(2+1) + inVector(1+1);
    bf0(3+1) = -inVector(3+1) + inVector(0+1);
    coefs(1,:) = bf0;

    bf1(0+1) = floor(((bf0(0+1) + bf0(1+1))*185)/2^8);
    bf1(1+1) = floor(((bf0(2+1)*104) + (bf0(3+1)*239))/2^8);
    bf1(2+1) = floor(((bf0(0+1) - bf0(1+1))*185)/2^8);
    bf1(3+1) = floor(((bf0(3+1)*104) - (bf0(2+1)*239))/2^8);
    coefs(2,:) = bf1;
end