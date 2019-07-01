function [x,i] = bisezione(fun,a,b,tolx)
%   x=bisezione(fun,a,b,tolx)
%   parametri in ingresso
%   fun -> funzione in cui si effettua la ricerca degli zeri
%   a,b -> estremi dell'intervallo di ricerca
%   tolx -> parametro che indica la tolleranza su x
%   valori di ritorno
%   x -> radice della funzione
%   i -> numero di iterazioni
%   il metodo di bisezione restituisce la radice di una funzione fun in
%   un intervallo [a,b] ed il numero di iterazioni effettuate
if a>b, error('intervallo non valido'),end
fa=feval(fun,a);
fb=feval(fun,b);
if fa*fb>0,error('nessuan radice in [a,b]'),end
if fa==0,x=a;return; elseif fb==0,x=b;return, end
nmax = ceil (log2((b-a)/tolx));
for i=1:nmax
    df=abs((fb-fa)/(b-a));
    x=(a+b)/2; fx=feval(fun,x);
    if abs(fx)<=df*(1+ abs(x))*tolx,return;
    elseif fa*fx<0
        b=x;
        fb=fx;
    else
           a=x;
           fa=fx;
    end
end
return