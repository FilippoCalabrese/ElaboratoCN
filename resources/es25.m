tol=10e-10;
j=1;
res = zeros (1,50) ;
iter = zeros (1,50) ;
for N = 10:10:500
    B = -1* ones (N ,5);
    B (: ,3) = B (: ,3) *( -4);
    A = spdiags (B , [-9 -1 0 1 9] , N, N);
    [l1 , x1 , k] = potenzecount (A, tol);
    res (1,j) = l1;
    iter (1,j) = k;
    j = j+1;
end
figure
semilogy (10:10:500 , res (:));
legend('Autovalore dominante');
figure
semilogy (10:10:500 , iter (:));
legend('Iterazioni effettuate');