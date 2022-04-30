%% GA predict BLER12-Apr-2022 12:54:26
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
bler = [4.594843e-01 2.737013e-01 1.443331e-01 6.790490e-02 2.887920e-02 1.102821e-02 3.934259e-03 ];
%%%./sim_result/sc/punct_type1_768_384_1_GA_predict.m
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, '-+'); 
hold on; 
