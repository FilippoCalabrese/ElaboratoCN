 function [LU, p] = palu(A) 
 % function [LU, p] = palu(A)
 % parametri
 % A -> matrice quadrata non singolare
 % 
 % funzione che, data una matrice n*n, non singolare, la fattorizza in A=LU
 % tramite pivoting parziale. restituisce le informazioni dei fattori
 % memorizzat in A e il vettore che memorizza le permutazioni effettuate
 LU=A;
 [m,n]=size(LU);
 if m~=n, error('matrice non quadrata');end
 p=1:n;
 for i=1:n-1
     [mi,ki]=max(abs(A(i:n,i)));
     if mi==0, error('matrice singolare');end
     ki=ki+i-1;
     if ki>i
         LU([i ki],:)=LU([ki i],:);
         p([i ki])=p([ki i]);
     end
     LU(i+1:n,i)=LU(i+1:n,i)/LU(i,i);
     LU(i+1:n,i+1:n)= LU(i+1:n,i+1:n)-LU(i+1:n,i)*LU(i,i+1:n);
 end
 return