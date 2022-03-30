function vec_punct = vec_shorten(Na)
    N_mom = pow2(ceil(log2(Na)));
    vec_punct = ones(1,N_mom);
    vec_punct(Na+1:end) = 0;
end

