function p = coPrimeInt(a, N)
p = -ones(1, N);
z = -ones(1, N);
if(gcd(a, N) ~= 1)
else
    p(1) = mod(a, N);
    z(p(1)+1) = 1;
    for i = 2: N
        p(i) = mod(p(i-1)+a,N);
        z(p(i)+1) = 1;
    end
end
p = p + 1;

idx = find(z == -1);
if(~isempty(idx))
    fprintf(1, 'Interleaver Error');
end
return