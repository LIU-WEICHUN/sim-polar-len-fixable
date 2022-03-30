function L = NewType1GenMatrix(N)
    if(N == 1)
        L = [1];
        return
    else
        N_upper = ceil(N/2);
        N_lower = floor(N/2);
        G_upper = NewType1GenMatrix(N_upper);
        G_lower = NewType1GenMatrix(N_lower);
        L = [G_upper, zeros(N_upper, N_lower); 
             G_lower(:,1:min(N_lower, N_upper)), zeros(N_lower, N_upper-N_lower ), G_lower];

        return
    end
end