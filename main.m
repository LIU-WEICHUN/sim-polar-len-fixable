% clear all;
clear;

N_test = [576, 768, 1536, 2304, 3072];
R_test = [1/4, 1/2, 3/4];



POLAR = 0;  %%%can use on not power of 2
IPOLAR = 1;  %%%can use on not power of 2
apcASC = 21;
apcDES = 22;   
New_type1 = 31;
New_type2 = 32;
New_type3 = 33;
New_type4 = 34;
punctQUP = 41;
shorten = 42;
double_shorten = 43;
fourtime_shorten = 44;
QUP_without_bitreverse = 45; 
punct_type1 = 46; 
punct_type2 = 47; 

%%%!!!!!! seting of the test !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
test = false;
crc = true;
batch = 1;

snr_db_start_with_R = [-2, 1.5, 4.5];
snr_db_end_with_R = [-1, 2.5, 5.5]; % simplest, 10^-2 to 10^-3
snr_db_end_with_R = [-0.5, 3, 6]; % faster, about 10^-4
% snr_db_end_with_R = [-1, 3.5, 6.5]; % complete, 10^-5 to 10^-6




%%% choose test case
L = 8;
N_case = 2;
for POLAR_TYPE = [apcASC, apcDES,...   
New_type1, New_type2, New_type3, New_type4,...
shorten, double_shorten ,fourtime_shorten ,QUP_without_bitreverse]
    
for R_case = 1:3
N = N_test(N_case);
R = R_test(R_case);
K = round(N*R);

%%% for test one sample
% N = 512;
% K = 128;
% R = K/N;

%%%!!!!!! end seting of the test !!!!!!!!!

% NTEST = 5000000;
NTEST = 100000; % 10^-2 -3
NTEST = 500000;
NTEST = 10^7;

NMIN = 10^4;
NErrMIN = 50;

if test == true
    NTEST = 50; % for test
end

%%% define crc way
CRC_POLY = [1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 1]; %% 0x1021
CRC_POLY = CRC_POLY(end:-1:1);
if crc == true
    m = length(CRC_POLY)-1;
else
    m = 0;
    CRC_POLY = 1;
end
fileName = name_sim_file(POLAR_TYPE, N, K, L);

SNR_db = snr_db_start_with_R(R_case) :0.25: snr_db_end_with_R(R_case);
sigma2 = 10.^(-SNR_db/10);
sigma = sqrt(sigma2);
EboverN0_db = SNR_db - 10*log10(2*R) ;

BLK_ERR_CNT = zeros(1, length(SNR_db));
BIT_ERR_CNT = zeros(1, length(SNR_db));
TX_CNT = zeros(1, length(SNR_db));


for s = 1: length(SNR_db)
     
     SNR = 10^(SNR_db(s)/10)
     EboverN0 = 10^(EboverN0_db(s)/10)

     %%% generate imap at this snr (mean of llr)
     z = ones(1, N)* channelLlrMean(R, 1, EboverN0, 1);
     ll = polarGA(z, POLAR_TYPE);
     [~, PolarSeq] = sort(ll);

     PolarSeq = PolarSeq-1;
     iMap = zeros(size(PolarSeq));
     iMap(PolarSeq(end-(K+m)+1: end)+1) = 1;

     for t = 1: NTEST
         %%% random message
         noise = randn(1, N);
         txmsg = floor(rand(1, K) * 2);
         
         %%% encode-crc
         if crc == true
            p = crcGen(txmsg, CRC_POLY);
            txmsg = [txmsg, p];
         end
         
         %%% encode-polar
         txcwd = polarEnc(N, txmsg, iMap, POLAR_TYPE);

         %%% modulation
         txSig = (1-2*txcwd); % (bpsk)

         %%% channel
         rxSig = txSig + noise * sigma(s);

         %%% estimation(soft demodulation)
         llr = 2 * rxSig / (sigma2(s));
     
         %%% decode
         [u,x] = polarSCL(llr, iMap, L, POLAR_TYPE, CRC_POLY, batch);

         %%% count BLER
         TX_CNT(s) = TX_CNT(s) + 1;
         BIT_ERR_CNT(s) = BIT_ERR_CNT(s) + sum(xor(u,txmsg));
         if(sum(xor(u,txmsg)) ~= 0)
            BLK_ERR_CNT(s) = BLK_ERR_CNT(s) + 1;
         end
         
         %%% output
         if(test == false && ((mod(t, 1000) == 0) || (t == 1) || (t == NTEST)))
             t
             %%% open file
             fp = fopen(fileName,'w');
             
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
                fprintf(fp,'%d ',BLK_ERR_CNT(i));
             end
             fprintf(fp,'];\n');
     
             fprintf(fp,'BIT_ERR_CNT = [');
             for i = 1: length(BIT_ERR_CNT)
                 fprintf(fp,'%d ', BIT_ERR_CNT(i));
             end
             fprintf(fp,'];\n');
             
             fclose(fp);

             %%% early stop condiction
             if((t > NMIN) && (BLK_ERR_CNT(s) > NErrMIN))
                 break;
             end
         end

     end
end 
fp = fopen(fileName,'a');
fprintf(fp, "%%%%%%");
fprintf(fp, fileName);
fprintf(fp, "\n");
fprintf(fp, "semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, '-+'); \n");
fprintf(fp, "hold on; \n");

end
end