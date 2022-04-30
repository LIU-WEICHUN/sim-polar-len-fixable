
clear;


% type1 768/192
% GA predict BLER12-Apr-2022 12:52:43
SNR_db = [-2.000000e+00 -1.750000e+00 -1.500000e+00 -1.250000e+00 -1.000000e+00 -7.500000e-01 -5.000000e-01 ];
bler = [3.241304e-01 2.028919e-01 1.181046e-01 6.369289e-02 3.147278e-02 1.450218e-02 6.165180e-03 ];
%%%./sim_result/sc/type1_768_192_1_GA_predict.m
semilogy(SNR_db, bler, '-.'); 
hold on; 


% type1 768/384
% GA predict BLER12-Apr-2022 12:52:48
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
bler = [4.585272e-01 2.720081e-01 1.415690e-01 6.672404e-02 2.807161e-02 1.078452e-02 3.851210e-03 ];
%%%./sim_result/sc/type1_768_384_1_GA_predict.m
semilogy(SNR_db, bler, '-.'); 
hold on; 

% type1 768/576
%%17-Feb-2022 21:35:49
%%GA predict BLER12-Apr-2022 12:52:53
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
bler = [3.559759e-01 1.824607e-01 8.070924e-02 3.230165e-02 1.156434e-02 3.812312e-03 1.156534e-03 ];
%%%./sim_result/sc/type1_768_576_1_GA_predict.m
semilogy(SNR_db, bler, '-.'); 
hold on; 

% type2 768/192
%% GA predict BLER12-Apr-2022 12:52:58
SNR_db = [-2.000000e+00 -1.750000e+00 -1.500000e+00 -1.250000e+00 -1.000000e+00 -7.500000e-01 -5.000000e-01 ];
bler = [3.403889e-01 2.202545e-01 1.326697e-01 7.422827e-02 3.827861e-02 1.833155e-02 8.244658e-03 ];
%%%./sim_result/sc/type2_768_192_1_GA_predict.m
semilogy(SNR_db, bler, '-*'); 
hold on; 

% type2 768/384
%% GA predict BLER12-Apr-2022 12:53:04
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
bler = [4.925676e-01 3.080614e-01 1.716214e-01 8.608306e-02 3.913054e-02 1.674163e-02 6.486116e-03 ];
%%%./sim_result/sc/type2_768_384_1_GA_predict.m
semilogy(SNR_db, bler, '-*'); 
hold on; 



% type2 768/576
%% GA predict BLER12-Apr-2022 12:53:08
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
bler = [4.088344e-01 2.263446e-01 1.101348e-01 4.801766e-02 1.928825e-02 7.359468e-03 2.579388e-03 ];
%%%./sim_result/sc/type2_768_576_1_GA_predict.m
semilogy(SNR_db, bler, '-*'); 
hold on; 



% type3 768/192
%% GA predict BLER12-Apr-2022 12:53:14
SNR_db = [-2.000000e+00 -1.750000e+00 -1.500000e+00 -1.250000e+00 -1.000000e+00 -7.500000e-01 -5.000000e-01 ];
bler = [3.241304e-01 2.028919e-01 1.181046e-01 6.369289e-02 3.147278e-02 1.450218e-02 6.165180e-03 ];
%%%./sim_result/sc/type3_768_192_1_GA_predict.m
semilogy(SNR_db, bler, '-x'); 
hold on; 

% type3 768/384
%% GA predict BLER12-Apr-2022 12:53:19
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
bler = [4.585272e-01 2.720081e-01 1.415690e-01 6.672404e-02 2.807161e-02 1.078452e-02 3.851210e-03 ];
%%%./sim_result/sc/type3_768_384_1_GA_predict.m
semilogy(SNR_db, bler, '-x'); 
hold on; 


% type3 768/576
%% GA predict BLER12-Apr-2022 12:53:23
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
bler = [3.559759e-01 1.824607e-01 8.070924e-02 3.230165e-02 1.156434e-02 3.812312e-03 1.156534e-03 ];
%%%./sim_result/sc/type3_768_576_1_GA_predict.m
semilogy(SNR_db, bler, '-x'); 
hold on; 



% type4 768/192
%%17-Feb-2022 20:24:47
%% GA predict BLER12-Apr-2022 12:53:29
SNR_db = [-2.000000e+00 -1.750000e+00 -1.500000e+00 -1.250000e+00 -1.000000e+00 -7.500000e-01 -5.000000e-01 ];
bler = [3.403889e-01 2.202545e-01 1.326697e-01 7.422827e-02 3.827861e-02 1.833155e-02 8.244658e-03 ];
%%%./sim_result/sc/type4_768_192_1_GA_predict.m
semilogy(SNR_db, bler, '-+'); 
hold on; 

% type4 768/384
%% GA predict BLER12-Apr-2022 12:53:34
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
bler = [4.925676e-01 3.080614e-01 1.716214e-01 8.608306e-02 3.913054e-02 1.674163e-02 6.486116e-03 ];
%%%./sim_result/sc/type4_768_384_1_GA_predict.m
semilogy(SNR_db, bler, '-+'); 
hold on; 


% type4 768/576
%% GA predict BLER12-Apr-2022 12:53:39
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
bler = [4.088344e-01 2.263446e-01 1.101348e-01 4.801766e-02 1.928825e-02 7.359468e-03 2.579388e-03 ];
%%%./sim_result/sc/type4_768_576_1_GA_predict.m
semilogy(SNR_db, bler, '-+'); 



ylabel("BLER");
xlabel("SNR(dB)");
grid on;
% legend('512/128 polar' ,'576/288 ASC','576/432 ASC', '576/144 type1', '576/288 type1', '576/432 type1', '576/144 DES', '576/288 DES', '576/432 DES', '1536/768 type1', '1536/768 apc', '768/192 ASC', '768/384 ASC', '768/576 ASC');

legend(...
'type1 768/192','type1 768/384','type1 768/576' ,...
'type2 768/192','type2 768/384','type2 768/576' ,...
'type3 768/192', 'type3 768/384','type3 768/576',...
'type4 768/192', 'type4 768/384','type4 768/576' ...
)