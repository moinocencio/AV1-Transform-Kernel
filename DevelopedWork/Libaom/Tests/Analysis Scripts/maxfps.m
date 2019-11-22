s = [4 8 16 32 64];
t1D = [59 98 137 177 216]*10^(-9);
t2D = (s.*t1D)*2;
f2D = 1./t2D;

res =   [1280 720,
         1920 1080,
         3840 2160,
         7680 4320];

npixel = res(:,1).*res(:,2);
for i = 1:4
    for k = 1:5
        nblocks(i,k) = npixel(i)/(s(k).^2);
    end;
end;

for i=1:4
    fps(i,:) = f2D./nblocks(i,:);
end