function [l1,q,k] = potenzecount(A,tol,itmax)
% [f1,q,k] = potenze(A,tol,itmax,u)
% parametri
% A-> matrice
% tol->tolleranza
% itmax-> numero massimo di iterazioni
% funzione che implementa il metodo delle potenze per calcolare
% l'autovalore dominante e il corrispettivo autovettore avendo 
% come vettore di partenza u=(1,...,1)T,
[m,n]=size(A);
if m~=n,error('dati inconsistenti'),end
if nargin<=2
    if nargin<=1
        tol=1e-6;
    else
    if tol>= 0.1 || tol<=0, error('tolleranza non valida');end
    end
    itmax = ceil (- log10 ( tol))*n*n;
end
u = ones(n, 1); 
l1=0;
for k = 1: itmax
    q=u/norm(u);
    u=A*q;
    l0=(q'*u)/(q'*q);
    err=abs(l0-l1);
    l1=l0;
    if err<=tol*(abs(l1)),break,end
end
if err>tol*(abs(l1)),error('convergenza non ottenuta');end
return