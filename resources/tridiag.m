function m = tridiag(sub,sup,divdif)
%   m = tridiag(sub,sup,divdif)
%   funzione che restituisce una matrice tridiagonale
n=length(divdif);
l=zeros(1,n);
v=zeros(n);
v(1)=2;
for i = 2:n
    v(i)=2-l(i)*sup(i-1);
    l(i)=sub(i-1)/v(i-1);
end
y=zeros(n);
y(1)=divdif(1);
for j= 2:n
    y(j)=divdif(j)-l(j)*y(j-1);
end
m(n)=y(n)/v(n);
for k = n-1:-1:1
    m(k)=(y(k)-sup(k)*m(k+1))/v(k);
end
return
    