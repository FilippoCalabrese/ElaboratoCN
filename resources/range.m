function i = range (xi , xp)
%   i=range (xi , xp)
for i=2:length(xi)
    if xi(i)>=xp
        return;
    end
end
return
