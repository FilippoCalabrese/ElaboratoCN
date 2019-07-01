function f=dividif(xi,fi)
%
% f=dividif(xi,fi)  funzione che calcola 
%                   le differenze divise
%
n=length(xi);
f=fi;
for i=1:n-1
    for j=n:-1:i+1
        f(j)=(f(j)-f(j-1))/(xi(j)-xi(j-i));
    end
end
return