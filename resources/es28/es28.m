tol = 10^ -8;
iter = zeros (50 , 3);
for n = 10:10:500
b = ones (n ,1);
iter(n /10 ,1) = n;
[x,i] = splitting (b , @matvec , @jacobi , tol );
iter(n /10 ,2) = i;
[x,i] = splitting (b , @matvec , @gaussSeidel ,tol  );
iter(n /10 ,3) = i;
end
figure
semilogy ((10:10:500) , iter (: ,2));
legend('Jacobi iteractions');
figure
semilogy ((10:10:500) , iter(: ,3));
legend('GaussSeidel iteractions');
