function b = miniSquare(xi, yi)
% 
% b= miniSquare(xi, yi);
% xi: punti di misurazione
% yi: misurazioni
% Restituisce le norma al quadrato del vettore residuo con grado da 1 a n
%
b=zeros(10,1);
for m = 1 : 10
  V §= vandermonde(xi, m);
  QR = myqr(V);
  a = qrsolve2(QR,yi');
  resid=(V*a) - yi';
  b(m,1) = norm(resid,2)^2;
end
return
