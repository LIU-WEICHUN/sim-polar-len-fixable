%% GA predict BLER12-Apr-2022 12:54:08
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
bler = [4.690917e-01 2.835999e-01 1.522570e-01 7.549777e-02 3.303187e-02 1.330901e-02 4.972029e-03 ];
%%%./sim_result/sc/QUP_without_bitreverse_768_384_1_GA_predict.m
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, '-+'); 
hold on; 
