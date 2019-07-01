function QR=myqr(A)
% QR=myqr(A)
% parametri 
% A -> matrice da fattorizzare QR
% funzione che fattorizza QR una matrice A
QR=A;
[m,n]=size(QR);
if m<n,error('il numero di righe è minore del numero di colonne'),end
for i=1:n
    alfa=norm(QR(i:m,i));
    if alfa==0,error('la matrice A non ha rango massimo'),end
    if QR(i,i)>=0, alfa=-alfa;end
    v1 = QR(i,i)-alfa;
    QR(i,i)=alfa;
    QR(i+1:m,i)=QR(i+1:m,i)/v1;
    beta = -v1/alfa;
    QR(i:m,i+1:n)=QR(i:m,i+1:n)-(beta*[1;QR(i+1:m,i)])*...
        ([1;QR(i+1:m,i)]'*QR(i:m,i+1:n));
end
return