%% GA predict BLER18-Apr-2022 12:05:44
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
bler = [3.450183e-01 1.738904e-01 7.722710e-02 3.015407e-02 1.100948e-02 3.484149e-03 1.021758e-03 ];
%%%./sim_result/sc/shorten_768_576_1_GA_predict.m
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, '-+'); 
hold on; 
