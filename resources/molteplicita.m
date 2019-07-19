function y = molteplicita (fun , x0)
%
% y = molteplicita (fun , x0)
% Funzione che calcola e rende la molteplicita '
% dello zero di funzione (x0) specificato .
%
if feval (fun , x0 )~= 0
    error ('Il valore in x0 deve essere uno zero per la funzione .');
end
syms x;
f1 = fun ;
y = 0;
while ( feval (f1 , x0) == 0)
    f1 = eval ([ '@(x)' char ( diff (f1(x )))]);
    y = y +1;
end
return