function [x,t] = Projectile(vi,viunit,a,h)
% Uses initial velocity, launch angle, and height of a projectile to calculate the
% range and time of flight. Initial velocity can be entered in mph or m/s,
% launch angle is entered in degrees, and height is entered in meters.

% set default values
if nargin == 0
    vi = 60;
    viunit = 'm/s';
    a = 45;
    h = 0;
end

% define function contraints
if a <= 0 || a >= 90
    error("angle must be between 0 and 90 degrees")
end

if ~isnumeric(vi)
    error("velocity must be a number")
end

if ~isnumeric(a)
    error("angle must be a number")
end

% convert units to m/s
if viunit == 'mph'
    vinew = (vi/2.237);
elseif viunit == 'm/s'
    vinew = vi;
end

% find components of initial velocity
vix = vinew*cosd(a);
viy = vinew*sind(a);

% define gravity constant
g = 9.81;

% calculate max height of flight
mh = (2*((viy)^2)/g) + h;

% calculate time of flight
t = (sqrt(2*mh/g)) + sqrt(2*h/g);

% calculate range of flight
x = vix*t;

% graph trajectory of projectile and animate the line
% thank you Vivian for this code!
time = linspace(0,t);
height = (viy.*time) - (1/2).*g.*(time.^2) + h;
range = vix.*time;
animatedline(range,height)
xlabel('Range (m)')
ylabel('Height (m)')
title('Trajectory of a Projectile')
% the points are plotting correctly, but the line still won't animate 
end