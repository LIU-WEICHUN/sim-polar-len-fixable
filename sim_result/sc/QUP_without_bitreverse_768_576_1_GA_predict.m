%% GA predict BLER18-Apr-2022 12:05:49
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
bler = [4.167755e-01 2.303001e-01 1.128430e-01 4.984923e-02 1.991468e-02 7.579626e-03 2.617341e-03 ];
%%%./sim_result/sc/QUP_without_bitreverse_768_576_1_GA_predict.m
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, '-+'); 
hold on; 
