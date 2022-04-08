
clear;
% hold on;

% % 512/128 polar
% %%27-Dec-2021 11:15:14
% SNR_db = [-2.500000e+00 -2.250000e+00 -2.000000e+00 -1.750000e+00 -1.500000e+00 -1.250000e+00 -1.000000e+00 ];
% TX_CNT = [100000 100000 100000 46000 0 0 0 ];
% BLK_ERR_CNT = [9.693100e+04 6.935400e+04 5.611200e+04 1.419800e+04 0.000000e+00 0.000000e+00 0.000000e+00 ];
% BIT_ERR_CNT = [5797244 4287519 3277976 742520 0 0 0 ];
% semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-x");
% hold on;
% 
% % 576/288 asc
% SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
% TX_CNT = [100000 100000 100000 100000 100000 100000 100000 ];
% BLK_ERR_CNT = [1.370400e+04 5.915000e+03 2.369000e+03 6.750000e+02 1.640000e+02 3.200000e+01 1.000000e+01 ];
% BIT_ERR_CNT = [1064695 420285 160067 43369 9288 1880 722 ];
% semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-<");
% hold on;
% 
% % 576/432 asc
% %%07-Jan-2022 18:05:41
% SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
% TX_CNT = [500000 500000 500000 500000 500000 500000 500000 ];
% BLK_ERR_CNT = [70061 26972 9050 2647 611 132 29 ];
% BIT_ERR_CNT = [7738801 2829538 846820 215769 47598 9405 1916 ];
% semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-<");
% hold on;
% 
% % 576/144 type1
% %%08-Jan-2022 18:20:05
% SNR_db = [-3.000000e+00 -2.750000e+00 -2.500000e+00 -2.250000e+00 -2.000000e+00 -1.750000e+00 -1.500000e+00 ];
% TX_CNT = [500 500 500 500 500 500 500 ];
% BLK_ERR_CNT = [311 221 180 90 51 28 9 ];
% BIT_ERR_CNT = [14434 9972 7723 3618 1902 944 248 ];
% semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-o");
% hold on;
% 
% % 576/288 type1
% SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
% TX_CNT = [500000 500000 500000 500000 500000 500000 500000 ];
% BLK_ERR_CNT = [67785 29341 10753 3474 869 202 21 ];
% BIT_ERR_CNT = [4427613 1739206 579255 173495 40181 9305 788 ];
% semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-o");
% hold on;
% 
% % 576/432 type1
% %%03-Jan-2022 07:44:16
% SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
% TX_CNT = [500000 500000 500000 500000 500000 500000 500000 ];
% BLK_ERR_CNT = [69856 26782 7995 1900 447 79 11 ];
% BIT_ERR_CNT = [6212456 2224463 599027 133293 29971 4555 722 ];
% semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-o");
% hold on;
% 
% 
% % 576/144 DES
% %%13-Jan-2022 04:37:39
% SNR_db = [-3.000000e+00 -2.750000e+00 -2.500000e+00 -2.250000e+00 -2.000000e+00 -1.750000e+00 -1.500000e+00 ];
% TX_CNT = [101000 101000 101000 101000 101000 101000 101000 ];
% BLK_ERR_CNT = [58416 44109 31534 19792 11189 5693 2608 ];
% BIT_ERR_CNT = [2757751 1893037 1203382 748967 390332 176528 74556 ];
% semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "->");
% hold on;
% 
% % 576/288 DES
% %%13-Jan-2022 22:25:56
% SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
% TX_CNT = [101000 101000 101000 101000 349000 500000 500000 ];
% BLK_ERR_CNT = [12854 5359 1932 547 502 145 35 ];
% BIT_ERR_CNT = [811960 317859 99918 28648 23441 7070 1541 ];
% semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "->");
% hold on;
% 
% % 576/432 DES
% %%14-Jan-2022 10:55:34
% SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
% TX_CNT = [101000 101000 101000 187000 500000 500000 500000 ];
% BLK_ERR_CNT = [10782 3725 1079 501 253 47 8 ];
% BIT_ERR_CNT = [1097882 354414 97758 39172 17946 2856 302 ];
% semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "->");
% hold on;
% 
% % 1536/768 type1
% %%06-Jan-2022 07:09:22
% SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
% TX_CNT = [500000 500000 500000 500000 500000 500000 500000 ];
% BLK_ERR_CNT = [20745 4639 815 107 14 2 0 ];
% BIT_ERR_CNT = [2648156 509283 81926 9154 1267 128 0 ];
% semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-o");
% hold on;
% 
% % 1536/768 ASC
% %%09-Jan-2022 11:21:03
% SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
% TX_CNT = [250000 250000 250000 250000 250000 250000 250000 ];
% BLK_ERR_CNT = [9292 2164 410 47 7 0 0 ];
% BIT_ERR_CNT = [1411707 295626 47724 4768 642 0 0 ];
% semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-<");
% hold on;

% 768/192 ASC
%%14-Jan-2022 21:24:52
SNR_db = [-3.000000e+00 -2.750000e+00 -2.500000e+00 -2.250000e+00 -2.000000e+00 -1.750000e+00 -1.500000e+00 ];
TX_CNT = [101000 101000 101000 101000 101000 101000 101000 ];
BLK_ERR_CNT = [51485 35331 21651 11935 5715 2090 763 ];
BIT_ERR_CNT = [3543438 2271954 1244282 612308 274095 97017 31399 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-<");
hold on;

% 768/384 ASC
%%15-Jan-2022 12:55:58
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
TX_CNT = [101000 101000 101000 188000 500000 500000 500000 ];
BLK_ERR_CNT = [9833 3538 1067 502 226 34 10 ];
BIT_ERR_CNT = [924508 306976 82169 34764 15117 1682 452 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-<");
hold on;

% 768/576 ASC
%%16-Jan-2022 06:00:12
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
TX_CNT = [101000 101000 101000 226000 500000 500000 500000 ];
BLK_ERR_CNT = [10960 3737 1071 504 174 25 4 ];
BIT_ERR_CNT = [1464423 441372 113671 48952 15767 2836 352 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-<");
hold on;


% 768/192 DES
%%19-Feb-2022 23:45:40
SNR_db = [-3.000000e+00 -2.750000e+00 -2.500000e+00 -2.250000e+00 -2.000000e+00 -1.750000e+00 -1.500000e+00 ];
TX_CNT = [101000 101000 101000 101000 101000 101000 101000 ];
BLK_ERR_CNT = [56177 40082 25443 15199 7480 3338 1248 ];
BIT_ERR_CNT = [3464112 2277969 1331681 702455 327430 134703 45657 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "->");
hold on;

% 768/384 DES
%%20-Feb-2022 20:11:33
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
TX_CNT = [101000 101000 101000 223000 500000 500000 500000 ];
BLK_ERR_CNT = [9776 3653 1029 502 221 37 4 ];
BIT_ERR_CNT = [766381 247889 64513 30029 11002 1614 248 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "->");
hold on;

% 768/576 DES
%%21-Feb-2022 11:56:50
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
TX_CNT = [101000 101000 101000 500000 500000 500000 500000 ];
BLK_ERR_CNT = [7355 2251 515 403 68 7 1 ];
BIT_ERR_CNT = [925589 260870 54678 34262 5973 384 14 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "->");
hold on;



% type1 768/192
%%16-Feb-2022 03:33:15
SNR_db = [-3.000000e+00 -2.750000e+00 -2.500000e+00 -2.250000e+00 -2.000000e+00 -1.750000e+00 -1.500000e+00 ];
TX_CNT = [101000 101000 101000 101000 101000 101000 101000 ];
BLK_ERR_CNT = [55582 39378 24973 14151 6936 2936 1257 ];
BIT_ERR_CNT = [3391868 2173690 1270793 650382 294191 114283 45371 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-.");
hold on;

% type1 768/384
%%16-Feb-2022 22:36:38
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
TX_CNT = [101000 101000 101000 191000 500000 500000 500000 ];
BLK_ERR_CNT = [10804 3904 1173 503 263 45 6 ];
BIT_ERR_CNT = [894809 286273 77906 31864 14351 2439 388 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-.");
hold on;

% type1 768/576
%%17-Feb-2022 21:35:49
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
TX_CNT = [101000 101000 101000 408000 500000 500000 500000 ];
BLK_ERR_CNT = [8311 2560 625 501 103 17 1 ];
BIT_ERR_CNT = [1030532 270036 59635 42402 8740 990 66 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-.");
hold on;

% type2 768/192
%%20-Jan-2022 17:19:44
SNR_db = [-3.000000e+00 -2.750000e+00 -2.500000e+00 -2.250000e+00 -2.000000e+00 -1.750000e+00 -1.500000e+00 ];
TX_CNT = [101000 101000 101000 101000 101000 101000 101000 ];
BLK_ERR_CNT = [55604 40857 27069 14886 7881 3524 1320 ];
BIT_ERR_CNT = [3377684 2207078 1345976 689697 326632 133451 47035 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-*");
hold on;

% type2 768/384
%%21-Jan-2022 09:11:20
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
TX_CNT = [101000 101000 101000 128000 500000 500000 500000 ];
BLK_ERR_CNT = [11128 4368 1283 502 339 52 10 ];
BIT_ERR_CNT = [805413 272838 73360 24237 14873 2084 540 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-*");
hold on;

% type2 768/576
%%16-Feb-2022 20:24:10
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
TX_CNT = [101000 101000 101000 214000 500000 500000 500000 ];
BLK_ERR_CNT = [10898 3929 1031 503 184 19 4 ];
BIT_ERR_CNT = [1125781 345107 85420 36812 11410 753 184 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-*");
hold on;

% QUP 768/192
%%09-Feb-2022 04:51:54
% SNR_db = [-3.000000e+00 -2.750000e+00 -2.500000e+00 -2.250000e+00 -2.000000e+00 -1.750000e+00 -1.500000e+00 ];
% TX_CNT = [101000 101000 101000 101000 101000 101000 101000 ];
% BLK_ERR_CNT = [55716 40896 27061 14909 7836 3536 1308 ];
% BIT_ERR_CNT = [3386182 2209770 1344461 690287 325100 134232 46424 ];

%%20-Feb-2022 01:56:00
SNR_db = [-3.000000e+00 -2.750000e+00 -2.500000e+00 -2.250000e+00 -2.000000e+00 -1.750000e+00 -1.500000e+00 ];
TX_CNT = [101000 101000 101000 101000 101000 101000 101000 ];
BLK_ERR_CNT = [55631 40839 27090 14908 7884 3504 1307 ];
BIT_ERR_CNT = [3378699 2204958 1345489 690561 327109 132920 46228 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-v");
hold on;

% QUP 768/384
%%10-Feb-2022 08:32:41
% SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
% TX_CNT = [101000 101000 101000 127000 500000 500000 500000 ];
% BLK_ERR_CNT = [11119 4343 1278 501 338 53 10 ];
% BIT_ERR_CNT = [804348 271033 73255 24089 14863 2120 540 ];
%%21-Feb-2022 03:36:51
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
TX_CNT = [101000 101000 101000 130000 500000 500000 500000 ];
BLK_ERR_CNT = [11100 4380 1288 503 340 52 10 ];
BIT_ERR_CNT = [803234 272813 73231 24124 14993 2084 540 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-v");
hold on;

% QUP 768/576
%%16-Feb-2022 23:27:28
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
TX_CNT = [101000 101000 101000 214000 500000 500000 500000 ];
BLK_ERR_CNT = [10898 3929 1031 503 184 19 4 ];
BIT_ERR_CNT = [1125781 345107 85420 36812 11410 753 184 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-v");
hold on;

% shorten 768/192
%%16-Feb-2022 12:07:56
SNR_db = [-3.000000e+00 -2.750000e+00 -2.500000e+00 -2.250000e+00 -2.000000e+00 -1.750000e+00 -1.500000e+00 ];
TX_CNT = [101000 101000 101000 101000 101000 101000 101000 ];
BLK_ERR_CNT = [56311 40202 25668 15474 7456 3233 1216 ];
BIT_ERR_CNT = [3469612 2288791 1325548 716919 330638 129067 44926 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-^");
hold on;

% shorten 768/384
%%18-Feb-2022 09:47:15
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
TX_CNT = [101000 101000 101000 220000 500000 500000 500000 ];
BLK_ERR_CNT = [9609 3510 1045 502 262 36 3 ];
BIT_ERR_CNT = [761463 237233 64360 33053 13747 1913 132 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-^");
hold on;

% shorten 768/576
%%12-Feb-2022 07:56:49
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
TX_CNT = [101000 101000 101000 500000 500000 367000 0 ];
BLK_ERR_CNT = [7565 2198 530 436 59 4 0 ];
BIT_ERR_CNT = [945719 253775 54762 39556 5687 106 0 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-^");
hold on;


% type3 768/192
%%19-Feb-2022 23:04:05
SNR_db = [-3.000000e+00 -2.750000e+00 -2.500000e+00 -2.250000e+00 -2.000000e+00 -1.750000e+00 -1.500000e+00 ];
TX_CNT = [101000 101000 101000 101000 101000 101000 101000 ];
BLK_ERR_CNT = [55504 39618 24877 14187 6964 2960 1278 ];
BIT_ERR_CNT = [3714802 2441511 1432385 747437 343070 135694 55684 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-x");
hold on;

% type3 768/384
%%14-Feb-2022 09:30:59
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
TX_CNT = [101000 101000 101000 191000 500000 500000 500000 ];
BLK_ERR_CNT = [10843 4029 1240 501 276 52 12 ];
BIT_ERR_CNT = [1058431 359611 103508 38451 19071 2992 657 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-x");
hold on;

% type3 768/576
%%15-Feb-2022 11:26:44
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
TX_CNT = [101000 101000 101000 418000 500000 500000 500000 ];
BLK_ERR_CNT = [8452 2568 632 501 127 15 1 ];
BIT_ERR_CNT = [1221066 329332 74700 52512 12122 1031 56 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-x");
hold on;


% type4 768/192
%%17-Feb-2022 20:24:47
SNR_db = [-3.000000e+00 -2.750000e+00 -2.500000e+00 -2.250000e+00 -2.000000e+00 -1.750000e+00 -1.500000e+00 ];
TX_CNT = [101000 101000 101000 101000 101000 101000 101000 ];
BLK_ERR_CNT = [55768 41359 27257 14650 7798 3627 1388 ];
BIT_ERR_CNT = [3464224 2325943 1422503 712358 343778 146027 52874 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-+");
hold on;

% type4 768/384
%%12-Feb-2022 02:01:44
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
TX_CNT = [101000 101000 101000 127000 500000 500000 500000 ];
BLK_ERR_CNT = [11285 4526 1321 501 352 61 21 ];
BIT_ERR_CNT = [894425 316804 80369 29284 19724 3123 1464 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-+");
hold on;

% type4 768/576
%%13-Feb-2022 17:40:38
% SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
% TX_CNT = [101000 101000 101000 13000 0 0 0 ];
% BLK_ERR_CNT = [10849 3873 1004 29 0 0 0 ];
% BIT_ERR_CNT = [1245286 394071 94505 2776 0 0 0 ];
% semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-+");
%%18-Feb-2022 20:03:51
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
TX_CNT = [101000 101000 101000 219000 500000 500000 500000 ];
BLK_ERR_CNT = [10819 3630 1050 501 207 27 3 ];
BIT_ERR_CNT = [1239149 362386 100684 44348 16502 2127 180 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-+");
hold on;

% QUP without bit permution
%%09-Mar-2022 15:49:26
SNR_db = [-3.000000e+00 -2.750000e+00 -2.500000e+00 -2.250000e+00 -2.000000e+00 -1.750000e+00 -1.500000e+00 ];
TX_CNT = [101000 101000 101000 101000 101000 101000 101000 ];
BLK_ERR_CNT = [51604 35269 21703 11892 5540 2008 737 ];
BIT_ERR_CNT = [3514244 2241531 1225541 613300 263421 91904 30967 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-p");
hold on;

%%10-Mar-2022 10:42:11
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
TX_CNT = [101000 101000 101000 188000 500000 500000 500000 ];
BLK_ERR_CNT = [9634 3693 1016 501 232 39 4 ];
BIT_ERR_CNT = [880508 306051 76662 34100 14334 2191 117 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-p");
hold on;

%%11-Mar-2022 04:26:05
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
TX_CNT = [101000 101000 101000 223000 500000 278000 0 ];
BLK_ERR_CNT = [10780 3679 1011 501 209 18 0 ];
BIT_ERR_CNT = [1288392 380953 91514 42807 16799 1602 0 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-p");
hold on;

% puncture type1
%%09-Mar-2022 07:37:12
SNR_db = [-3.000000e+00 -2.750000e+00 -2.500000e+00 -2.250000e+00 -2.000000e+00 -1.750000e+00 -1.500000e+00 ];
TX_CNT = [101000 101000 101000 101000 101000 101000 101000 ];
BLK_ERR_CNT = [54605 38562 23929 13204 6907 2960 1149 ];
BIT_ERR_CNT = [3563695 2370551 1311165 674317 313322 123409 42200 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-|");
hold on;

%%11-Mar-2022 05:27:58
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
TX_CNT = [101000 101000 101000 249000 500000 500000 500000 ];
BLK_ERR_CNT = [9727 3250 799 501 219 39 3 ];
BIT_ERR_CNT = [843509 257203 57327 32473 13326 1821 114 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-|");
hold on;

%%13-Mar-2022 11:54:24
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
TX_CNT = [101000 101000 101000 500000 500000 500000 500000 ];
BLK_ERR_CNT = [7729 2252 567 406 64 4 0 ];
BIT_ERR_CNT = [975565 247142 62173 36816 4914 254 0 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-|");
hold on;

% puncture type2
%%09-Mar-2022 00:07:41
SNR_db = [-3.000000e+00 -2.750000e+00 -2.500000e+00 -2.250000e+00 -2.000000e+00 -1.750000e+00 -1.500000e+00 ];
TX_CNT = [101000 101000 101000 101000 101000 101000 101000 ];
BLK_ERR_CNT = [52937 37150 23097 12561 6064 2434 861 ];
BIT_ERR_CNT = [3477881 2208205 1267785 647375 289300 106339 34403 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-h");
hold on;

%%09-Mar-2022 22:02:46
SNR_db = [1.500000e+00 1.750000e+00 2.000000e+00 2.250000e+00 2.500000e+00 2.750000e+00 3.000000e+00 ];
TX_CNT = [101000 101000 101000 188000 500000 500000 500000 ];
BLK_ERR_CNT = [9695 3440 1008 501 273 68 4 ];
BIT_ERR_CNT = [824536 256139 65896 28744 13687 3487 84 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-h");
hold on;

%%10-Mar-2022 22:16:09
SNR_db = [4.500000e+00 4.750000e+00 5.000000e+00 5.250000e+00 5.500000e+00 5.750000e+00 6.000000e+00 ];
TX_CNT = [101000 101000 101000 269000 500000 500000 500000 ];
BLK_ERR_CNT = [9854 3239 916 503 194 23 4 ];
BIT_ERR_CNT = [1142235 333089 90726 46936 14613 1958 272 ];
semilogy(SNR_db, BLK_ERR_CNT./TX_CNT, "-h");


ylabel("BLER");
xlabel("SNR(dB)");
grid on;
% legend('512/128 polar' ,'576/288 ASC','576/432 ASC', '576/144 type1', '576/288 type1', '576/432 type1', '576/144 DES', '576/288 DES', '576/432 DES', '1536/768 type1', '1536/768 apc', '768/192 ASC', '768/384 ASC', '768/576 ASC');

legend(...
'768/192 ASC','768/384 ASC','768/576 ASC',...
'768/192 DES','768/384 DES','768/576 DES',...
'type1 768/192','type1 768/384','type1 768/576' ,...
'type2 768/192','type2 768/384','type2 768/576' ,...
'QUP 768/192','QUP 768/384','QUP 768/576',...
'shorten 768/192' ,'shorten 768/384', 'shorten 768/576',...
'type3 768/192', 'type3 768/384','type3 768/576',...
'type4 768/192', 'type4 768/384','type4 768/576', ...
'newQUP 768/192','newQUP 768/384','newQUP 768/576', ...
'punctured_type1 768/192','punctured_type1 768/384','punctured_type1 768/576', ...
'punctured_type2 768/192','punctured_type2 768/384','punctured_type2 768/576')