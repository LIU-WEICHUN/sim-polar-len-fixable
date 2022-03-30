
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