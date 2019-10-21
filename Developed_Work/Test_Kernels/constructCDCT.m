function constructCDCT(siz,scale_f)
% Prints C code to terminal to implement TestDCT

    [n M] = getTransMatrix(siz,scale_f);
    M = round(M);
    signM = strings(size(M));
    signM(sign(round(M))==-1) = "-";
    signM(sign(round(M))==1) = "+";
    str = "";

    for i1 = 0:siz-1
        str = str + sprintf("\noutput[%i] = ", i1);
        for i2 = 0:siz-1
            str = str + sprintf(" %s ((%i * input[%i])>>(%i))",signM(i1+1,i2+1), abs(M(i1+1,i2+1)),i2,scale_f);
        end
        str = str + sprintf(";");
    end
    display(str)  
    clipboard('copy',str)
end