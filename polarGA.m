function ll = polarGA(llr, POLAR_TYPE)
    switch POLAR_TYPE
        case 0
            ll = polarGAIter(llr);
            return;
        case 1
            %%% todo
        case 21
            Na = size(llr, 2);
            apcidx = power2SumVec(Na); %ASC
            ll = apcGA(Na, llr, apcidx);
        case 22
            Na = size(llr, 2);
            apcidx = power2SumVec(Na); %ASC
            apcidx = apcidx(end:-1:1);% DES
            ll = apcGA(Na, llr, apcidx); 
        case 31
            ll = New_GA(llr);
        case 32
            ll = type2_GA(llr);
        case 33
            ll = type3_GA(llr);
        case 34
            ll = type4_GA(llr);
        case 41
            Na = size(llr, 2);
            vec_punc = QUP(Na);
            vec_punc(vec_punc == 1) = llr;
            ll = polarGAIter(vec_punc);
        case 42
            Na = size(llr, 2);
            vec_punc = vec_shorten(Na);

            vec_punc(vec_punc == 0) = inf;
            vec_punc(vec_punc == 1) = llr;

            ll = polarGAIter(vec_punc);
            ll(Na+1:end) = -1; % set punctured bit to minus for sorting 
        case 43
            Na = size(llr, 2);
            N = pow2(ceil(log2(Na)))*2;
            vec = inf*ones(1, N); %inf for 0
            vec(1:Na) = llr;
            ll = polarGAIter(vec);
            ll(Na+1:end) = -1; % set punctured bit to minus for sorting
        case 44
            Na = size(llr, 2);
            N = pow2(ceil(log2(Na)))*4;
            vec = inf*ones(1, N); %inf for 0
            vec(1:Na) = llr;
            ll = polarGAIter(vec);
            ll(Na+1:end) = -1; % set punctured bit to minus for sorting 
        case 45
            Na = size(llr, 2);
            vec_punc = QUPwithoutbitreverse(Na);
            vec_punc(vec_punc == 1) = llr;
            ll = polarGAIter(vec_punc);
        case 46
            Na = size(llr, 2);
            vec_punc = punc_type1(Na);
            vec_punc(vec_punc == 0) = inf;
            vec_punc(vec_punc == 1) = llr;
            ll = polarGAIter(vec_punc);
            ll(punc_type1(Na) == 0) = -1;
        case 47
            Na = size(llr, 2);
            vec_punc = punc_type2(Na);
            vec_punc(vec_punc == 1) = llr;
            ll = polarGAIter(vec_punc);
        otherwise
            disp('undefine');
    end
end


function llr = New_GA(i_llr)
    N = size(i_llr, 2);   %% block length
    if(N == 1)
        llr = i_llr;
        return
    else
        upper_size = ceil(N/2);
        lower_size = N - upper_size;
        
        llr_u = upperf(i_llr(1:lower_size), i_llr(upper_size+1 : end));
        llr_u = [llr_u, i_llr(length(llr_u)+1: upper_size)];
        assert(length(llr_u) == upper_size);

        llr_l = lowerf(i_llr(1:lower_size), i_llr(upper_size+1 : end));

        llr = [New_GA(llr_u), New_GA(llr_l)];
        return
    end
end

function llr = type2_GA(i_llr)
    N = size(i_llr, 2);   %% block length
    if(N == 1)
        llr = i_llr;
        return
    else
        upper_size = floor(N/2);
        lower_size = N - upper_size;

        
        llr_u = upperf(i_llr(1:upper_size), i_llr(lower_size+1 : end));
        assert(length(llr_u) == upper_size);

        llr_l = lowerf(i_llr(1:upper_size), i_llr(lower_size+1 : end));
        llr_l = [i_llr(upper_size+1: lower_size), llr_l];
        assert(length(llr_l) == lower_size);

        llr = [type2_GA(llr_u), type2_GA(llr_l)];
        return
    end
end

function llr = type3_GA(i_llr)
    N = size(i_llr, 2);   %% block length
    if(N == 1)
        llr = i_llr;
        return
    else
        upper_size = ceil(N/2);
        lower_size = N - upper_size;
        xor_size = min(upper_size, lower_size);
        
        llr_u = upperf(i_llr(upper_size+1-xor_size:upper_size), i_llr(upper_size+1 : end));
        llr_u = [i_llr(1:upper_size-xor_size), llr_u];
        assert(length(llr_u) == upper_size);

        llr_l = lowerf(i_llr(upper_size+1-xor_size:upper_size), i_llr(upper_size+1 : end));

        llr = [type3_GA(llr_u), type3_GA(llr_l)];
        return
    end
end

function llr = type4_GA(i_llr)
    N = size(i_llr, 2);   %% block length
    if(N == 1)
        llr = i_llr;
        return
    else
        upper_size = floor(N/2);
        lower_size = N - upper_size;
        xor_size = min(upper_size, lower_size);

        
        llr_u = upperf(i_llr(1:upper_size), i_llr(upper_size+1 : upper_size+xor_size));
        assert(length(llr_u) == upper_size);

        llr_l = lowerf(i_llr(1:upper_size), i_llr(upper_size+1 : upper_size+xor_size));
        llr_l = [llr_l, i_llr(upper_size+xor_size+1:N)];
        assert(length(llr_l) == lower_size);

        llr = [type4_GA(llr_u), type4_GA(llr_l)];
        return
    end
end


function ll = apcGA(Na, llr, apcidx)
    assert(Na == length(llr));
    assert(Na == sum(apcidx));
    if(length(apcidx) == 1)
        ll = polarGAIter(llr);
        return
    else
        upper_size = apcidx(1);
        lower_size = Na-upper_size;
        xor_size = min(upper_size, lower_size);

        llr_u = upperf(llr(1:xor_size), llr(upper_size+1 : upper_size+xor_size));
        llr_u = [llr_u, llr(xor_size+1: upper_size)];
        llr_l = [lowerf(llr(1:xor_size), llr(upper_size+1 : upper_size+xor_size)), llr(upper_size+xor_size+1: end)];
    
        ll = [polarGAIter(llr_u), apcGA(lower_size,llr_l, apcidx(2:end))];
        return
    end
end



function llr = polarGAIter(i_llr)
    N = size(i_llr, 2);   %% block length
    if(N == 1)
        llr = i_llr;
        return
    else
        llr_u = upperf(i_llr(1:N/2), i_llr(N/2+1 : end));
        
        llr_l = lowerf(i_llr(1:N/2), i_llr(N/2+1 : end));

        llr = [polarGAIter(llr_u), polarGAIter(llr_l)];
        return
    end
end

%
function z = upperf(x1, x2)
    z = [];
    for arg = 1-((1-newapproxTrifinovFormula(x1)).*(1-newapproxTrifinovFormula(x2)))
        z = [z,bisetionInvTrifinov(arg, 10^(-6), 500)];
    end
    return
end

function z = lowerf(x1, x2)
    z = x1+x2;
    return
end

function [x, num_iter] = bisetionInvTrifinov(phi, range, max_iter)
    if phi == 1
        x = 0;
        num_iter = 0;
        return
    end
    if phi == 0
        x = inf;
        num_iter = 0;
        return
    end
    %%% init
    x_u_bound = 200;
    x_l_bound = 0;
    phi_l = newapproxTrifinovFormula(x_u_bound);
    phi_u = newapproxTrifinovFormula(x_l_bound); %phi = 1 when x = 0 in new function
    i = 0;

    %%% case x out of right
    if(phi < phi_l)
        x = x_u_bound;
        num_iter = i;
        return
    end

    if phi > 1 || phi > phi_u
        assert(false, 'out of the define');
        x = 0;
        num_iter = -1;
        return
    end
    
    while(i < max_iter)
        i = i+1;
        x_new_bound = (x_l_bound+ x_u_bound)/2;
        phi_new_bound = newapproxTrifinovFormula(x_new_bound);
        if(phi_new_bound > phi)
            x_l_bound = x_new_bound;
        else
            x_u_bound = x_new_bound;
        end
        if(x_u_bound - x_l_bound < range)
            x = (x_l_bound+ x_u_bound)/2;
            num_iter = i;
            return
        end
    end
end

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

function phi = approxTrifinovFormula(x)
    %%% https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=6584444
    phi = zeros(size(x));

    condi = x < 10;
    a = -0.4527;
    b = 0.0218;
    r = 0.86;
    phi(condi) = exp(a*(x(condi).^r)+b);
    x_1 = x(~condi);
    phi(~condi) = (sqrt(pi./x_1).*exp(-x_1/4).*(1-3./x_1) + sqrt(pi./x_1).*exp(-x_1/4).*(1+1./(7*x_1)))/2 ;
    phi(x == 0) = 1;
    
end

