function p = crcGen(u, CRC_POLY)
m = length(CRC_POLY)-1;
if(m == 0)
    p = [];
    return;
end
buf = zeros(1, m);
K = length(u);
u = [u, zeros(1, m)];
for i = 1: K + m
    if(buf(m) == 1) 
        for j = 1: m-1
            buf(m-j+1) = mod(buf(m-j)+CRC_POLY(m-j+1), 2);
        end
        buf(1) = mod(u(i) + 1,2);
    else
        for j = 1: m-1
            buf(m-j+1) = buf(m-j);
        end
        buf(1) = u(i);
    end
end
p = buf(end:-1:1);

end