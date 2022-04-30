%% GA predict BLER12-Apr-2022 12:54:37
SNR_db = [-2.000000e+00 -1.750000e+00 -1.500000e+00 -1.250000e+00 -1.000000e+00 -7.500000e-01 -5.000000e-01 ];
bler = [3.075555e-01 1.927833e-01 1.128731e-01 6.140240e-02 3.132253e-02 1.492255e-02 6.458248e-03 ];
%%%./sim_result/sc/punct_type2_768_192_1_GA_predict.m
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, '-+'); 
hold on; 
