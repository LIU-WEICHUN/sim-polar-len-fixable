%% GA predict BLER12-Apr-2022 12:54:03
SNR_db = [-2.000000e+00 -1.750000e+00 -1.500000e+00 -1.250000e+00 -1.000000e+00 -7.500000e-01 -5.000000e-01 ];
bler = [2.938802e-01 1.806785e-01 1.031834e-01 5.521695e-02 2.714576e-02 1.261112e-02 5.361038e-03 ];
%%%./sim_result/sc/QUP_without_bitreverse_768_192_1_GA_predict.m
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, '-+'); 
hold on; 
