%%31-Mar-2022 23:18:58
SNR_db = [-2.000000e+00 -1.750000e+00 -1.500000e+00 -1.250000e+00 -1.000000e+00 -7.500000e-01 -5.000000e-01 ];
TX_CNT = [101000 101000 101000 101000 101000 101000 101000 ];
BLK_ERR_CNT = [26761 17021 10220 5895 2677 1340 561 ];
BIT_ERR_CNT = [1110643 662875 373372 204237 82211 40880 15746 ];
%%%./sim_result/type1_768_192_131-Mar-2022 18:59:32.m
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, '-+'); 
hold on; 
