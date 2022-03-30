function F = polarMatrix(N)
    F = [1];
    if(N <= 1)
        return
    else
        kernal = [1,0; 1,1];
        size_F = size(F);
        while(size_F(1) < N)
            F = kron(F, kernal);
            size_F = size(F);
        end
        return
    end