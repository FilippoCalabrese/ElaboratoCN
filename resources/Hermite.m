function y = Hermite(xi,fi,dfi,x)
%
%   y = Hermite(xi,fi,dfi,x) 
%                            Calcolo il polinomio
%                            interpolante le coppie (xi,fi)
%                            nelle ascisse x
n=length(xi);
if length (fi)~= n, error('dati inconsistenti'); end
for i=1:n-1
    for j=i+1:n
        if xi(i)==xi(j),error('ascisse non distinte');
        end
    end
end
fh=zeros(2*n);
xh=zeros(2*n);
for i=1:n
    fh(2*i-1)=fi(i);
    fh(2*i)=dfi(i);
    xh(2*i-1)=xi(i);
    xh(2*i)=xi(i);
end
fh=dividifH(fh,xh);
y=fh(2*n);
for i=2*n-1:-1:1
    y=y.*(x-xh(i))+fh(i);
end
return    
