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
	chebysh = splineCubica(xCh,feval(f,xChxi = [0.010, 0.098, 0.127, 0.278, 0.547, 0.632, 0.815,...
      0.906, 0.913, 0.958, 0.965];
yi = [1.003626, 1.025686, 1.029512, 1.029130, 0.994781,...
      0.990156, 1.016687, 1.057382, 1.061462, 1.091263,...
      1.096476];
err = zeros(11,1);
for n = 1:11
	A = ones(11,n);
	for i = 2:n
		A(1:11,i) = xi(1:11).^(i-1);
	end
	[Q,R] = qr(A);
	g1 = Q'*yi';
	x = zeros(n,1);
	x(1:n)=g1(1:n);

	for i = n: -1:1
		x(i) = x(i)/R(i,i);
		for j = i-1 : -1 : 1
			x(j) = x(j) - (R(j,i)*x(i)); 
		end 
	end
	
	% grado minimo e coefficenti
	if norm(abs((A*x)-yi')) <= 10E-6, n-1, x, break; end

	% per graficare i risultati ottenuti su n
	err(n) = norm(abs((A*x)-yi'));
end
semilogy((1:11),err)),x,0);

	E(n/2, 2) = max(abs(valEffett(1:end)-equid(1:end)));
	E(n/2, 3) = max(abs(valEffett(1:end)-chebysh(1:end)));

end