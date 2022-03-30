clear;

N_test = [576, 768, 1536, 2304, 3072];
R_test = [1/4, 1/2, 3/4];
K_test = [144, 288, 432; 192, 384, 576; 384, 768, 1152; 576, 1152, 1728; 768, 1536, 2304];
L = 8;

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

%%%!!!!!! seting of the test !!!!!!!!!
test = true;
% POLAR_TYPE = New_type3;   
P = 0;

snr_db_start_with_R = [-3, 1.5, 4.5];
snr_db_end_with_R = [-2, 2.5, 5.5]; % simplest, 10^-2 to 10^-3
snr_db_end_with_R = [-1.5, 3, 6]; % faster, about 10^-4
% snr_db_end_with_R = [-1, 3.5, 6.5]; % complete, 10^-5 to 10^-6

%%% choose test case
N_case = 2;
for POLAR_TYPE = [0]
for R_case = 1:1
N = N_test(N_case);
% N = 700;
R = R_test(R_case);
% K = K_test(N_case, R_case);
K = round(N*R);

%%% for test one sample
N = 512;
K = 128;
R = K/N;

%%%!!!!!! end seting of the test !!!!!!!!!

%%% open file
%%% here is the way open on linux, may wrong on window!!!
switch POLAR_TYPE
    case 0
        fileName = sprintf('./sim_result/bler_polar_%d_%d_%d_%d.m', N, K, P, L);
    case 1
        fileName = sprintf('./sim_result/bler_ipolar_f_%d_%d_%d_%d.m', N, K, P, L);
    case 21
        fileName = sprintf('./sim_result/bler_apcASC_%d_%d_%d_%d.m', N, K, P, L);
    case 22
        fileName = sprintf('./sim_result/bler_apcDES_%d_%d_%d_%d.m', N, K, P, L);
    case 31
        fileName = sprintf('./sim_result/bler_type1_%d_%d_%d_%d.m', N, K, P, L);
    case 32
        fileName = sprintf('./sim_result/bler_type2_%d_%d_%d_%d.m', N, K, P, L);
    case 33
        fileName = sprintf('./sim_result/bler_type3_%d_%d_%d_%d.m', N, K, P, L);
    case 34
        fileName = sprintf('./sim_result/bler_type4_%d_%d_%d_%d.m', N, K, P, L);
    case 41
        fileName = sprintf('./sim_result/bler_punctQUP_%d_%d_%d_%d.m', N, K, P, L);
    case 42
        fileName = sprintf('./sim_result/bler_shorten_%d_%d_%d_%d.m', N, K, P, L);
    case 43
        fileName = sprintf('./sim_result/bler_double_shorten_%d_%d_%d_%d.m', N, K, P, L); 
    case 44
        fileName = sprintf('./sim_result/bler_fourtime_shorten_%d_%d_%d_%d.m', N, K, P, L);
    case 45
        fileName = sprintf('./sim_result/bler_QUP_without_bitreverse_%d_%d_%d_%d.m', N, K, P, L); 
    case 46
        fileName = sprintf('./sim_result/bler_punct_type1_%d_%d_%d_%d.m', N, K, P, L); 
    case 47
        fileName = sprintf('./sim_result/bler_punct_type2_%d_%d_%d_%d.m', N, K, P, L); 
    otherwise
        disp('undefine');
        assert(false, "undefine polar type");
end


% ipolarInt = interLeaverGen(M);
%ipolarInt = interLeaverGenFix(M);


CRC_POLY = [1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 1]; %% 0x1021
CRC_POLY = CRC_POLY(end:-1:1);
m = length(CRC_POLY)-1;

% NTEST = 5000000;
NTEST = 100000; % 10^-2 -3
NTEST = 500000;
if test == true
    NTEST = 500; % for test
end

% MIN_ERR_CNT = 500; %% no condiction here

SNR_db = snr_db_start_with_R(R_case) :0.25: snr_db_end_with_R(R_case);
% SNR_db = [0]; %%% for test
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
EboverN0_db = SNR_db - 10*log10(2*R) ;

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
     z = ones(1, N)* channelLlrMean(R, 1, EboverN0, 1);
     ll = polarGA(z, POLAR_TYPE);
     [~, PolarSeq] = sort(ll);

     PolarSeq = PolarSeq-1;
%      iMap = zeros(1, N);
     iMap = zeros(size(PolarSeq));
     iMap(PolarSeq(end-(K+m)+1: end)+1) = 1;

     fp = fopen(fileName,'a');
     fprintf(fp,'%%%%%% uncode channel llr mean is %e \n', channelLlrMean(R, 1, EboverN0, 1));
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
         
         %%% encode-crc
         p = crcGen(txmsg, CRC_POLY);
         txmsg = [txmsg, p];
         p1 = crcGen(txmsg, CRC_POLY);
         CRC_CHECK = crcCheck(txmsg, CRC_POLY);
         if((CRC_CHECK ~= 1) || (sum(p1) ~= 0))  %%% double check the CRC generator
             fprintf(1,'CRC Gen fail.\n');
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
         [u,x] = polarSCL(llr, iMap, L, POLAR_TYPE, CRC_POLY);

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
                fprintf(fp,'%d ',BLK_ERR_CNT(i));
             end
             fprintf(fp,'];\n');
     
             fprintf(fp,'BIT_ERR_CNT = [');
             for i = 1: length(BIT_ERR_CNT)
                 fprintf(fp,'%d ', BIT_ERR_CNT(i));
             end
             fprintf(fp,'];\n');
             
             fclose(fp);

             %%% stop condiction
             if((t > NTEST/5) && (BLK_ERR_CNT(s) > 500))
                 break;
             end
         end

     end
end 
end
end