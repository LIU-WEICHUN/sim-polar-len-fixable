%% GA predict BLER12-Apr-2022 12:54:20
SNR_db = [-2.000000e+00 -1.750000e+00 -1.500000e+00 -1.250000e+00 -1.000000e+00 -7.500000e-01 -5.000000e-01 ];
bler = [3.534344e-01 2.270215e-01 1.347141e-01 7.417413e-02 3.800938e-02 1.805223e-02 7.978423e-03 ];
%%%./sim_result/sc/punct_type1_768_192_1_GA_predict.m
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, '-+'); 
hold on; 
