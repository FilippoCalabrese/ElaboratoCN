function x = splitting(b,A,Msolve,tol)
% x= splitting(b,A,Msolve,tol)
% parametri
% b -> vettore colonna dei termini noti
% A -> Matrice passata
% Msolve -> funzione di Jocobi o di GaussSaider
% tol -> tolleranza
% la funzione calcola il sistema lineare Ax=b utilizzando un generico 
% splitting che viene passato tramite il parametro Msolve

[n,m]=size(A);
if(n~=m || n~=length(b)),error ('dati inconsistenti'),end
itmax=ceil(-log10(tol))*m;
x=zeros(n,1);
tolb=tol*norm(b,inf);
for i=1:itmax
    r=A*x-b;
    nr=norm(r,inf);
    if nr<=tolb,break,end
    u=Msolve(r,A);
    x=x-u;
end
if nr>tolb, error('tolleranza non raggiunta'),end
return