function y = GaussSeidel(x,A)
% y = GaussSeidel(x,A)
% parametri
% x -> colonna vettore dei termini noti
% A -> matrice nxn
% funzione per la risoluzione tramite GaussSeidel del sistema 
n=length(x);
y=x;
for i=1:n
    y(i)=y(i)/A(i,i);
    y(i+1:n)=y(i+1:n)-y(i)*A(i+1:n,i);
end
return