%% GA predict BLER12-Apr-2022 12:52:53
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
bler = [3.559759e-01 1.824607e-01 8.070924e-02 3.230165e-02 1.156434e-02 3.812312e-03 1.156534e-03 ];
%%%./sim_result/sc/type1_768_576_1_GA_predict.m
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, '-+'); 
hold on; 
