function fileName = name_sc_precdict_file(POLAR_TYPE, N, K, L)
    switch POLAR_TYPE
        case 0
            fileName = sprintf('./sim_result/sc/polar_%d_%d_%d', N, K, L);
        case 1
            fileName = sprintf('./sim_result/sc/ipolar_f_%d_%d_%d', N, K, L);
        case 21
            fileName = sprintf('./sim_result/sc/apcASC_%d_%d_%d', N, K, L);
        case 22
            fileName = sprintf('./sim_result/sc/apcDES_%d_%d_%d', N, K, L);
        case 31
            fileName = sprintf('./sim_result/sc/type1_%d_%d_%d', N, K, L);
        case 32
            fileName = sprintf('./sim_result/sc/type2_%d_%d_%d', N, K, L);
        case 33
            fileName = sprintf('./sim_result/sc/type3_%d_%d_%d', N, K, L);
        case 34
            fileName = sprintf('./sim_result/sc/type4_%d_%d_%d', N, K, L);
        case 41
            fileName = sprintf('./sim_result/sc/punctQUP_%d_%d_%d', N, K, L);
        case 42
            fileName = sprintf('./sim_result/sc/shorten_%d_%d_%d', N, K, L);
        case 43
            fileName = sprintf('./sim_result/sc/double_shorten_%d_%d_%d', N, K, L); 
        case 44
            fileName = sprintf('./sim_result/sc/fourtime_shorten_%d_%d_%d', N, K, L);
        case 45
            fileName = sprintf('./sim_result/sc/QUP_without_bitreverse_%d_%d_%d', N, K, L); 
        case 46
            fileName = sprintf('./sim_result/sc/punct_type1_%d_%d_%d', N, K, L); 
        case 47
            fileName = sprintf('./sim_result/sc/punct_type2_%d_%d_%d', N, K, L); 
        otherwise
            disp('undefine');
            assert(false, "undefine polar type");
    end
    fileName = [fileName, '_','GA_predict', '.m'];
end

