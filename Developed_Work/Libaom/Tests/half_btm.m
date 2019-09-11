%% half_btm test
% libaom transform stage relies on a function of this name, which is here
% replicated

function [out_d, out_ds, out_i] = half_btm(w0, in0, w1, in1, bit) 
    out_d = (w0*in0 + w1*in1);
    out_ds = (w0*in0 + w1*in1 + 2^(bit-1))/2^bit;
    out_i = floor(bitsra(int64(w0*in0) + int64(w1*in1) + bitsll(1,bit-1),bit));
end