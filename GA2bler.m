function P_error_block = GA2bler(ga_llr_mean, unfrozen_set)
    P_error_each_node = qfunc(sqrt(ga_llr_mean(unfrozen_set)./2));
    P_correct_each_node = 1- P_error_each_node;
    P_correct_block = prod(P_correct_each_node);
    P_error_block = 1- P_correct_block;
end

