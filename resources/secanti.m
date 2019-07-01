function [x,i]= secanti(f,f1,x0,tol,itmax)
%   x=secanti(f,f1,x0,tol,itmax)
%   parametri in ingresso
%   f -> funzione in cui si effettua la ricerca degli zeri
%   f1 -> derivata della funzione f
%   x0 -> punto di partenza
%   tol -> parametro che indica la tolleranza
%   itmax -> numero massimo di iterazioni
%   valori di ritorno
%   x -> radice della funzione
%   i -> numero di iterazioni
%   il metodo delle secanti restituisce la radice di una funzione f
%   ed il numero di iterazioni effettuate
fx = feval(f,x0);
f1x = feval(f1,x0);
x = x0-fx/f1x;
i = 0;
while (i<itmax) && (abs(x-x0)>=(1+abs(x))*tol)
        i=i+1;
        fx0 = fx;
        fx = feval(f,x);
        x1 = (fx*x0-fx0*x)/(fx-fx0);
        x0 = x;
        x = x1;
end
if abs(x-x0) >= (1+abs(x))*tol 
    error('il metodo non converge')
end
return