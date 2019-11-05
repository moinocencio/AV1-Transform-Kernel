function constructCDCT(siz,scale_f)
% Prints C code to terminal to implement TestDCT

    [M] = getTransMatrix(siz,scale_f);    
    M = round(M*(sqrt(siz/2))*(2^scale_f));
    signM = strings(size(M));
    signM(sign(round(M))==-1) = "-";
    signM(sign(round(M))==1) = "+";
    str = sprintf("  int32_t *bf0, *bf1;\n  bf0 = output;\n  bf1 = input;");

    for i1 = 0:siz-1
        str = str + sprintf("\n  bf0[%i] = (", i1);
        for i2 = 0:siz-1
            if i2 ~= 0
                str = str + sprintf(" %s ",signM(i1+1,i2+1)); 
            end           
            str = str + sprintf("(%i * bf1[%i])", abs(M(i1+1,i2+1)),i2);
        end
        str = str + sprintf(")>>(%i);", scale_f);
    end
    display(str)  
    clipboard('copy',str)
end