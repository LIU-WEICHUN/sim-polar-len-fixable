%%03-Apr-2022 02:36:48
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
TX_CNT = [101000 101000 101000 101000 101000 101000 175000 ];
BLK_ERR_CNT = [33820 19695 10067 4668 1927 772 501 ];
BIT_ERR_CNT = [3654627 1958740 980707 408985 142802 52657 34425 ];
%%%./sim_result/type4_768_576_102-Apr-2022 22:08:06.m
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, '-+'); 
hold on; 