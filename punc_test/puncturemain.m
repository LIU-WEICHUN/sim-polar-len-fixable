% N = [567, 768, 1536, 2304, 3072];
% R = [1/4, 1/2, 3/4];
% L = 8;

N = [21];
R = [1];
L = 8;

MIN_ERR_CNT = 500;
SNR = 1: 0.25: 2.5;
POLAR = 0;
IPOLAR = 1;
POLAR_TYPE = POLAR;   %%% or 'IPOLAR'

% ipolarInt = interLeaverGen(M);
%ipolarInt = interLeaverGenFix(M);


CRC_POLY = [1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 1]; %% 0x1021
CRC_POLY = CRC_POLY(end:-1:1);
m = length(CRC_POLY)-1;
K = N-m

% NTEST = 5000000;
NTEST = 5;
P = 0;

%PolarSeq = polarSeqSelect(M, P);    %%% if P = 0 -> 5G polar sequence 
PolarSeq = polarSeqSelect(10, 1);   %%% ips1024_1
%fprintf(1,'%4d, ', PolarSeq);
% iMap = zeros(1, N);
% iMap(PolarSeq(end-(K+m)+1: end)+1) = 1;
iMap = ones(1, N);

BLK_ERR_CNT = zeros(1, length(SNR));
BIT_ERR_CNT = zeros(1, length(SNR));
TX_CNT = zeros(1, length(SNR));
sigma2 = 10.^(-SNR/10);
% sigma = sqrt(sigma2);
sigma = zeros(size(sigma2)); %noise free

for t = 1: NTEST
%     noise = randn(1, N);
    noise = zeros(1, N); % noise free
    txmsg = floor(rand(1, K) * 2);
    
    p = crcGen(txmsg, CRC_POLY);
    txmsg = [txmsg, p];
    p1 = crcGen(txmsg, CRC_POLY);
    CRC_CHECK = crcCheck(txmsg, CRC_POLY);
    if((CRC_CHECK ~= 1) || (sum(p1) ~= 0))  %%% double check the CRC generator
        fprintf(1,'CRC Gen fail.\n');
    end
    
    txcwd = apcEnc(N, txmsg, iMap, POLAR_TYPE);
    txSig = (1-2*txcwd);
    endSimu = 1;
    for s = 1: length(SNR)
        if(BLK_ERR_CNT(s) < MIN_ERR_CNT)
            endSimu = 0;
            TX_CNT(s) = TX_CNT(s) + 1;
            rxSig = txSig + noise * sigma(s);
            llr = 2 * rxSig / (sigma2(s));
            [u,x] = polarSCL(llr, iMap, L, POLAR_TYPE, CRC_POLY);
            BIT_ERR_CNT(s) = BIT_ERR_CNT(s) + sum(xor(u,txmsg));
            if(sum(xor(u,txmsg)) ~= 0)
                BLK_ERR_CNT(s) = BLK_ERR_CNT(s) + 1;
            else
                TX_CNT(s+1:end) = TX_CNT(s+1:end) + 1;
                break;
            end
        end
    end
    
    if((mod(t, 1000) == 0) || (t == 1) || (t == NTEST) || (endSimu == 1))
        for i = 1: length(SNR)
            fprintf(1,'%e   %e   %e   %e\n', SNR(i), BLK_ERR_CNT(i)/TX_CNT(i), BIT_ERR_CNT(i)/(TX_CNT(i)*K), TX_CNT(i));
        end
        fprintf(1,'\n');
        if(POLAR_TYPE == 0)
             fileName = sprintf('bler_polar_%d_%d_%d_%d.m', N, K, P, L);
        else
             fileName = sprintf('bler_ipolar_f_%d_%d_%d_%d.m', N, K, P, L);
        end
        
        fp = fopen(fileName,'w');
        fprintf(fp,'bler = [\n');
        for i = 1: length(SNR)
            fprintf(fp,'%e   %e   %e   %e\n', SNR(i), BLK_ERR_CNT(i)/TX_CNT(i), BIT_ERR_CNT(i)/(TX_CNT(i)*K), TX_CNT(i));
        end
        fprintf(fp,'];\n');
        fclose(fp);
    end
    if(endSimu == 1)
        break;
    end
end



