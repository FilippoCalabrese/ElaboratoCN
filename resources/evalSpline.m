function s=evalSpline(ri,qi,xp,xi,m,hi)
% s=evalSpline(ri,qi,xp,xi,m,hi)
n = length (xp);
s = zeros (n ,1)';
for j = 1 : n
    i = range (xi , xp(j));
    s(j) = ( (( xp(j)-xi(i -1) )^3*m(i) + (( xi(i)-xp(j))^3)*m(i -1) )/ ...
    (6* hi(i -1)) ) + qi(i -1) *( xp(j)-xi(i -1) ) + ri(i -1);
end
return