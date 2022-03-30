%%% cant vector operation
function [x, num_iter] = bisetionInvTrifinov(phi, range, max_iter)
    x_u_bound = 200;
    x_l_bound = 0;
    phi_l = TrifinovFormula(x_u_bound);
    phi_u = TrifinovFormula(x_l_bound);
    i = 0;
    if(phi < phi_l)
        x = x_u_bound;
        num_iter = i;
        return
    end
    assert(phi <= 1.04, 'phi bigger than 1.04' );
    
    while(i < max_iter)
        i = i+1;
        x_new_bound = (x_l_bound+ x_u_bound)/2;
        phi_new_bound = TrifinovFormula(x_new_bound);
        if(phi_new_bound > phi)
            x_l_bound = x_new_bound;
        else
            x_u_bound = x_new_bound;
        end
        if(x_u_bound - x_l_bound < range)
            x = (x_l_bound+ x_u_bound)/2;
            num_iter = i;
            return
        end
    end