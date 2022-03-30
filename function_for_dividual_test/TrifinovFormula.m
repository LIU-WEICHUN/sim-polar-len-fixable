function phi = TrifinovFormula(x)
    faster = true;
    if faster ~= true
        if x > 0
            fun = @(u) tanh(u/2).*exp(-((u-x).^2)./(4*x));
            integ = integral(fun, -inf, inf,"ArrayValued",true);
            phi = 1 - (1./sqrt(4*pi*x)).*integ;
            return
        elseif x == 0
            phi = 1;
            return;
        else
            assert(true, "x out of range");
            return;
        end
    else
        %%% https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=6584444
        if x < 10
            a = -0.4527;
            b = 0.0218;
            r = 0.86;
            phi = exp(a*(x.^r)+b);
            return
        else
            phi = (sqrt(pi./x).*exp(-x/4).*(1-3./x) + sqrt(pi./x).*exp(-x/4).*(1+1./(7*x)))/2 ;
        end
    end
