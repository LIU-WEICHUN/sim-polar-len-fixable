function L = NewType2GenMatrix(N)
    if(N == 1)
        L = [1];
        return
    else
        N_upper = floor(N/2);
        N_lower = ceil(N/2);
        G_upper = NewType2GenMatrix(N_upper);
        G_lower = NewType2GenMatrix(N_lower);
        L = [G_upper, zeros(N_upper, N_lower); 
             G_lower(:,(N_lower - N_upper+1):N_lower), zeros(N_lower, N_upper-N_lower ), G_lower];

        return
    end
end