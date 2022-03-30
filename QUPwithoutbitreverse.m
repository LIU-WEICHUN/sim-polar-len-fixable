function vec_punct = QUPwithoutbitreverse(Na)
    N_mom = pow2(ceil(log2(Na)));
    vec_punct = ones(1,N_mom);
    vec_punct(1:N_mom-Na) = 0;
end

