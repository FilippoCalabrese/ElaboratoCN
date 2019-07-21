b = 5; a = -5;
x = a : (b-a)/10000 : b;
f = @(x) 1./(1 + x.^2);
valEffett = feval(f,x);

E = zeros(20, 3);
E(:,1) = 2:2:40; 

for n = 2 : 2 : 40
	xEq = a : (b-a)/n : b;
	xCh = (a+b)/2 + ((b-a)/2)*cos(((2*(n:-1:0))+1)*pi/((2*n)+2));
	xCh(1) = floor(xCh(1));
	xCh(end) = ceil(xCh(end));

	equid = splineCubica(xEq,feval(f,xEq),x,0);
	chebysh = splineCubica(xCh,feval(f,xCh),x,0);

	E(n/2, 2) = max(abs(valEffett(1:end)-equid(1:end)));
	E(n/2, 3) = max(abs(valEffett(1:end)-chebysh(1:end)));

end