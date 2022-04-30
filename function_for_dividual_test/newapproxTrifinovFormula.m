function phi = newapproxTrifinovFormula(x)
    %%% https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=6584444
    phi = zeros(size(x));
    condzero = (0<=x)&(x<=0.25) ;
    conds = (0.25< x)& (x< 10);
    condl = x >= 10;
    a = -0.4527;
    b = 0.0218;
    r = 0.86;
    phi(condzero) = exp(x(condzero)*(-0.1156/0.25));
    phi(conds) = exp(a*(x(conds).^r)+b);
    x_1 = x(condl);
    phi(condl) = (sqrt(pi./x_1).*exp(-x_1/4).*(1-3./x_1) + sqrt(pi./x_1).*exp(-x_1/4).*(1+1./(7*x_1)))/2 ;
    phi(x == 0) = 1;
    
end


