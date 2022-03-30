function x = apcEnc(N, uA, iMap, POLAR_TYPE)
u = zeros(1, N);
apcidx = power2SumVec(N); %ASC
u(iMap == 1) = uA;
if(POLAR_TYPE == 0)
    x = apcEncIte(N, u, apcidx);
else
    x = ipolarEncIte(N, u, 0, 0);
end
return

function x = apcEncIte(N, u, apcidx)
    if(length(apcidx) == 1)
        assert(N == apcidx(1), "size dismatch");
        x = polarEncIte(N, u);
        return
    elseif(length(apcidx) > 1) 
        upper_size = apcidx(1);
        lower_size = N-upper_size;
        apcidx = apcidx(2:length(apcidx));
        x1 = polarEncIte(upper_size, u(1:upper_size));  %%% upper encoder
        x2 = apcEncIte(lower_size, u(upper_size+1: end), apcidx);  %%% lower encoder
        x = [xor(x1, x2(1:upper_size)), x2];
    end
return

function x = polarEncIte(N, u)
    assert(length(power2SumVec(N)) == 1, "N is not power of 2");
    if(N == 1)
        x = u;
        return
    end
    
    x1 = polarEncIte(N/2, u(1:N/2));  %%% upper encoder
    x2 = polarEncIte(N/2, u(N/2+1: N));  %%% lower encoder
    
    x = [xor(x1, x2), x2];
return

function x = ipolarEncIte(N, u, intIdx, level)
    global ipolarInt; 
    if(N == 1)
        x = u;
        return
    end
    PI = ipolarInt{level+1}(intIdx+1, :);
    x1 = ipolarEncIte(N/2, u(1:N/2), intIdx*2, level+1);  %%% upper encoder
    x2 = ipolarEncIte(N/2, u(N/2+1: N), intIdx*2+1, level+1);  %%% lower encoder
    x1(PI) = x1;
    x = [xor(x1, x2), x2];
return
