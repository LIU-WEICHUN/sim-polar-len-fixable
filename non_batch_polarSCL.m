% The SCL decoder using recursive method
%
% Created by  Mao-Ching Chiu 2019/08/09
% All right reserved

function [u0,x0] = polarSCL(llr, iMap, L, POLAR_TYPE, CRC_POLY)
pm_prev = 0;
N = size(llr, 2);
switch POLAR_TYPE
    case 0
        [u,x,~, ~] = polarSCLIte(llr, iMap, pm_prev, L);
    case 1
        [u,x,~, ~] = ipolarSCLIte(llr, iMap, pm_prev, L, 0, 0);
    case 21
        apcidx = power2SumVec(N); %ASC
        [u,x,~, ~] = apcSCLIte(llr, iMap, pm_prev, L, apcidx);
    case 22
        apcidx = power2SumVec(N); %ASC
        apcidx = apcidx(end:-1:1);  %%% DES
        [u,x,~, ~] = apcSCLIte(llr, iMap, pm_prev, L, apcidx);
    case 31
        [u,x,~, ~] = spcSCLIte(llr, iMap, pm_prev, L);
    case 32
        [u,x,~, ~] = type2SCLIte(llr, iMap, pm_prev, L);
    case 33
        [u,x,~, ~] = type3SCLIte(llr, iMap, pm_prev, L);
    case 34
        [u,x,~, ~] = type4SCLIte(llr, iMap, pm_prev, L);
    case 41
        vec_punc = QUP(N);
        vec_punc(vec_punc == 1) = llr;
        [u,x,~, ~] = polarSCLIte(vec_punc, iMap, pm_prev, L);
    case {42, 43, 44}
        vec_punc = vec_shorten(N);
        vec_punc(vec_punc == 0) = 1000;
        vec_punc(vec_punc == 1) = llr;
        [u,x,~, ~] = polarSCLIte(vec_punc, iMap, pm_prev, L);
    case 45
        vec_punc = QUPwithoutbitreverse(N);
        vec_punc(vec_punc == 1) = llr;
        [u,x,~, ~] = polarSCLIte(vec_punc, iMap, pm_prev, L);
%         [u,x,~, ~] = batchpolarSCLIte(vec_punc, iMap, pm_prev, L);
    case 46
        vec_punc = punc_type1(N);
        vec_punc(vec_punc == 0) = 1000;
        vec_punc(vec_punc == 1) = llr;
        [u,x,~, ~] = polarSCLIte(vec_punc, iMap, pm_prev, L);
    case 47
        vec_punc = punc_type2(N);
        vec_punc(vec_punc == 1) = llr;
        [u,x,~, ~] = polarSCLIte(vec_punc, iMap, pm_prev, L);
    otherwise
        disp('undefine');
end


%%% pick from list with crc
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


%%%======================================================================


%%%%% Iterative function of New type1 SCL decoder
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


%%%%% Iterative function of New type2 SCL decoder
function [u, x, pm, cidx] = type2SCLIte(llr, iMap, pm_prev, L)
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

upper_size = floor(N/2);
lower_size = N - upper_size;
llrU = box_plus(llr(:, 1:upper_size), llr(:, lower_size+1: N));  %%% generate the LLR for the upper SCL decoder
[u1, x1, pm1, cidx1] = type2SCLIte(llrU, iMap(1:upper_size), pm_prev, L); %%% perform upper SCL decoding

llrL = (1- 2 * x1) .* llr(cidx1, 1:upper_size) + llr(cidx1, lower_size+1: N); %%% generate the LLR for the lower SCL decoder
llrL = [llr(cidx1,upper_size+1: lower_size), llrL];

[u2, x2, pm, cidx2] = type2SCLIte(llrL, iMap(upper_size+1: N), pm1, L); %%% perform lower SCL decoding

cidx = cidx1(cidx2);
% x = [xor(x1(cidx2,:), x2), x2];
% x = [xor(x1(cidx2,1:lower_size), x2), x1(cidx2,lower_size+1:end), x2];  %%% generate the partial codewords
x = [xor(x1(cidx2,:), x2(:, lower_size-upper_size+1:end)), x2];
u = [u1(cidx2, :), u2];          %%% concatenate the message candidates

return

%%%%% Iterative function of New type3 SCL decoder
function [u, x, pm, cidx] = type3SCLIte(llr, iMap, pm_prev, L)
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
xor_size = min(upper_size, lower_size);

llrU = box_plus(llr(:, upper_size+1-xor_size:upper_size), llr(:, upper_size+1: N));  %%% generate the LLR for the upper SCL decoder
llrU = [llr(:, 1: upper_size-xor_size), llrU];
[u1, x1, pm1, cidx1] = type3SCLIte(llrU, iMap(1:upper_size), pm_prev, L); %%% perform upper SCL decoding

llrL = (1- 2 * x1(:,upper_size+1-xor_size:upper_size)) .* llr(cidx1, upper_size+1-xor_size:upper_size) + llr(cidx1, upper_size+1: N); %%% generate the LLR for the lower SCL decoder

[u2, x2, pm, cidx2] = type3SCLIte(llrL, iMap(upper_size+1: N), pm1, L); %%% perform lower SCL decoding

cidx = cidx1(cidx2);

x = [x1(cidx2,1:upper_size-xor_size), xor(x1(cidx2,upper_size+1-xor_size:upper_size), x2), x2];  %%% generate the partial codewords
  
u = [u1(cidx2, :), u2];          %%% concatenate the message candidates

return

%%%%% Iterative function of New type4 SCL decoder
function [u, x, pm, cidx] = type4SCLIte(llr, iMap, pm_prev, L)
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

upper_size = floor(N/2);
lower_size = N - upper_size;
xor_size = min(upper_size, lower_size);

llrU = box_plus(llr(:, 1:upper_size), llr(:, upper_size+1: upper_size+xor_size));  %%% generate the LLR for the upper SCL decoder
[u1, x1, pm1, cidx1] = type4SCLIte(llrU, iMap(1:upper_size), pm_prev, L); %%% perform upper SCL decoding

llrL = (1- 2 * x1) .* llr(cidx1, 1:upper_size) + llr(cidx1, upper_size+1: upper_size+xor_size); %%% generate the LLR for the lower SCL decoder
llrL = [llrL, llr(cidx1,upper_size+xor_size+1:end)];

[u2, x2, pm, cidx2] = type4SCLIte(llrL, iMap(upper_size+1: N), pm1, L); %%% perform lower SCL decoding

cidx = cidx1(cidx2);
x = [xor(x1(cidx2,:), x2(:, 1:upper_size)), x2];
u = [u1(cidx2, :), u2];          %%% concatenate the message candidates

return

%%%%% Iterative function of apc SCL decoder
function [u, x, pm, cidx] = apcSCLIte(llr, iMap, pm_prev, L, apcidx)
    N = size(llr, 2);   %% block length
    
    if(length(apcidx) == 1)
        [u,x,pm, cidx] = polarSCLIte(llr, iMap, pm_prev, L);
        assert(size(llr, 2) == apcidx(1));
        return
    end
    upper_size = apcidx(1);
    lower_size = N-upper_size;
    xor_size = min(upper_size, lower_size);
    
    llrU = box_plus(llr(:, 1:xor_size), llr(:, upper_size+1: upper_size+xor_size));  %%% generate the LLR for the upper SCL decoder
    llrU = [llrU, llr(:, xor_size+1:upper_size)];
    assert(size(llrU, 2) == upper_size);
    [u1, x1, pm1, cidx1] = polarSCLIte(llrU, iMap(1:upper_size), pm_prev, L); %%% perform upper SCL decoding
    

    llrL = (1- 2 * x1(:, 1:xor_size)) .* llr(cidx1, 1:xor_size) + llr(cidx1, upper_size+1: upper_size+xor_size); %%% generate the LLR for the lower SCL decoder
    llrL = [llrL, llr(cidx1 ,upper_size+xor_size+1: end)];
    
    assert(size(llrL, 2) == lower_size);
    [u2, x2, pm, cidx2] = apcSCLIte(llrL, iMap(upper_size+1: N), pm1, L, apcidx(2:end)); %%% perform lower SCL decoding
    
    cidx = cidx1(cidx2);
    x = [xor(x1(cidx2,:), [x2(:,1:xor_size),zeros(size(x2,1), upper_size - xor_size)] ), x2];  %%% generate the partial codewords
    u = [u1(cidx2, :), u2];          %%% concatenate the message candidates
return


%%%%% Iterative function of SCL decoder
function [u, x, pm, cidx] = polarSCLIte(llr, iMap, pm_prev, L)
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

[u1, x1, pm1, cidx1] = polarSCLIte(llrU, iMap(1:N/2), pm_prev, L); %%% perform upper SCL decoding

llrL = (1- 2 * x1) .* llr(cidx1, 1:N/2) + llr(cidx1, N/2+1: N); %%% generate the LLR for the lower SCL decoder

[u2, x2, pm, cidx2] = polarSCLIte(llrL, iMap(N/2+1: N), pm1, L); %%% perform lower SCL decoding

cidx = cidx1(cidx2);
x = [xor(x1(cidx2,:), x2), x2];  %%% generate the partial codewords
u = [u1(cidx2, :), u2];          %%% concatenate the message candidates

return


%%%%% Iterative function of SCL decoder sss
function [u, x, pm, cidx] = ssspolarSCLIte(llr, iMap, pm_prev, L)
N = size(llr, 3);   %% block length
list_len = size(llr,2);   %% number of the input candidates 
batch = size(llr,1);
input_idx = 1: list_len;
if(N == 1)
    if(iMap(1) == 1)
        list_len_tmp = 2*list_len;  %%% double the list size
        tmp_i = 1:list_len_tmp;
        tmp_i = ones(batch,1)*tmp_i;
        i = ceil(tmp_i/2);
        m_vector = mod(tmp_i-1, 2);

        pm_tmp(: ,tmp_i) = pm_prev(: ,i) - maxStar((2*m_vector-1) .* llr(i, 1));
        idx_with_pm_tmp(tmp_i) = i;
        x_with_pm_tmp(tmp_i,1) = m_vector;
    else
        list_len_tmp = list_len;  %%% same number of list size
        i = 1: list_len_tmp;
        i = ones(batch,1)*i;
 
        pm_tmp = pm_prev(i) - maxStar((-1) .* llr(i, 1));

        idx_with_pm_tmp(i) = input_idx(i);
        x_with_pm_tmp(i,1) = 0;
    end

    [~ , sorted_idx] = sort(pm_tmp, 2,'descend'); %%% sorting the path metric

    output_list_len = min(list_len_tmp, L);
    x(:,1) = x_with_pm_tmp(sorted_idx(:,1:output_list_len),1); %%% retain the bits of the best metrics
    u = x;
    pm = pm_tmp(:,sorted_idx(1: output_list_len));  %%% retain the path metric 
    size_pm = size(pm)
    cidx = idx_with_pm_tmp(sorted_idx(:,1: output_list_len)); %%% retain the indices from previous surviors
    return
end

llrU = box_plus(llr(:,:, 1:N/2), llr(:,:, N/2+1: N));  %%% generate the LLR for the upper SCL decoder
[u1, x1, pm1, cidx1] = ssspolarSCLIte(llrU, iMap(1:N/2), pm_prev, L); %%% perform upper SCL decoding
N
size_llr = size(llr)
size_llrU = size(llrU)
size_x1 = size(x1)
size_pm1 = size(pm1)
size_cidx1 = size(cidx1)

llrhalf = llr(cidx1,:, 1:N/2) 

if size(llr, 3) == 2
    llrL = zeros(10,1,1);
%     llrL(,:) = (1- 2 * x1(:,:,:)) .* llr(cidx1(:,:), 1:N/2) + llr(cidx1(:,:), N/2+1: N); %%% generate the LLR for the lower SCL decoder
else
    llrL = (1- 2 * x1(:,:,:)) .* llr(:,cidx1, 1:N/2) + llr(:, cidx1, N/2+1: N); %%% generate the LLR for the lower SCL decoder
end
sizellrL = size(llrL)

[u2, x2, pm, cidx2] = ssspolarSCLIte(llrL, iMap(N/2+1: N), pm1, L); %%% perform lower SCL decoding

cidx = cidx1(cidx2);
x = [cat(3,xor(x1(cidx2,:), x2), x2)];  %%% generate the partial codewords
u = [cat(3, u1(cidx2, :), u2)];          %%% concatenate the message candidates

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