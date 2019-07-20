function y = matvec (x)
%   y = matvec (x)
%   parametri in ingresso
%   x -> vettore da moltiplicare con la matrice A dell' es 25
%   Metodo che ritorna il prodotto tra la 
%   matrice A dell' es 25 ed il vettore x.
y = x *4;
y(9 : end) = y(9 : end) - x(1 : end - 8);
y(2 : end) = y(2 : end) - x(1 : end - 1);
y(1 : end - 1) = y(1 : end - 1) - x(2 : end);
y(1 : end - 8) = y(1 : end - 8) - x(9 : end);
return