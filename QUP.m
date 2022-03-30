function vec_punct = QUP(Na)
    N_mom = pow2(ceil(log2(Na)));
    vec_init = ones(1,N_mom);
    vec_init(1:N_mom-Na) = 0;
    vec_punct = bitrevorder(vec_init);
end

