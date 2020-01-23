% input
T = 45;
% define constants: earth's radius, G, earth's mass
R = 6.371E6;
G = 6.67E-11;
M = 5.98E24;

T = T*60; % convert to seconds
h = (G*M*T^2/(4*pi^2))^(1/3)-R; % height in meters
h = h/1000 % height in km

% Questions

% Q1: The result when plugging in 45 minutes doesn't make sense because it
% is negative, and altitude cannot be negative. To modify the program so
% that you don't have to continuously change the numbers, a loop can be
% used that calculates the altitudes for a set of various times. 

% Q2: A solar day is how long it takes the Earth to rotate so that the sun
% appears in the same position in the sky. A sidereal day is the time it
% takes for the Earth to rotate once about its axis with respect to fixed
% stars. A geosynchronous satellite orbits the Earth once per sidereal day,
% so that it precisely matches the Earth's rotation. 
