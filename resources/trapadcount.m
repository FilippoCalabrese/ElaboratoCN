function [I2,punti] = trapadcount(fun,a,b,tol,fa,fb)
% I2 = trapadcount(fun,a,b,tol,fa,fb)
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
    count=0;
    if nargin==3
        tol=1e-5;
    end
end
count=count+1;
f1=feval(fun,x1);
h=(b-a)/2;
I1=h*(fa+fb);
I2=I1/2+h*f1;
err=abs(I2-I1)/3;
if err>tol
    I2=trapadcount(fun,a,x1,tol/2,fa,f1)+...
        +trapadcount(fun,x1,b,tol/2,f1,fb);
end
punti=count+2;
return