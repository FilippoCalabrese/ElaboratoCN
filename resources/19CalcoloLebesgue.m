a = 0; b = 20;
x = a : (b-a)/10000 : b;  % genero le ascisse necessarie per il calcolo
lebesgueEq = 1 : 20;   
lebesgueCh = 1 : 20;   
costLeb1=costLeb1'; costLeb2=costLeb2';
for n = 2 : 2 : 40
	
	x1 = a : (b-a)/n : b;
	functLeb1 = 0;
	
	x2 = (a+b)/2 + ((b-a)/2)*cos(((2*(n:-1:0))+1)*pi/((2*n)+2));
	functLeb2 = 0;
	for i = 0:n
		lin1 = 1; lin2 = 1;
		for j = [0:i-1,i+1:n]
			lin1 = lin1 .* (x-x1(j+1))/(x1(i+1)-x1(j+1));
			lin2 = lin2 .* (x-x2(j+1))/(x2(i+1)-x2(j+1));
		end
		functLeb1 = functLeb1 + abs(lin1);
		functLeb2 = functLeb2 + abs(lin2); 
	end
	lebesgueEq(n/2) = max(functLeb1);
	lebesgueCh(n/2) = max(functLeb2);
end
semilogy((2:2:40),lebesgueEq); %grafica per equidistanti
semilogy((2:2:40),lebesgueCh); %grafica per Chebyshev