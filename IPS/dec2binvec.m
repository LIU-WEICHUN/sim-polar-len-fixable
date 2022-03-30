function binvec = dec2binvec(max_val, decvec)
N = floor(log2(max_val));
sample = length(decvec);
binvec = zeros(sample ,N+1);
for level = N:-1:0
    poly = pow2(level);
    cond_vec = (decvec >= poly);
    binvec(cond_vec, level+1) = 1;
    decvec(cond_vec) = decvec(cond_vec) - poly;
end

