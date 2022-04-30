%% GA predict BLER12-Apr-2022 12:54:31
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
bler = [3.492789e-01 1.763498e-01 7.744864e-02 3.134203e-02 1.103920e-02 3.657815e-03 1.073061e-03 ];
%%%./sim_result/sc/punct_type1_768_576_1_GA_predict.m
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, '-+'); 
hold on; 
