function V = vandermonde(xi, m)
% V = vander(xi, m)
% xi: ascisse
% m: grado
% Genera una matrice di Vandermonde
V = zeros(length(xi) , m+1);
for i = 1 : m+1
  V(:, i) = xi.^(i-1);
end
disp(V);
return
