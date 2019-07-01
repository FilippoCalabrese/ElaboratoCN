function f = dividifH(f,x)
%   f=dividifH(f,x)
%   calcola le differenze divise secondo il
%   polinomio interpolante di Hermite
n=length(x)-1;
for i=n:-2:3
    f(i)=(f(i)-f(i-2))/(x(i)-x(i-1));
end
for j=2:n
    for i=n+1:-1:j+1
        f(i)=(f(i)-f(i-1))/(x(i)-x(i-j));
    end
end
return

