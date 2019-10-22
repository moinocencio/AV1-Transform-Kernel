function exps = decPow2(n)
    %  decPow2 deconstructs number n to powers of 2
    %
    %   n   -   number to deconstruct
        n_t = n;
        res = 0;
        i = 1;
        while n_t ~= 0
            exps(i) = floor(log2(abs(n_t)));
            n_t = n - sum(2.^exps)*sign(n_t);     
            i = i +1 ;       
        end
end    