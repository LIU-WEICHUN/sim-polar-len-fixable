function ipolarInt = interLeaverReGen(M)

%interleaverFileName = sprintf('interLeaver_%d.mat', M);

%if(exist(interleaverFileName,'file') == 2)
%    fprintf(1,'load interleaver for N = %d\n', 2^M);
%    load(interleaverFileName);
%else
%    fprintf(1,'Genarate new interleaver for N = %d\n', 2^M);
    for i = 1: M
        for j = 0: 2^(i-1)-1
            ipolarInt{i}(j+1, :) = randperm(2^(M-i));
        end
    end
%    save(interleaverFileName,'ipolarInt');
%end
return