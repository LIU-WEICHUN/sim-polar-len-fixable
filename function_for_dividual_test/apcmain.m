clear;

N_test = [576, 768, 1536, 2304, 3072];
R_test = [1/4, 1/2, 3/4];
K_test = [144, 288, 432; 192, 384, 576; 384, 768, 1152; 576, 1152, 1728; 768, 1536, 2304];
L = 8;

snr_db_start_with_R = [-2.5, 1.5, 4.5];
snr_db_end_with_R = [-1.5, 2.5, 5.5]; % simplest, 10^-2 to 10^-3
snr_db_end_with_R = [-1, 3, 6]; % faster, about 10^-4
% snr_db_end_with_R = [-0.5, 3.5, 6.5]; % complete, 10^-5 to 10^-6

%%% choose test case
N_case = 1;
R_case = 1;

N = N_test(N_case);
R = R_test(R_case);
K = K_test(N_case, R_case);

%%% for test one sample
N = 512;
K = 128;
% R = K/N;

POLAR = 0;
IPOLAR = 1;
POLAR_TYPE = POLAR;   %%% or 'IPOLAR'
P = 0;

%%% open file
if(POLAR_TYPE == 0)
   fileName = sprintf('bler_polar_%d_%d_%d_%d.m', N, K, P, L);
else
   fileName = sprintf('bler_ipolar_f_%d_%d_%d_%d.m', N, K, P, L);
end

% ipolarInt = interLeaverGen(M);
%ipolarInt = interLeaverGenFix(M);


CRC_POLY = [1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 1]; %% 0x1021
CRC_POLY = CRC_POLY(end:-1:1);
m = length(CRC_POLY)-1;

% NTEST = 5000000;
NTEST = 100000; % 10^-2 -3

% MIN_ERR_CNT = 500; %% no condiction here

SNR_db = snr_db_start_with_R(R_case) :0.25: snr_db_end_with_R(R_case);
sigma2 = 10.^(-SNR_db/10);
sigma = sqrt(sigma2);
% SNR = 2Es/N0 %% because sigma2 = N0/2
% Eb * K = Es * N
% R = K/N
% Eb * R = Es
% SNR = 2*R*Eb/N0
% SNR_db = 10*log10(2*R*Eb/N0)
% SNR_db = 10*log10(2*R) + 10*log10(Eb/N0)
% SNR_db = EboverN0_db + 10*log10(2*R);
EboverN0_db  = SNR_db - 10*log10(2*R);

BLK_ERR_CNT = zeros(1, length(SNR_db));
BIT_ERR_CNT = zeros(1, length(SNR_db));
TX_CNT = zeros(1, length(SNR_db));


%%% imap for original polar code
% PolarSeq = polarSeqSelect(9, 0);    %%% if P = 0 -> 5G polar sequence 
% %fprintf(1,'%4d, ', PolarSeq);
% iMap = zeros(1, N);
% iMap(PolarSeq(end-(K+m)+1: end)+1) = 1;

%%% print simulation profile
fp = fopen(fileName,'a');
fprintf(fp, "%%%% start simulation at ");
fprintf(fp, datestr(datetime('now')));
fprintf(fp, "%%%% N, K, L = %d, %d, %d \n", N, K, L);
fprintf(fp,'%%%% SNR_db = [');
     for i = 1: length(SNR_db)
         fprintf(fp,'%d ', SNR_db(i));
     end
fprintf(fp,'];\n');
fprintf(fp, "%%%% sample number each SNR = %d \n", NTEST);
fprintf(fp,'\n\n');
fclose(fp);


for s = 1: length(SNR_db)
     
     SNR = 10^(SNR_db(s)/10)
     EboverN0 = 10^(EboverN0_db(s)/10)

     %%% generate imap at this snr (mean of llr)
     z = ones(1, N)* channelLlrMean(R, 1, SNR, 1);
     [~, PolarSeq] = sort(apcGA(N, z));
     PolarSeq = PolarSeq-1;
     iMap = zeros(1, N);
     iMap(PolarSeq(end-(K+m)+1: end)+1) = 1;

     fp = fopen(fileName,'a');
     fprintf(fp,'%%%%%% uncode channel llr mean is %e \n', channelLlrMean(R, 1, SNR, 1));
     fprintf(fp,'PolarSeq_%d = [', s);
     for i = 1: length(PolarSeq)
         fprintf(fp,'%d ', PolarSeq(i));
     end
     fprintf(fp,'];\n');
     fclose(fp);

     for t = 1: NTEST
         %%% random message
         noise = randn(1, N);
         txmsg = floor(rand(1, K) * 2);
         
         %%% encode
         p = crcGen(txmsg, CRC_POLY);
         txmsg = [txmsg, p];
         p1 = crcGen(txmsg, CRC_POLY);
         CRC_CHECK = crcCheck(txmsg, CRC_POLY);
         if((CRC_CHECK ~= 1) || (sum(p1) ~= 0))  %%% double check the CRC generator
             fprintf(1,'CRC Gen fail.\n');
         end
%          txcwd = apcEnc(N, txmsg, iMap, POLAR_TYPE);
         txcwd = polarEnc(N, txmsg, iMap, POLAR_TYPE);

         %%% modulation
         txSig = (1-2*txcwd); 

         %%% channel
         rxSig = txSig + noise * sigma(s);

         %%% estimation(soft demodulation)
         llr = 2 * rxSig / (sigma2(s));
     
         %%% decode
%          [u,x] = apcSCL(llr, iMap, L, POLAR_TYPE, CRC_POLY);
         [u,x] = polarSCL(llr, iMap, L, POLAR_TYPE, CRC_POLY);
     
         %%% count BLER
         TX_CNT(s) = TX_CNT(s) + 1;
         BIT_ERR_CNT(s) = BIT_ERR_CNT(s) + sum(xor(u,txmsg));
         if(sum(xor(u,txmsg)) ~= 0)
            BLK_ERR_CNT(s) = BLK_ERR_CNT(s) + 1;
         end
         
         %%% output
         if(true && ((mod(t, 1000) == 0) || (t == 1) || (t == NTEST)))
             t
             %%% open file
             fp = fopen(fileName,'a');
             
             %%% print date and time info
             fprintf(fp, "%%%%");
             fprintf(fp, datestr(datetime('now')));
             fprintf(fp,'\n');
             
             fprintf(fp,'SNR_db = [');
             for i = 1: length(SNR_db)
                 fprintf(fp,'%e ', SNR_db(i));
             end
             fprintf(fp,'];\n');
     
             fprintf(fp,'TX_CNT = [');
             for i = 1: length(TX_CNT)
                 fprintf(fp,'%d ',TX_CNT(i));
             end
             fprintf(fp,'];\n');
             
             fprintf(fp,'BLK_ERR_CNT = [');
             for i = 1: length(BLK_ERR_CNT)
                fprintf(fp,'%e ',BLK_ERR_CNT(i));
             end
             fprintf(fp,'];\n');
     
             fprintf(fp,'BIT_ERR_CNT = [');
             for i = 1: length(BIT_ERR_CNT)
                 fprintf(fp,'%d ', BIT_ERR_CNT(i));
             end
             fprintf(fp,'];\n');
             
     
             fclose(fp);
         end

     end
end 
