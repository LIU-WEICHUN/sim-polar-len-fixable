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


% function phi = TrifinovFormula(x)
%     if x > 0
%         fun = @(u) tanh(u/2).*exp(-((u-x).^2)/(4*x));
%         phi = 1 - (1/sqrt(4*pi*x))*integral(fun, -inf, inf);
%         return
%     elseif x == 0
%         phi = 1;
%         return;
%     else
%         assert(true, "x out of range");
%         return;
%     end
%     

function z = upperf(x1, x2)
    z = [];
    for arg = 1-((1-TrifinovFormula(x1)).*(1-TrifinovFormula(x2)))
        z = [z,bisetionInvTrifinov(arg, 10^(-6), 500)];
    end
%     z = finverse(TrifinovFormula, 1-((1-TrifinovFormula(x1))*(1-TrifinovFormula(x2))));
    return

function z = lowerf(x1, x2)
    z = x1+x2;
    return