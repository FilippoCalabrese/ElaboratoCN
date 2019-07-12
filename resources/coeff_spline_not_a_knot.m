function coeff = coeff_spline_not_a_knot(xi, fi)
% coeff = coeff_spline_not_a_knot(xi, fi)
%   La funzione calcola i coefficienti da applicare all'espressione della 
%   spline cubica not-a-knot
% Input:
%   xi = ascisse di interpolazione
%   fi = ordinate di interpolazione
% OUTPUT:
%   coeff = coefficienti per calcolare l'espressione della spline not-a-knot
    n = length(xi)-1;
    hi = xi(2) - xi(1);
    hi1 = xi(3) - xi(2);
    phi(1) = hi / (hi + hi1);
    zi(1) = hi1 / (hi + hi1);
    diffDiv(1) = diff_div(xi(1 : 3), fi(1 : 3));
    for i = 2 : n - 1 
        hi = xi(i) - xi(i - 1);
        hi1 = xi(i + 1) - xi(i);
        phi(i) = hi / (hi + hi1);
        zi(i) = hi1 / (hi + hi1);
        diffDiv(i) = diff_div(xi(i - 1 : i + 1), fi(i - 1 : i + 1));
    end
    diffDiv(i + 1) = differenzeDivise(xi(i : i + 2), fi(i : i + 2));
    diffDiv = [6 * diffDiv(1), 6 * diffDiv, 6 * diffDiv(end)];
    u(1) = 1;
    w(1) = 0;
    l(1) = phi(1) / u(1);
    u(2) = 2 - phi(1);
    w(2) = zi(1) - phi(1);
    l(2) = phi(2) / u(2);
    u(3) = 2 - l(2) * w(2);
    for i = 4 : n - 1
        w(i - 1) = zi(i - 2);
        l(i - 1) = phi(i - 1) / u(i - 1);
        u(i) = 2 - l(i - 1) * w(i - 1);
    end
    w(n - 1) = zi(n - 2);
    l(n) = (phi(n - 1) - zi(n - 1)) / u(n - 1);
    u(n) = 2 - zi(n - 1) - l(n) * w(n - 1);
    w(n) = zi(n - 1);
    l(n+1) = 0;
    u(n+1) = 1;
    y(1) = diffDiv(1);
    for i = 2 : n + 1
        y(i) = diffDiv(i) - l(i - 1) * y(i - 1);
    end
    coeff = zeros(n + 1, 1); 
    coeff(n + 1) = y(n + 1) / u(n + 1);
    for i = n : - 1 : 1
        coeff(i) = (y(i) - w(i) * coeff(i + 1)) / u(i);
    end
    coeff(1) = coeff(1) - coeff(2) - coeff(3);
    coeff(end)= coeff(n + 1) - coeff(n) - coeff(n - 1);
end

 