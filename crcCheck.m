function CRC_CHECK = crcCheck(u, CRC_POLY)
m = length(CRC_POLY)-1;
if(m == 0)
    CRC_CHECK = 1;
     return;
end
K = length(u) - m;
u1 = u(1: K);
p = u(K+1:end);

p1 = crcGen(u1, CRC_POLY);

if(sum(abs(p-p1)) == 0)
    CRC_CHECK = 1;
else
    CRC_CHECK = 0;
end

return