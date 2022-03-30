function vec_punct = punc_type1(Na)
    N_mom = pow2(ceil(log2(Na)));
    half = N_mom/2;
    P = N_mom - Na;
    punct_size_lower = ceil(P/2);
    vec_punct = ones(1,N_mom);
    vec_punct(N_mom-punct_size_lower+1:end) = 0;
    vec_punct(half-(P-punct_size_lower)+1:half) = 0;
end

