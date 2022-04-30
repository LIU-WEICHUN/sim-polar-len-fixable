
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



% shorten 768/192
%% GA predict BLER12-Apr-2022 12:53:46
SNR_db = [-2.000000e+00 -1.750000e+00 -1.500000e+00 -1.250000e+00 -1.000000e+00 -7.500000e-01 -5.000000e-01 ];
bler = [3.640172e-01 2.359951e-01 1.422973e-01 7.944824e-02 4.111715e-02 1.994224e-02 9.020173e-03 ];
%%%./sim_result/sc/shorten_768_192_1_GA_predict.m
semilogy(SNR_db, bler, "-^");
hold on;

% shorten 768/384
%% GA predict BLER12-Apr-2022 12:53:52
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
bler = [4.628840e-01 2.757155e-01 1.447570e-01 6.840133e-02 2.883368e-02 1.125717e-02 3.965139e-03 ];
%%%./sim_result/sc/shorten_768_384_1_GA_predict.m
semilogy(SNR_db, bler, "-^");
hold on;

% shorten 768/576
%% GA predict BLER12-Apr-2022 12:53:57
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
bler = [3.450183e-01 1.738904e-01 7.722710e-02 3.015407e-02 1.100948e-02 3.484149e-03 1.021758e-03 ];
%%%./sim_result/sc/shorten_768_576_1_GA_predict.m
semilogy(SNR_db, bler, "-^");
hold on;











% QUP without bit permution
%% GA predict BLER12-Apr-2022 12:54:03
SNR_db = [-2.000000e+00 -1.750000e+00 -1.500000e+00 -1.250000e+00 -1.000000e+00 -7.500000e-01 -5.000000e-01 ];
bler = [2.938802e-01 1.806785e-01 1.031834e-01 5.521695e-02 2.714576e-02 1.261112e-02 5.361038e-03 ];
%%%./sim_result/sc/QUP_without_bitreverse_768_192_1_GA_predict.m
semilogy(SNR_db, bler, "-v");
hold on; 

%% GA predict BLER12-Apr-2022 12:54:08
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
bler = [4.690917e-01 2.835999e-01 1.522570e-01 7.549777e-02 3.303187e-02 1.330901e-02 4.972029e-03 ];
%%%./sim_result/sc/QUP_without_bitreverse_768_384_1_GA_predict.m
semilogy(SNR_db, bler, "-v");
hold on; 

%% GA predict BLER12-Apr-2022 12:54:13
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
bler = [4.167755e-01 2.303001e-01 1.128430e-01 4.984923e-02 1.991468e-02 7.579626e-03 2.617341e-03 ];
%%%./sim_result/sc/QUP_without_bitreverse_768_576_1_GA_predict.m
semilogy(SNR_db, bler, "-v");

% puncture type1
%% GA predict BLER12-Apr-2022 12:54:20
SNR_db = [-2.000000e+00 -1.750000e+00 -1.500000e+00 -1.250000e+00 -1.000000e+00 -7.500000e-01 -5.000000e-01 ];
bler = [3.534344e-01 2.270215e-01 1.347141e-01 7.417413e-02 3.800938e-02 1.805223e-02 7.978423e-03 ];
%%%./sim_result/sc/punct_type1_768_192_1_GA_predict.m
semilogy(SNR_db, bler, "-|");
hold on;


%% GA predict BLER12-Apr-2022 12:54:26
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
bler = [4.594843e-01 2.737013e-01 1.443331e-01 6.790490e-02 2.887920e-02 1.102821e-02 3.934259e-03 ];
%%%./sim_result/sc/punct_type1_768_384_1_GA_predict.m
semilogy(SNR_db, bler, "-p");
hold on;

%% GA predict BLER12-Apr-2022 12:54:31
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
bler = [3.492789e-01 1.763498e-01 7.744864e-02 3.134203e-02 1.103920e-02 3.657815e-03 1.073061e-03 ];
%%%./sim_result/sc/punct_type1_768_576_1_GA_predict.m 
semilogy(SNR_db, bler, "-|");
hold on;

% puncture type2
%% GA predict BLER12-Apr-2022 12:54:37
SNR_db = [-2.000000e+00 -1.750000e+00 -1.500000e+00 -1.250000e+00 -1.000000e+00 -7.500000e-01 -5.000000e-01 ];
bler = [3.075555e-01 1.927833e-01 1.128731e-01 6.140240e-02 3.132253e-02 1.492255e-02 6.458248e-03 ];
%%%./sim_result/sc/punct_type2_768_192_1_GA_predict.m
semilogy(SNR_db, bler, "-h");
hold on;

%% GA predict BLER12-Apr-2022 12:54:42
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
bler = [4.713968e-01 2.859272e-01 1.537563e-01 7.506671e-02 3.294823e-02 1.339139e-02 4.962875e-03 ];
%%%./sim_result/sc/punct_type2_768_384_1_GA_predict.m
semilogy(SNR_db, bler, "-h");
hold on;

%% GA predict BLER12-Apr-2022 12:54:47
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
bler = [4.116424e-01 2.233946e-01 1.063666e-01 4.548989e-02 1.758308e-02 6.306506e-03 2.109380e-03 ];
%%%./sim_result/sc/punct_type2_768_576_1_GA_predict.m
semilogy(SNR_db, bler, "-h");


ylabel("BLER");
xlabel("SNR(dB)");
grid on;
% legend('512/128 polar' ,'576/288 ASC','576/432 ASC', '576/144 type1', '576/288 type1', '576/432 type1', '576/144 DES', '576/288 DES', '576/432 DES', '1536/768 type1', '1536/768 apc', '768/192 ASC', '768/384 ASC', '768/576 ASC');

legend(...
'type1 768/192','type1 768/384','type1 768/576' ,...
'type2 768/192','type2 768/384','type2 768/576' ,...
'shorten 768/192' ,'shorten 768/384', 'shorten 768/576',...
'newQUP 768/192','newQUP 768/384','newQUP 768/576', ...
'punctured_type1 768/192','punctured_type1 768/384','punctured_type1 768/576', ...
'punctured_type2 768/192','punctured_type2 768/384','punctured_type2 768/576')