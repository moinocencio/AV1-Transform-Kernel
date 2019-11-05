function [coefs] = DCT4(inVector)
    coefs = zeros(1,4);
    t = zeros(1,4);

    t(1) = inVector(1) + inVector(4);
    t(2) = inVector(2) + inVector(3);
    t(3) = -inVector(3) + inVector(2);
    t(4) = -inVector(4) + inVector(1);

    coefs(1) = floor(((t(1) + t(2))*181)/2^8);
    coefs(2) = floor(((t(3)*98) + (t(4)*237))/2^8);
    coefs(3) = floor(((t(1) - t(2))*181)/2^8);
    coefs(4) = floor(((t(4)*98) - (t(3)*237))/2^8);
end