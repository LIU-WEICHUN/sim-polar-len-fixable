function A = apcGenMatrix(Na)
    apcidx = power2SumVec(Na);  %%% DES
    p = length(apcidx);  
%     apcidx = apcidx(end:-1:1);  %%% ASC
    A = apcGenMatrixIter(p-1, apcidx);
return

function L = apcGenMatrixIter(l, apcidx)
    if(l == 0)
        L = polarMatrix(apcidx(l+1));
        return
    else
        prevL = apcGenMatrixIter(l-1, apcidx);
        row_zero = apcidx(l+1);
        size_prevL = size(prevL);
        col_zero = size_prevL(2);
        N_G = sum(apcidx(1:l+1))/apcidx(l+1);
        L = [polarMatrix(apcidx(l+1)), zeros(row_zero, col_zero);
            kron(ones(N_G, 1), polarMatrix(apcidx(l+1))), prevL];
        return
    end







    