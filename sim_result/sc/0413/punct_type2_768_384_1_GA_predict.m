%% GA predict BLER12-Apr-2022 12:54:42
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
bler = [4.713968e-01 2.859272e-01 1.537563e-01 7.506671e-02 3.294823e-02 1.339139e-02 4.962875e-03 ];
%%%./sim_result/sc/punct_type2_768_384_1_GA_predict.m
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, '-+'); 
hold on; 
