function vec_punct = punc_type2(Na)
    N_mom = pow2(ceil(log2(Na)));
    half = N_mom/2;
    P = N_mom - Na;
    punct_size_upper = ceil(P/2);
    vec_punct = ones(1,N_mom);
    vec_punct(1:punct_size_upper) = 0;
    vec_punct(half+1:half+(P-punct_size_upper)) = 0;
end

