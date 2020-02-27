function [pT,pg] = planet(m,r,a)
% takes a planet's mass (in Earth masses), radius (in Earth radii), and
% planet's orbital radius (in AU) and returns the planet's orbital
% period (in Earth years) and the planet's g (in terms of Earth's g).

% calculate orbital period in Earth years
pT = a^3;

% calculate g in terms of Earth's g
pg = m/(r^2);

end

