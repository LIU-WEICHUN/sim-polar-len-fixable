%% GA predict BLER12-Apr-2022 12:52:43
SNR_db = [-2.000000e+00 -1.750000e+00 -1.500000e+00 -1.250000e+00 -1.000000e+00 -7.500000e-01 -5.000000e-01 ];
bler = [3.241304e-01 2.028919e-01 1.181046e-01 6.369289e-02 3.147278e-02 1.450218e-02 6.165180e-03 ];
%%%./sim_result/sc/type1_768_192_1_GA_predict.m
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, '-+'); 
hold on; 
