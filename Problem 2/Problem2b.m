% input
T = input('Input time in minutes');

% reject non-numeric values
if ~isnumeric(T)
    error("input must be a number")
end

% define constants: earth's radius, G, earth's mass
R = 6.371E6;
G = 6.67E-11;
M = 5.98E24;

% convert to seconds
T = T*60;

% calculate height in meters
h = (G*M*T^2/(4*pi^2))^(1/3)-R; 
% calculate height in km
x = h/1000; 

% calculate velocity in m/s
v = ((G * M)/ (h + R))^(1/2);
% calculate velocity in km/s
v = v/1000;

% round answers
xr = round(x)
vr = round(v)