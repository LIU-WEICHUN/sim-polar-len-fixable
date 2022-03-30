function c = maxStar(b)
a = zeros(size(b));
c = max(a,b) + log(1+exp(-abs(a-b)));
return