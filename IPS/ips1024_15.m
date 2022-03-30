ips = [
    0,    1,    2,    4,    8,   16,   32,  512,   64,  128,  256,  768,  257,  129,   65,   17,  513,  258,  130,    3,  514,  260,  132,    5,    6,  516,    9,   10,  264,  640,   12,   18, ...
   33,  520,   20,   34,   24,  272,    7,   36,   66,   40,  528,   11,   68,   48,  136,   72,   13,  288,   19,   14,  544,   80,  144,   21,  320,   96,   22,   35,   25,  576,  384,   37, ...
   26,  160,   67,   38,   28,  192,   41,  896,  644,   15,   42,   69,  577,   49,  545,   44,   70,  131,  385,   50,   73,   23,  772,  321,   52,   74,  133,  641,   81,   27,   76,   56, ...
  134,   39,  259,  578,   82,  137,   29,   97,  515,   84,  138,   30,  261,  386,   43,   98,  145,   88,  140,  769,  262,  100,   45,   71,  146,  642,  265,   51,   46,  161,  104,  148, ...
  266,   75,  517,  770,  162,   53,  273,  152,  112,  268,  193,  518,   54,  164,   77,  274,  135,   57,  521,  289,   83,   78,  194,  529,   58,  168,  276,   31,  522,   85,  196,  139, ...
  290,   60,  388,  176,  280,   86,  524,   99,  800,  200,   89,  292,  141,  530,  263,  322,   47,   90,  101,  147,  142,  648,  296,  208,  532,  102,   92,  776,  324,  149,  105,  546, ...
  267,  304,  224,  536,   55,  392,  150,  163,  106,  580,  328,  153,   79,  548,  113,  269,  108,  519,  656,  165,  154,  784,   59,  114,  275,  270,  336,  552,  166,  156,  195,   87, ...
  400,  116,   61,  584,  169,  672,  277,  523,  560,   62,  352,  120,  170,  197,  291,  278,  832,   91,  143,  281,  177,  416,  198,  172,  704,  103,  525,  178,   93,  201,  282,  293, ...
  531,  526,  151,  592,  323,   94,  180,  202,  294,  284,  107,  448,  297,  209,  533,  155,  608,  960,  204,  184,  109,  298,  167,  271,  325,  210,  834,  534,  801,  115,  547,  110, ...
  305,  157,  225,  537,  300,  326,  785,  212,  705,  387,  158,   63,  171,  306,  117,  329,  279,  549,  226,  538,  900,  673,  216,  118,  308,  330,  173,  199,  389,  550,  540,  228, ...
  579,  121,  833,  337,  553,  179,  283,  332,  174,  312,  706,  390,  122,  232,  338,  295,   95,  393,  554,  203,  527,  581,  285,  181,  802,  353,  124,  561,  340,  394,  240,  556, ...
  182,  286,  582,  205,  643,  299,  897,  354,  401,  562,  185,  585,  344,  771,  211,  396,  535,  206,  111,  356,  186,  402,  301,  327,  564,  586,  645,  159,  417,  213,  307,  593, ...
  302,  188,  836,  360,  404,  588,  539,  568,  119,  646,  214,  227,  331,  898,  418,  594,  309,  551,  649,  217,  408,  368,  609,  541,  449,  310,  175,  596,  420,  333,  218,  708, ...
  229,  650,  123,  391,  313,  773,  542,  610,  339,  657,  334,  450,  555,  230,  220,  600,  424,  314,  652,  125,  774,  233,  287,  612,  658,  183,  452,  341,  395,  777,  316,  557, ...
  583,  126,  234,  432,  928,  342,  207,  355,  616,  563,  660,  558,  241,  778,  456,  345,  397,  236,  674,  187,  840,  242,  303,  587,  346,  664,  357,  624,  403,  565,  398,  780, ...
  464,  904,  215,  676,  358,  786,  244,  348,  566,  189,  589,  405,  361,  569,  647,  712,  804,  190,  480,  311,  595,  590,  248,  680,  788,  406,  419,  362,  570,  219,  409,  335, ...
  848,  369,  543,  912,  597,  364,  572,  231,  651,  688,  792,  410,  421,  315,  221,  370,  611,  598,  720,  601,  864,  653,  422,  343,  412,  451,  222,  816,  317,  127,  775,  372, ...
  235,  425,  559,  602,  613,  659,  654,  736,  318,  426,  614,  376,  453,  604,  399,  347,  237,  808,  661,  992,  617,  433,  779,  567,  243,  238,  359,  428,  454,  930,  662,  675, ...
  913,  591,  618,  349,  191,  434,  665,  457,  865,  245,  407,  962,  781,  625,  849,  620,  571,  350,  666,  677,  363,  929,  436,  246,  458,  787,  782,  626,  599,  249,  678,  465, ...
  668,  411,  707,  573,  914,  460,  440,  365,  681,  628,  789,  709,  250,  423,  466,  223,  574,  371,  366,  682,  866,  655,  413,  603,  961,  790,  803,  632,  481,  252,  689,  468, ...
  793,  615,  710,  414,  684,  319,  835,  427,  373,  482,  605,  690,  713,  794,  805,  663,  899,  472,  374,  239,  606,  429,  484,  455,  692,  714,  806,  619,  796,  377,  721,  932, ...
  809,  435,  837,  430,  716,  667,  696,  378,  488,  621,  351,  810,  247,  722,  737,  459,  783,  679,  437,  380,  627,  817,  622,  964,  669,  868,  496,  812,  838,  724,  438,  901, ...
  461,  818,  670,  841,  575,  738,  441,  629,  683,  251,  791,  728,  467,  462,  367,  820,  842,  630,  442,  968,  740,  685,  711,  633,  936,  415,  253,  469,  844,  824,  444,  902, ...
  691,  795,  686,  744,  634,  850,  254,  375,  905,  470,  483,  607,  807,  715,  473,  976,  636,  693,  797,  752,  852,  906,  431,  474,  485,  694,  798,  379,  872,  717,  944,  811, ...
  697,  856,  908,  486,  723,  476,  718,  623,  381,  916,  698,  489,  839,  813,  671,  439,  880,  819,  382,  725,  814,  490,  463,  920,  631,  497,  700,  996,  977,  843,  443,  726, ...
  492,  739,  821,  729,  498,  945,  471,  969,  822,  845,  994,  687,  445,  635,  741,  730,  903,  937,  825,  255,  500,  851,  881,  846,  446,  742,  732,  475,  826,  799,  637,  978, ...
  745,  504,  853,  695,  907,  946,  487,  828,  638,  746,  719,  854,  867,  993,  477,  857,  909,  970,  753,  699,  748,  478,  815,  491,  383,  915,  869,  858,  931,  910,  754,  727, ...
  870,  860,  701,  493,  980,  917,  756,  873,  823,  702,  499,  494,  918, 1008,  731,  874,  760,  847,  948,  921,  963,  447,  743,  501,  876,  827,  922,  933,  733,  882,  502,  855, ...
  934,  924, 1000,  734,  505,  829,  639,  747,  884,  984,  506,  830,  938,  965,  479,  859,  911,  749,  888,  952,  755,  508,  871,  750,  940,  966,  861,  919,  703,  972,  757, 1010, ...
  495,  875,  862,  758, 1001,  985,  761,  923, 1009,  877,  953,  986,  935,  735,  762,  503,  883, 1002,  878,  925, 1016,  764,  988,  939,  926,  831,  885,  507,  947,  751,  967,  886, ...
  941, 1004,  889, 1012,  971,  942,  509,  890,  863,  949,  759,  979,  510,  995,  892,  950,  973,  954,  981,  763,  997,  879,  974,  956,  927,  765,  998,  887,  982, 1020, 1018,  766, ...
 1017,  943,  891,  975,  999, 1011,  511,  983,  893,  951, 1003,  894,  987,  955, 1013, 1005,  989,  957, 1014, 1006,  767,  958,  990,  895, 1007,  959, 1015, 1019, 1021,  991, 1022, 1023 
];
