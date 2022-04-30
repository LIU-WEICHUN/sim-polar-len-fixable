%% GA predict BLER12-Apr-2022 12:46:32
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
bler = [4.628840e-01 2.757155e-01 1.447570e-01 6.840133e-02 2.883368e-02 1.125717e-02 3.965139e-03 ];
%%%./sim_result/shorten_768_384_1_GA_predict.m
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, '-+'); 
hold on; 
