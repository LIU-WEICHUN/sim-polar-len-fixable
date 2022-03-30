% The SCL decoder using recursive method
%
% Created by  Mao-Ching Chiu 2019/08/09
% All right reserved

function [u0,x0] = NEW_polarSCL(llr, iMap, L, POLAR_TYPE, CRC_POLY)
pm_prev = 0;
if(POLAR_TYPE == 0)
    [u,x,pm, cidx] = spcSCLIte(llr, iMap, pm_prev, L);
else
    [u,x,pm, cidx] = ipolarSCLIte(llr, iMap, pm_prev, L, 0, 0);
end

CRC_CHECK = 0;
L1 = size(u,1);
if(length(CRC_POLY) ~= 1)
    for i = 1: L1
        u0 = u(i,iMap == 1);
        CRC_CHECK = crcCheck(u0, CRC_POLY);
        if(CRC_CHECK == 1)
            break;
        end
    end
end
if(CRC_CHECK == 0)
    i = 1;
end
u0 = u(i,iMap == 1);
x0 = x(i, :);
return


%%%%% Iterative function of SCL decoder
function [u, x, pm, cidx] = spcSCLIte(llr, iMap, pm_prev, L)
N = size(llr, 2) ;  %% block length
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
upper_size = ceil(N/2);
lower_size = N - upper_size;

llrU = box_plus(llr(:, 1:lower_size), llr(:, upper_size+1: N));  %%% generate the LLR for the upper SCL decoder
llrU = [llrU, llr(:,size(llrU, 2)+1: upper_size)];
[u1, x1, pm1, cidx1] = spcSCLIte(llrU, iMap(1:upper_size), pm_prev, L); %%% perform upper SCL decoding

llrL = (1- 2 * x1(:,1:lower_size)) .* llr(cidx1, 1:lower_size) + llr(cidx1, upper_size+1: N); %%% generate the LLR for the lower SCL decoder

[u2, x2, pm, cidx2] = spcSCLIte(llrL, iMap(upper_size+1: N), pm1, L); %%% perform lower SCL decoding

cidx = cidx1(cidx2);
% x = [xor(x1(cidx2,:), x2), x2];
x = [xor(x1(cidx2,1:lower_size), x2), x1(cidx2,lower_size+1:end), x2];  %%% generate the partial codewords
  
u = [u1(cidx2, :), u2];          %%% concatenate the message candidates

return




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