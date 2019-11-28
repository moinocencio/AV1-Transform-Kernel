s = [4 8 16 32 64];
N1D = [6 10 14 18 22];
N2D = 2*(N1D.*s);
fps = 30;

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

nblocks = nblocks*fps;
ncycles4 = nblocks(:,1)*N2D(1);
