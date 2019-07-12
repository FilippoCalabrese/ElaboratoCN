function fi = diff_div(xi, fi)
% f = diff_div(xi, fi)
%   La funzione calcola le differenze divise per il polinomio di Newton
% Input:
%   xi = vettore delle ascisse
%   fi = vettore dei valori della funzione
% Output:
%   fi = vettore delle differenze divise 
    n = length(xi) - 1;
    for j = 1 : n
        for i = n + 1 : - 1 : j + 1
            fi(i) = (fi(i) - fi(i - 1)) / (xi(i) - xi(i - j));
        end
    end
end