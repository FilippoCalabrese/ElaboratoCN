format long e
f = @(x) sin(x);
f1 = @(x) cos(x);
a=0;
b=pi;
xValutation = linspace(a, b, 10001);
yTrue = feval(f, xValutation);
NewtonResult = [];
HermiteResult = [];
SplineResult = [];
for n = 2 : 50
xi = (0:n) * pi/n;
fi = feval(f, xi);
ff1 = feval(f1, xi);
yNewton = NewtonInterp(xi, fi, xValutation);
yHermite = Hermite(xi, fi,ff1, xValutation);
ySpline = naturalSpline(xi, fi, xValutation);
maxErrorNewton = max(abs(yTrue - yNewton));
maxErrorHermite = max(abs(yTrue - yHermite));
maxErrorSpline = max(abs(yTrue - ySpline));
NewtonResult = [NewtonResult maxErrorNewton];
HermiteResult = [HermiteResult maxErrorHermite];
SplineResult = [SplineResult maxErrorSpline];
end
x = (2:50);
semilogy(x, SplineResult)
hold on
semilogy(x, NewtonResult)
hold on
semilogy(x, HermiteResult)
title('Interpolation max error')
legend('natural Spline','Newton','Hermite')