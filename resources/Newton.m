function [x,i]= Newton(f,f1,x0,tol,itmax)
%   x=newton(f,f1,x0,tol,itmax)
%   parametri in ingresso
%   f -> funzione in cui si effettua la ricerca degli zeri
%   f1 -> derivata della funzione f
%   x0 -> punto di partenza
%   tol -> parametro che indica la tolleranza
%   itmax -> numero massimo di iterazioni
%   valori di ritorno
%   x -> radice della funzione
%   i -> numero di iterazioni
%   il metodo di newton restituisce la radice di una funzione f
%   ed il numero di iterazioni effettuate
fx = feval(f,x0);
f1x = feval(f1,x0);
x = x0-fx/f1x;
i = 0;
while (i<itmax) && (abs(x-x0)>=(1+abs(x))*tol)
    i = i+1;
    x0 = x;
    fx = feval(f,x0);
    f1x = feval(f1,x0);
    x = x0-fx/f1x;
end
if abs(x-x0) >= (1+abs(x))*tol 
    error('il metodo non converge')
end
return