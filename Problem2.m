% input
T = 85;
% define constants: earth's radius, G, earth's mass
R = 6.371E6;
G = 6.67E-11;
M = 5.98E24;

T = T*60; % convert to seconds
h = (G*M*T^2/(4*pi^2))^(1/3)-R; % height in meters
h = h/1000 % height in km