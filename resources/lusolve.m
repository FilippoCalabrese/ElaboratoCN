function x = lusolve(LU,p,b)
% x=lusolve(LU,p,b)
% parametri
% LU-> matrice nxn fattorizata LU
% p->vettore delle permutazioni
% b->vettore dei termini noti
% Data una matrice nxn fattorizzata LU,  p vettore delle permutazioni e
% b di lunghezza n, risolve Ax=b, cio� LUx=b Ux=y e Ly=b
[m,n]= size (LU);
lb = length (b);
if m~=n, error ('La matrice LU non e quadrata .'); end
if length (p )~= n
  error ('Vettore di permutazione non consistente con la matrice '); end
if length (b )~= n
  error ('Vettore di permutazione non consistente con la matrice '); end
b=b(p);
x=b(:);
for j=2:n
    x(j:n)=x(j:n)-LU(j:n,j-1)*x(j-1);
end
for j=n:-1:1
    x(j)=x(j)/LU(j,j);
    x(1:j -1) =x(1:j -1) -LU(1:j -1,j)*x(j);
end
return
