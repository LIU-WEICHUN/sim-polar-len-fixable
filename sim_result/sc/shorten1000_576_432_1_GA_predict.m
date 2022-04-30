%% GA predict BLER18-Apr-2022 11:47:26
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
bler = [3.452279e-01 1.864749e-01 9.199859e-02 4.002619e-02 1.548836e-02 5.706471e-03 1.910057e-03 ];
%%%./sim_result/sc/shorten_576_432_1_GA_predict.m
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, '-+'); 
hold on; 
