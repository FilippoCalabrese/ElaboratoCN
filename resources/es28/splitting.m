function [x, i]=splitting(b, matvec, msolve, tol)
%   [m,i]=splitting(b, matvec, msolve, tol)
%   parametri in ingresso
%   b -> vettore dei termini noti
%   matvec -> funzione per creare la matrice ad-hoc per esercizio 25
%   msolve -> funzione per risolvere il sistema lineare
%   tol -> tolleranza desiderata
%   Funzione per la risoluzione ad-hoc di un sistema lineare con splitting di
%   Jacobi o Gauss-Seidel
n = length(b);
itmax = ceil(-log10(tol))*(n*n);
x=zeros(n,1);
tolb=tol*norm(b,inf);
for i=1:itmax
    r=matvec(x)-b;
    nr=norm(r,inf);
    if nr <= tolb
        break;
    end
    u=msolve(r);
    x=x-u;
end
if nr>tolb
    fprintf('Convergenza non raggiunta'); end
return