%% GA predict BLER12-Apr-2022 12:54:47
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
bler = [4.116424e-01 2.233946e-01 1.063666e-01 4.548989e-02 1.758308e-02 6.306506e-03 2.109380e-03 ];
%%%./sim_result/sc/punct_type2_768_576_1_GA_predict.m
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, '-+'); 
hold on; 
