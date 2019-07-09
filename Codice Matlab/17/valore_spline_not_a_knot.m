function val = valore_spline_not_a_knot(xi, fi, mi, x)
% val = valore_spline_not_knot(xi, fi, mi, x)
%   Valuta i punti della spline cubica not-a-knot nei punti assegnati x
% Input:
%   xi = ascisse di interpolazione
%   fi = ordinate di interpolazione
%   mi = coefficienti necessari a calcolare l'espressione della spline
%   x = punti in cui valutare la spline
% Output:
%   val = valutazioni nei punti x della spline
    sort(x);
    val = zeros(length(x), 1);    
    lastIndex = 1;
    k = 2;
    for j = 1 : length(x)
        if x(j) <= xi(k - 1)
            j = j + 1;
        else
            if j ~= lastIndex
                % calcolo la spline relativa al k-1° intervallo
                hi = xi(k) - xi(k-1);
                ri = fi(k - 1) - ((hi^2) / 6) * mi(k - 1);
                qi = (fi(k) - fi(k - 1)) / hi - (hi / 6) * ...
                    (mi(k) - mi(k - 1));
                spline = @(x)(((x - xi(k - 1)).^3) .* mi(k) + ((xi(k) - x).^3)...
                    .* mi(k - 1)) ./ (6 * hi) + qi .* (x - xi(k - 1)) + ri;
                % calcolo le valutazioni della spline
                val(lastIndex : j - 1) = spline(x(lastIndex : j - 1));
                lastIndex = j;
            end
            k = k + 1;
        end
    end
    % valutazione degli ultimi punti
    if j ~= lastIndex
        hi = xi(end) - xi(end - 1);
        ri = fi(end - 1) - ((hi^2) / 6) * mi(end - 1);
        qi = (fi(end) - fi(end-1)) / hi - (hi / 6) * (-mi(end - 1));
        spline = @(x)(((x - xi(end - 1)).^3) .* mi(end) + ((xi(end) - x).^3)...
            .* mi(end - 1)) ./ (6 * hi) + qi .* (x - xi(end - 1)) + ri;
        val(lastIndex : j - 1) = spline(x(lastIndex : j - 1));
    end
end
