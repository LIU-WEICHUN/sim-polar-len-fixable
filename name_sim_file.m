function fileName = name_sim_file(POLAR_TYPE, N, K, L)
    switch POLAR_TYPE
        case 0
            fileName = sprintf('./sim_result/polar_%d_%d_%d', N, K, L);
        case 1
            fileName = sprintf('./sim_result/ipolar_f_%d_%d_%d', N, K, L);
        case 21
            fileName = sprintf('./sim_result/apcASC_%d_%d_%d', N, K, L);
        case 22
            fileName = sprintf('./sim_result/apcDES_%d_%d_%d', N, K, L);
        case 31
            fileName = sprintf('./sim_result/type1_%d_%d_%d', N, K, L);
        case 32
            fileName = sprintf('./sim_result/type2_%d_%d_%d', N, K, L);
        case 33
            fileName = sprintf('./sim_result/type3_%d_%d_%d', N, K, L);
        case 34
            fileName = sprintf('./sim_result/type4_%d_%d_%d', N, K, L);
        case 41
            fileName = sprintf('./sim_result/punctQUP_%d_%d_%d', N, K, L);
        case 42
            fileName = sprintf('./sim_result/shorten_%d_%d_%d', N, K, L);
        case 43
            fileName = sprintf('./sim_result/double_shorten_%d_%d_%d', N, K, L); 
        case 44
            fileName = sprintf('./sim_result/fourtime_shorten_%d_%d_%d', N, K, L);
        case 45
            fileName = sprintf('./sim_result/QUP_without_bitreverse_%d_%d_%d', N, K, L); 
        case 46
            fileName = sprintf('./sim_result/punct_type1_%d_%d_%d', N, K, L); 
        case 47
            fileName = sprintf('./sim_result/punct_type2_%d_%d_%d', N, K, L); 
        otherwise
            disp('undefine');
            assert(false, "undefine polar type");
    end
    fileName = [fileName,'_',datestr(datetime('now')), '.m'];
end

