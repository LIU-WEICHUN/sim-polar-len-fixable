function A = apcDESGenMatrix(Na)
    apcidx = power2SumVec(Na);  %%% DES
    p = length(apcidx);  
    A = apcDESGenMatrixIter(p-1, apcidx);
return

function L = apcDESGenMatrixIter(l, apcidx)
    if(l == 0)
        L = polarMatrix(apcidx(l+1));
        return
    else
        prevL = apcDESGenMatrixIter(l-1, apcidx);
        row_zero = apcidx(l+1);
        GNl = polarMatrix(apcidx(l+1));
        size_prevL = size(prevL);
        col_zero = size_prevL(2);

        L = [GNl, zeros(row_zero, col_zero);
            GNl(1:sum(apcidx(1:l)),:), prevL];
        return
    end







    