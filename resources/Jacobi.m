function y = Jacobi(x,A)
% y = Jacobi(x,A)
% parametri
% x -> colonna vettore dei termini noti
% A -> matrice nxn
% funzione per la risoluzione tramite Jacobi del sistema 
D=diag(A);
y=x./D;
return