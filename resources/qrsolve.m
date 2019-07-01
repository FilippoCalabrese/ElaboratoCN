function x= qrsolve(A,b)
% x=qrsolve(A,b)
% parametri
% A -> Matrice fattorizzata QR
% b -> vettore dei termini noti
% la funzione risolve il sistema lineare Ax=b dove A è
% una matrice fattorizzata QR
[m,n]=size(A);
x=b;
if length(b)~=m,error('dati inconsistenti');end
for i=1:n
   v=[1; A(i+1:m,i)];
   beta = 2/(v'*v);
   x(i:m)=x(i:m)-(beta*(v'*x(i:m)))*v;
end
x=x(1:n);
for i=n:-1:1
    x(i)=x(i)/A(i,i);
    if i>1
        x(1:i-1)=x(1:i-1)-x(i)*A(1:i-1,i);
    end
end
return
