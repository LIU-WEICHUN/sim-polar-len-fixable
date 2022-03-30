function x = NEW_polarEnc(N, uA, iMap, POLAR_TYPE)
u = zeros(1, N);
u(iMap == 1) = uA;
if(POLAR_TYPE == 0)
    x = spcEncIte(N, u);
else
    x = ipolarEncIte(N, u, 0, 0);
end
return

function x = spcEncIte(N, u)
    if(N == 1)
        x = u;
        return
    end
    % upper bigger
    size_upper = ceil(N/2);
    size_lower = N - size_upper;
    
    x1 = spcEncIte(size_upper, u(1:size_upper));  %%% upper encoder
    x2 = spcEncIte(size_lower, u(size_upper+1: N));  %%% lower encoder
    % upper bigger
    x = [xor(x1(1:size_lower), x2), x1(size_lower+1:end), x2];
return


%%% haven't change the ipolar code for scp
% function x = ipolarEncIte(N, u, intIdx, level)
%     global ipolarInt; 
%     if(N == 1)
%         x = u;
%         return
%     end
%     PI = ipolarInt{level+1}(intIdx+1, :);
%     x1 = ipolarEncIte(N/2, u(1:N/2), intIdx*2, level+1);  %%% upper encoder
%     x2 = ipolarEncIte(N/2, u(N/2+1: N), intIdx*2+1, level+1);  %%% lower encoder
%     x1(PI) = x1;
%     x = [xor(x1, x2), x2];
% return