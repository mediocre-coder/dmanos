
%Input
T =input('Input the bodys orbital period in minutes:  ');
% Define constants: earth radius, G, earth mass
R = 6.371*10^6; 
G = 6.67*10^(-11);
M = 5.98*10^(24);
if ~isnumeric(T)
    error("must be number")
end
T = T*60; % convert to sec
hm = (G*M*T^2/(4*pi^2))^(1/3)-R; % height in meters
vm =  sqrt(G*M./(hm+R));
format bank
hkm = hm/1000 % convert h to km
vkm = vm/1000 % convert v to km/s
