function ipolarInt = interLeaverGenFix(M)

%interleaverFileName = sprintf('interLeaver_%d.mat', M);

%if(exist(interleaverFileName,'file') == 2)
%    fprintf(1,'load interleaver for N = %d\n', 2^M);
%    load(interleaverFileName);
%else
%    fprintf(1,'Genarate new interleaver for N = %d\n', 2^M);
for i = 1: M
    %if(i == 1)
    %    ipolarInt{i}(1, :) = randperm(2^(M-i)); %2^(M-i): -1: 1;
       
    %else
        for j = 0: 2^(i-1)-1
%             x = floor(rand(1,1)*2);
%             if(x == 1)
%                 ipolarInt{i}(j+1, :) = 1: 2^(M-i);
%             else
%                 ipolarInt{i}(j+1, :) = 2^(M-i):-1:1;
%             end
            a = floor(rand(1,1)*2^(M-i));
            while(gcd(a, 2^(M-i))~=1)
                a = floor(rand(1,1)*(2^(M-i)));
            end
            ipolarInt{i}(j+1, :) = coPrimeInt(a, 2^(M-i));
            %ipolarInt{i}(j+1, :) = mod((0:2^(M-i)-1)+floor(rand(1,1)*2^(M-i)), 2^(M-i)) + 1; %randperm(2^(M-i));
            %ipolarInt{i}(j+1, :) = randperm(2^(M-i)); %mod((0: 2^(M-i)-1)+floor(rand(1,1)*2^(M-i)), 2^(M-i)) + 1;
        end
    %end
end
%    save(interleaverFileName,'ipolarInt');
%end
%return