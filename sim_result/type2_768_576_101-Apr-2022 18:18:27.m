%%01-Apr-2022 22:47:31
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
TX_CNT = [101000 101000 101000 101000 101000 101000 180000 ];
BLK_ERR_CNT = [33791 19543 10011 4615 1984 789 501 ];
BIT_ERR_CNT = [3483308 1827302 904259 365434 129649 50973 30896 ];
%%%./sim_result/type2_768_576_101-Apr-2022 18:18:27.m
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, '-+'); 
hold on; 
