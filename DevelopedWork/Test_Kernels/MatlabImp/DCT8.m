function [coefs] = DCT8(inVector)
    coefs = zeros(1,8);
    t1 = zeros(1,8);
    t2 = zeros(1,8);

    t1(1) = inVector(1) + inVector(8);
    t1(2) = inVector(2) + inVector(7);
    t1(3) = inVector(3) + inVector(6);
    t1(4) = inVector(4) + inVector(5);
    t1(5) = -inVector(5) + inVector(4);
    t1(6) = -inVector(6) + inVector(3);
    t1(7) = -inVector(7) + inVector(2);
    t1(8) = -inVector(8) + inVector(1);
  
    t2 = t1;
    t1(1) = t2(1) + t2(4);
    t1(2) = t2(2) + t2(3);
    t1(3) = -t2(3) + t2(2);
    t1(4) = -t2(4) + t2(1);
    t1(5) = t2(5);
    t1(6) = (-185*t2(6) + 185*t2(7))/2^8;
    t1(7) = (185*t2(7) + 185*t2(6))/2^8;
    t1(8) = t2(8);
  
    t2 = t1;
    t1(1) = (185*t2(1) + 185*t2(2))/2^8;
    t1(2) = (-185*t2(2) + 185*t2(1))/2^8;
    t1(3) = (104*t2(3) + 239*t2(4))/2^8;
    t1(4) = (104*t2(4) - 239*t2(3))/2^8;
    t1(5) = t2(5) + t2(6);
    t1(6) = -t2(6) + t2(5);
    t1(7) = -t2(7) + t2(8);
    t1(8) = t2(8) + t2(7);
  
    t2 = t1;
    t1(1) = t2(1);
    t1(2) = t2(2);
    t1(3) = t2(3);
    t1(4) = t2(4);
    t1(5) = (56*t2(5) + 252*t2(7))/2^8;
    t1(6) = (216*t2(6) + 147*t2(7))/2^8;
    t1(7) = (216*t2(7) - 147*t2(6))/2^8;
    t1(8) = (56*t2(8) - 252*t2(5))/2^8;
  
    t2 = t1;
    coefs(1) = t2(1);
    coefs(2) = t2(5);
    coefs(3) = t2(3);
    coefs(4) = t2(7);
    coefs(5) = t2(2);
    coefs(6) = t2(6);
    coefs(7) = t2(4);
    coefs(8) = t2(8);
end