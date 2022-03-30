%%%%% Iterative function of SCL decoder
function [u, x, pm, cidx] = ipolarSCLIte(llr, iMap, pm_prev, L, intIdx, level)

global ipolarInt;

N = size(llr, 2);   %% block length
LI = size(llr,1);   %% number of the input candidates 
p_idx = 1: LI;
if(N == 1)
    if(iMap(1) == 1)
        LLO = 2*LI;  %%% double the list size
        i = 1: LI;
        for m = 0: 1
            pmo((i-1)*2+m+1) = pm_prev(i) - maxStar((2*m-1) * llr(i, 1)).';
            pp((i-1)*2+m+1) = p_idx(i);
            xx((i-1)*2+m+1, 1) = m;
        end
        
    else
        LLO = LI;  %%% same number of list size
        i = 1: LLO;
        pmo(i) = pm_prev(i) - maxStar((-1) * llr(i, 1)).';
        pp(i) = p_idx(i);
        xx(i,1) = 0;
    end
    [a , idx] = sort(pmo, 'descend'); %%% sorting the path metric
    LO = min(LLO, L);
    x(:,1) = xx(idx(1:LO),1); %%% retain the bits of the best metrics
    u = x;
    pm = pmo(idx(1: LO));  %%% retain the path metric 
    cidx = pp(idx(1: LO)); %%% retain the indices from previous surviors
    return
end

llrU = box_plus(llr(:, 1:N/2), llr(:, N/2+1: N));  %%% generate the LLR for the upper SCL decoder

PI = ipolarInt{level+1}(intIdx+1, :);

llrU = llrU(:,PI);
[u1, x1, pm1, cidx1] = ipolarSCLIte(llrU, iMap(1:N/2), pm_prev, L, intIdx*2, level+1); %%% perform upper SCL decoding

x1(:,PI) = x1;

llrL = (1- 2 * x1) .* llr(cidx1, 1:N/2) + llr(cidx1, N/2+1: N); %%% generate the LLR for the lower SCL decoder

[u2, x2, pm, cidx2] = ipolarSCLIte(llrL, iMap(N/2+1: N), pm1, L, intIdx*2+1, level+1); %%% perform lower SCL decoding

cidx = cidx1(cidx2);
x = [xor(x1(cidx2,:), x2), x2];  %%% generate the partial codewords
u = [u1(cidx2, :), u2];          %%% concatenate the message candidates

return




function c = box_plus(x, y)
c = sign(x) .* sign(y) .* min(abs(x), abs(y)) + log(1+exp(-abs(x+y))) - log(1+exp(-abs(x-y)));
return

function c = maxStar(b)
a = zeros(size(b));
c = max(a,b) + log(1+exp(-abs(a-b)));
return