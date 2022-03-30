function ll = apcGA(Na, llr)
    assert(Na == length(llr));
    apcidx = power2SumVec(Na); %ASC
    if(length(apcidx) == 1)
        ll = polarGAIter(llr);
        return
    else
        upper_size = apcidx(1);
        lower_size = Na-upper_size;

        llr_u = upperf(llr(1:upper_size), llr(upper_size+1 : upper_size*2));
        llr_l = [lowerf(llr(1:upper_size), llr(upper_size+1 : upper_size*2)), llr(upper_size*2+1: end)];

        
        ll = [polarGAIter(llr_u), apcGA(lower_size,llr_l)];
        return
    end


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
