function x = power2SumVec(Na)
    N = int32(Na);
    x = [];
    power = 1;
    while(N ~= 0)
        if(mod(N, 2) == 1)
            x = [x, power];
        end
        N = idivide(N, 2);
        power = power*2;
    end
return