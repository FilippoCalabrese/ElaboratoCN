function [x,i] = aitken(f, f1, x0, tolx, itmax)
%   x=aitken(f,f1,x0,tol,itmax)
%   parametri in ingresso
%   f -> funzione in cui si effettua la ricerca degli zeri
%   f1 -> derivata della funzione f
%   x0 -> punto di partenza
%   tolx -> parametro che indica la tolleranza
%   itmax -> numero massimo di iterazioni
%   valori di ritorno
%   x -> radice della funzione
%   i -> numero di iterazioni
%   il metodo di aitken restituisce la radice di una funzione f
%   ed il numero di iterazioni effettuate
i=0;
x=x0;
vai=1;
while(i<itmax) && vai
    i=i+1;
    x0=x;
    fx=feval(f,x0);
    f1x=feval(f1,x0);
    x1=x0-fx/f1x;
    fx=feval(f,x1);
    f1x=feval(f1,x1);
    x=x1-fx/f1x;
    x=(x*x0-x1^2)/(x-2*x1+x0);
    vai = abs(x-x0)>tolx*(1+abs(x));
end
if vai, error('il metodo non converge'),end
return