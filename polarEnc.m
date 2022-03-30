function x = polarEnc(N, uA, iMap, POLAR_TYPE)
% u = zeros(1, N);
u = zeros(size(iMap));
u(iMap == 1) = uA;

switch POLAR_TYPE
    case 0
%         x = polarEncIte(N, u);
        mx = polarMatrix(N);
        x = mod(u*mx, 2);

    case 1
        x = ipolarEncIte(N, u, 0, 0);
    case 21
        apcidx = power2SumVec(N); %ASC
        x = apcEncIte(N, u, apcidx);
    case 22
        apcidx = power2SumVec(N); %ASC
        apcidx = apcidx(end:-1:1);  %%% DES
        x = apcEncIte(N, u, apcidx);
    case 31
        x = New_type1_EncIte(N, u);
    case 32
        x = New_type2_EncIte(N, u);
    case 33
        x = New_type3_EncIte(N, u);
    case 34
        x = New_type4_EncIte(N, u);
    case 41
        vec_punc = QUP(N);
        x = polarEncIte(size(vec_punc, 2), u);
        x = x(vec_punc == 1);
    case {42, 43, 44}
        N_mom = size(iMap,2);
%         vec_punc = vec_shorten(N);
        x = polarEncIte(N_mom, u);
        x = x(1:N);
    case 45
        vec_punc = QUPwithoutbitreverse(N);
        x = polarEncIte(size(vec_punc, 2), u);
        x = x(vec_punc == 1);
    case 46
        vec_punc = punc_type1(N);
        x = polarEncIte(size(vec_punc, 2), u);
        x = x(vec_punc == 1);
    case 47
        vec_punc = punc_type2(N);
        x = polarEncIte(size(vec_punc, 2), u);
        x = x(vec_punc == 1);
    otherwise
        disp('undefine');
end
return

function x = puncEncIter(N, u, vec_punc)
    if(N == 1)
        x = u;
        return
    end
    
    x1 = puncEncIter(N/2, u(1:N/2), vec_punc(1:N/2));  %%% upper encoder
    x2 = puncEncIter(N/2, u(N/2+1: N), vec_punc(N/2+1: N));  %%% lower encoder
    
    x = [xor(x1, x2), x2];
    x(vec_punc == 0) = 0;
return

function x = New_type1_EncIte(N, u)
    if(N == 1)
        x = u;
        return
    end
    % upper bigger
    size_upper = ceil(N/2);
    size_lower = N - size_upper;
    
    x1 = New_type1_EncIte(size_upper, u(1:size_upper));  %%% upper encoder
    x2 = New_type1_EncIte(size_lower, u(size_upper+1: N));  %%% lower encoder
    % upper bigger
    x = [xor(x1(1:size_lower), x2), x1(size_lower+1:end), x2];
return

function x = New_type2_EncIte(N, u)
    if(N == 1)
        x = u;
        return
    end
    % upper smaller
    size_upper = floor(N/2);
    size_lower = N - size_upper;
    
    x1 = New_type2_EncIte(size_upper, u(1:size_upper));  %%% upper encoder
    x2 = New_type2_EncIte(size_lower, u(size_upper+1: N));  %%% lower encoder
    % upper smaller
    x = [xor(x1, x2(size_lower-size_upper+1:end)), x2];
return

function x = New_type3_EncIte(N, u)
    if(N == 1)
        x = u;
        return
    end
    % upper bigger
    size_upper = ceil(N/2);
    size_lower = N - size_upper;
    size_xor = min(size_upper, size_lower);
    
    x1 = New_type3_EncIte(size_upper, u(1:size_upper));  %%% upper encoder
    x2 = New_type3_EncIte(size_lower, u(size_upper+1: N));  %%% lower encoder
    % upper bigger
    x = [x1(1:size_upper-size_xor), xor(x1(size_upper+1-size_xor:size_upper), x2), x2];
return

function x = New_type4_EncIte(N, u)
    if(N == 1)
        x = u;
        return
    end
    % upper smaller
    size_upper = floor(N/2);
    size_lower = N - size_upper;
    size_xor = min(size_upper, size_lower);
    
    x1 = New_type4_EncIte(size_upper, u(1:size_upper));  %%% upper encoder
    x2 = New_type4_EncIte(size_lower, u(size_upper+1: N));  %%% lower encoder
    % upper smaller
    x = [xor(x1, x2(1:size_xor)), x2];
return


%%% general
function x = apcEncIte(N, u, apcidx)
    if(length(apcidx) == 1)
        assert(N == apcidx(1), "size dismatch");
        x = polarEncIte(N, u);
        return
    elseif(length(apcidx) > 1) 
        upper_size = apcidx(1);
        lower_size = N-upper_size;
        x1 = polarEncIte(upper_size, u(1:upper_size));  %%% upper encoder
        x2 = apcEncIte(lower_size, u(upper_size+1: end), apcidx(2:end));  %%% lower encoder
        xor_size = min(upper_size, lower_size);
        x = [xor(x1, [x2(1:xor_size),zeros(1, upper_size - xor_size)] ), x2];
    end
return



function x = polarEncIte(N, u)
    if(N == 1)
        x = u;
        return
    end
    
    x1 = polarEncIte(N/2, u(1:N/2));  %%% upper encoder
    x2 = polarEncIte(N/2, u(N/2+1: N));  %%% lower encoder
    
    x = [xor(x1, x2), x2];
return


function x = ipolarEncIte(N, u, intIdx, level)
    global ipolarInt; 
    if(N == 1)
        x = u;
        return
    end
    PI = ipolarInt{level+1}(intIdx+1, :);
    x1 = ipolarEncIte(N/2, u(1:N/2), intIdx*2, level+1);  %%% upper encoder
    x2 = ipolarEncIte(N/2, u(N/2+1: N), intIdx*2+1, level+1);  %%% lower encoder
    x1(PI) = x1;
    x = [xor(x1, x2), x2];
return