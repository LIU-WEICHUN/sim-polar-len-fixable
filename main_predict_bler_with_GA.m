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
% punctQUP = 41;
shorten = 42;
% double_shorten = 43;
% fourtime_shorten = 44;
QUP_without_bitreverse = 45; 
punct_type1 = 46; 
punct_type2 = 47; 

%%%!!!!!! seting of the test !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
snr_db_start_with_R = [-2, 1.5, 4.5];
snr_db_end_with_R = [-1, 2.5, 5.5]; % simplest, 10^-2 to 10^-3
snr_db_end_with_R = [-0.5, 3, 6]; % faster, about 10^-4
% snr_db_end_with_R = [-1, 3.5, 6.5]; % complete, 10^-5 to 10^-6

%%% choose test case
L = 1;
N_case = 2;
for POLAR_TYPE = [...
% apcASC ,apcDES ,... 
% New_type1,New_type2 ,New_type3,New_type4 ,...
shorten,...
% QUP_without_bitreverse,...
% punct_type1,punct_type2...
]

for R_case = 3:3
N = N_test(N_case);
R = R_test(R_case);
K = round(N*R);

m = 0;  %no crc

fileName = name_sc_precdict_file(POLAR_TYPE, N, K, L);

SNR_db = snr_db_start_with_R(R_case) :0.25: snr_db_end_with_R(R_case);
sigma2 = 10.^(-SNR_db/10);
sigma = sqrt(sigma2);
EboverN0_db = SNR_db - 10*log10(2*R) ;
bler = zeros(1, length(SNR_db));

for s = 1: length(SNR_db)
% for s = 1: 1   
     SNR = 10^(SNR_db(s)/10)
     EboverN0 = 10^(EboverN0_db(s)/10)

     z = ones(1, N)* channelLlrMean(R, 1, EboverN0, 1);
     ll = polarGA(z, POLAR_TYPE);
     [~, PolarSeq] = sort(ll);
     bler(s) = GA2bler(ll, PolarSeq(end-(K+m)+1: end));
     
     fp = fopen(fileName,'w');      
             %%% print date and time info
     fprintf(fp, "%%%% GA predict BLER");
     fprintf(fp, datestr(datetime('now')));
     fprintf(fp,'\n');
             
     fprintf(fp,'SNR_db = [');
     for i = 1: length(SNR_db)
         fprintf(fp,'%e ', SNR_db(i));
     end
     fprintf(fp,'];\n');
     
     fprintf(fp,'bler = [');
     for i = 1: length(bler)
         fprintf(fp,'%e ',bler(i));
     end
     fprintf(fp,'];\n');
             
     fclose(fp);
end

 
fp = fopen(fileName,'a');
fprintf(fp, "%%%%%%");
fprintf(fp, fileName);
fprintf(fp, "\n");
fprintf(fp, "semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, '-+'); \n");
fprintf(fp, "hold on; \n");

end
end