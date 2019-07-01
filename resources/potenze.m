function [l1,x1] = potenze(A,tol,itmax)
% [f1,x1] = potenze(A,tol,itmax)
% parametri
% A-> matrice
% tol->tolleranza
% itmax-> numero massimo di iterazioni
% funzione che implementa il metodo delle potenze per calcolare
% l'autovalore dominante e il corrispettivo autovettore
[m,n]=size(A);
if m~=n,error('dati inconsistenti'),end
if nargin<=2
    if nargin<=1
        tol=1e-6;
    else
    if tol>= 0.1 || tol<=0, error('tolleranza non valida');end
    end
    itmax = ceil (- log10 ( tol))*n;
end
x = rand(n, 1);
l1=0;
for k = 1: itmax
    x1=x/norm(x);
    x=A*x1;
    l0=l1;
    l1=x'*x1;
    err=abs(l1-l0);
    if err<=tol*(1+abs(l1)),break,end
end
if err>tol*(1+abs(l1)),error('convergenza non ottenuta');end
return