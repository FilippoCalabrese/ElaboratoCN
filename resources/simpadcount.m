function [I2,punti] = simpadcount(fun,a,b,tol,fa,fb,f1)
% I2 = simpadcount(fun,a,b,tol,fa,fb)
% parametri
% fun->funzione
% a,b->intervallo
% tol->tolleranza
% calcola un' approssimazione dell' integrale definito di fun(x) 
% da a a b con tolleranza tol ( default 1e -5).
persistent count;
x1=(a+b)/2;
if nargin<=4
    fa=feval(fun,a);
    fb=feval(fun,b);
    f1=feval(fun,x1);
    count=0;
    if nargin==3
        tol=1e-5;
    end
end
count=count+3;
h=(b-a)/6;
I1=h*(fa+4*f1+fb);
x2=(a+x1)/2;
x3=(x1+b)/2;
f2=feval(fun,x2);
f3=feval(fun,x3);
I2 = 0.5*h*(fa+4*f2+2*f1+4*f3+fb);
err=abs(I2-I1)/15;
if err>tol
    I2=simpadcount(fun,a,x1,tol/2,fa,f1,f2)+...
        +simpadcount(fun,x1,b,tol/2,f1,fb,f3);
end
punti=count+2;
return