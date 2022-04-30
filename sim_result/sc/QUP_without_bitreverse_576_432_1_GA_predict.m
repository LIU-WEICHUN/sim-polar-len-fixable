%% GA predict BLER18-Apr-2022 12:03:07
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
bler = [4.181780e-01 2.447952e-01 1.292694e-01 6.146857e-02 2.640446e-02 1.079486e-02 4.087635e-03 ];
%%%./sim_result/sc/QUP_without_bitreverse_576_432_1_GA_predict.m
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, '-+'); 
hold on; 
