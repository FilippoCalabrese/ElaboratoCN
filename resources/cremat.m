function [A,b] = cremat(n,k,simme)
%
%  [A,b] = cremat(n,k,simme)  Crea una matrice A nxn ed un termine noto b,
%                             in modo che la soluzione del sistema lineare 
%                             A*x=b sia x = [1,2,...,n]^T.
%                             k non ve lo dico a cosa serve.
%                             simme, se specificato, crea una matrice
%                             simmetrica e definita positiva.
%
if nargin==1
    sigma = 1/n; 
else    
    sigma = 10^(-k);
end    
rng(0);
[q1,r1] = qr(rand(n));
if nargin==3
    q2 = q1';
else    
    [q2,r1] = qr(rand(n));
end    
A = q1*diag([sigma 2/n:1/n:1])*q2;
x = [1:n]';
b = A*x;
return