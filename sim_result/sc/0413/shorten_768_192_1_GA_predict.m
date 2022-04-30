%% GA predict BLER12-Apr-2022 12:53:46
SNR_db = [-2.000000e+00 -1.750000e+00 -1.500000e+00 -1.250000e+00 -1.000000e+00 -7.500000e-01 -5.000000e-01 ];
bler = [3.640172e-01 2.359951e-01 1.422973e-01 7.944824e-02 4.111715e-02 1.994224e-02 9.020173e-03 ];
%%%./sim_result/sc/shorten_768_192_1_GA_predict.m
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, '-+'); 
hold on; 
