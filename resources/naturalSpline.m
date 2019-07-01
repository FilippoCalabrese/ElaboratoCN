function s = naturalSpline(x,y,xp)
%   s = naturalSpline(x,y,xp)
%   funzione per valutare le ascisse tramite spline naturale
%   parametri
%   x-> ascisse di interpolazione
%   y-> valori della funzione in x
%   xp-> punti di interpolazione
n=length(x);
hi=x(2:n) - x(1:n -1);
divdif=(y(2:n)-y(1:n-1))./hi;
divdif=6*((divdif(2: end) - divdif(1: end -1))./(x(3: end )-x(1: end -2)));
sub=(hi(2:end-1))./(hi(1: end -2)+hi(2: end -1));
sup=(hi(2: end -1))./(hi(2: end -1)+hi(3: end));
m=tridiag(sub,sup,divdif);
m = [0,m,0];
ri = zeros (1, n);
qi = zeros (1, n);
for i = 2:n
	ri(i -1) = y(i -1) - (( hi(i -1) ^2) /6) * m(i -1);
    qi(i -1) =(y(i)-y(i -1))/ hi(i -1) - (hi(i -1) /6) * (m(i) - m(i -1));
end
s=evalSpline(ri,qi,xp,x,m,hi);
return