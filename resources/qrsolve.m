function x= qrsolve(A,b)
% x=qrsolve(A,b)
% parametri
% A -> Matrice fattorizzata QR
% b -> vettore dei termini noti
% la funzione risolve il sistema lineare Ax=b dove A �
% una matrice fattorizzata QR
[m,n]=size(A);
if m < n
  error ('QR non contiene i dati della fattorizzazione qr.');
end
if m ~= length (b)
  error ('Matrice e vettore dei termini noti non consistenti .');
end
x=b;
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
