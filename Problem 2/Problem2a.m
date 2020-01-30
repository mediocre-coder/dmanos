% input
T = input('Input time in minutes');
% define constants: earth's radius, G, earth's mass
R = 6.371E6;
G = 6.67E-11;
M = 5.98E24;

T = T*60; % convert to seconds
h = (G*M*T^2/(4*pi^2))^(1/3)-R; % calculate height in meters
x = h/1000; % calculate height in km

% calculate velocity in m/s
v = ((G * M)/ (h + R))^(1/2); % update - added parenthesis around (h + R)
% calculate velocity in km/s
v = v/1000;

% round answers
xr = round(x)
vr = round(v)
