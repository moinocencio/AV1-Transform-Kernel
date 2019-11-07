function [coefs] = DCT8(inVector)
    coefs = zeros(5,8);
    t1 = zeros(1,8);
    t2 = zeros(1,8);

    bf1(0+1) = inVector(0+1) + inVector(7+1);
    bf1(1+1) = inVector(1+1) + inVector(6+1);
    bf1(2+1) = inVector(2+1) + inVector(5+1);
    bf1(3+1) = inVector(3+1) + inVector(4+1);
    bf1(4+1) = -inVector(4+1) + inVector(3+1);
    bf1(5+1) = -inVector(5+1) + inVector(2+1);
    bf1(6+1) = -inVector(6+1) + inVector(1+1);
    bf1(7+1) = -inVector(7+1) + inVector(0+1);
    coefs(1,:) = bf1;

    bf0 = bf1;
    bf1(0+1) = bf0(0+1) + bf0(3+1);
    bf1(1+1) = bf0(1+1) + bf0(2+1);
    bf1(2+1) = -bf0(2+1) + bf0(1+1);
    bf1(3+1) = -bf0(3+1) + bf0(0+1);
    bf1(4+1) = bf0(4+1);
    bf1(5+1) = floor((-185*bf0(5+1) + 185*bf0(6+1))/2^8);
    bf1(6+1) = floor((185*bf0(6+1) + 185*bf0(5+1))/2^8);
    bf1(7+1) = bf0(7+1);
    coefs(2,:) = bf1;

    bf0 = bf1;
    bf1(0+1) = floor((185*bf0(0+1) + 185*bf0(1+1))/2^8);
    bf1(1+1) = floor((-185*bf0(1+1) + 185*bf0(0+1))/2^8);
    bf1(2+1) = floor((104*bf0(2+1) + 239*bf0(3+1))/2^8);
    bf1(3+1) = floor((104*bf0(3+1) - 239*bf0(2+1))/2^8);
    bf1(4+1) = bf0(4+1) + bf0(5+1);
    bf1(5+1) = -bf0(5+1) + bf0(4+1);
    bf1(6+1) = -bf0(6+1) + bf0(7+1);
    bf1(7+1) = bf0(7+1) + bf0(6+1);
    coefs(3,:) = bf1;

    bf0 = bf1;
    bf1(0+1) = bf0(0+1);
    bf1(1+1) = bf0(1+1);
    bf1(2+1) = bf0(2+1);
    bf1(3+1) = bf0(3+1);
    bf1(4+1) = floor((56*bf0(4+1) + 252*bf0(7+1))/2^8);
    bf1(5+1) = floor((216*bf0(5+1) + 147*bf0(6+1))/2^8);
    bf1(6+1) = floor((216*bf0(6+1) - 147*bf0(5+1))/2^8);
    bf1(7+1) = floor((56*bf0(7+1) - 252*bf0(4+1))/2^8);
    coefs(4,:) = bf1;

    bf0 = bf1;
    bf1(0+1) = bf0(0+1);
    bf1(1+1) = bf0(4+1);
    bf1(2+1) = bf0(2+1);
    bf1(3+1) = bf0(6+1);
    bf1(4+1) = bf0(1+1);
    bf1(5+1) = bf0(5+1);
    bf1(6+1) = bf0(3+1);
    bf1(7+1) = bf0(7+1);
    coefs(5,:) = bf1;
end