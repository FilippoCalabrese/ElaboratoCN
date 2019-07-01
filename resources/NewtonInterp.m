function y = NewtonInterp(xi,fi,x)
%
%   y = newton(xi,fi,x) Calcolo il polinomio
%                       interpolante le coppie (xi,fi)
%                       nelle ascisse x
n=length(xi);
if length (fi)~= n, error('dati inconsistenti'); end
for i=1:n-1
    for j=i+1:n
        if xi(i)==xi(j),error('ascisse non distinte');
        end
    end
end
f=dividif(xi,fi);
y=f(n);
for i=n-1:-1:1
    y=y.*(x-xi(i))+f(i);
end
return    