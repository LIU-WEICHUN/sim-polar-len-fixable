%%04-Apr-2022 21:48:49
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
TX_CNT = [101000 101000 101000 101000 101000 101000 104000 ];
BLK_ERR_CNT = [38131 23799 13372 6638 3037 1313 501 ];
BIT_ERR_CNT = [3305186 1832468 983455 430704 175492 71254 25342 ];
%%%./sim_result/punct_type2_768_384_104-Apr-2022 11:36:41.m
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, '-+'); 
hold on; 