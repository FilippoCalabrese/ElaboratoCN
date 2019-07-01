function [x, i] = NewtonMod(f, df, m, x0, tol, itmax)
%   x=NewtonMod(f,df,m,x0,tol,itmax)
%   parametri in ingresso
%   f -> funzione in cui si effettua la ricerca degli zeri
%   df -> derivata della funzione f
%   m -> molteplicità della radice
%   x0 -> punto di partenza
%   tol -> parametro che indica la tolleranza
%   itmax -> numero massimo di iterazioni
%   valori di ritorno
%   x -> radice della funzione
%   i -> numero di iterazioni
%   il metodo di newton restituisce la radice di una funzione f
%   ed il numero di iterazioni effettuate
i=1;
fx=feval(f,x0);
dfx=feval(df,x0);
x=x0-m*(fx/dfx);
while(i<itmax && abs(x - x0) >= tol*(1+abs(x)))
    i=i+1;
    x0=x;
    fx=feval(f,x0);
    dfx=feval(df,x0);
    x=x0-m*(fx/dfx);
end
if (abs(x - x0) >= tol*(1+abs(x)))
    error('il metodo non converge');
end
return