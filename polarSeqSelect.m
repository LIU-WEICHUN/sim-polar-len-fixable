function SEQ = polarSeqSelect(M, P)

%%% covert the *.m file to *.mat for easy of access
if((M == 8) && (P == 1))
    ips256_1
elseif((M == 8) && (P == 5))
    ips256_5
elseif((M == 8) && (P == 10))
    ips256_10
elseif((M == 8) && (P == 15))
    ips256_15
elseif((M == 8) && (P == 20))
    ips256_20
elseif((M == 8) && (P == 25))
    ips256_25
elseif((M == 10) && (P == 1))
    ips1024_1
elseif((M == 10) && (P == 5))
    ips1024_5
elseif((M == 10) && (P == 10))
    ips1024_10
elseif((M == 10) && (P == 15))
    ips1024_15
elseif((M == 10) && (P == 20))
    ips1024_20
elseif((M == 10) && (P == 25))
    ips1024_25
elseif((M == 10) && (P == 30))
    ips1024_30
elseif((M == 11) && (P == 25))
    ips2048_25
elseif((M == 12) && (P == 25))
    ips4096_25
elseif(P == 0)
    if(M <= 10)
        SEQ_5G_M
        ips = PS_5G(PS_5G < 2^M);
    else
        fprintf(1,'5G polar sequence undefined for N = %d\n', 2^M);
        return;
    end
else
    
    fprintf(1,'Error, sequence with N = %d and P = %d is not defined.\n', 2^M, P);
    return;
    
end
SEQ = ips;

return