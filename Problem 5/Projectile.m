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
if a <=0 || a >= 90
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

% calculate time of flight
t = (2*viy)/g;

% calculate range of flight
x = (2*vix*viy)/g;

% graph trajectory of projectile and animate the line
plot(linspace(0,t,10),linspace(0,x,10),'-ok')
xlabel('Time of Flight (s)')
ylabel('Range of Flight (m)')
title('Range vs. Time of a Projectile')
%an = animatedline(linspace(0,t,10),linspace(0,x,10))
% not sure how to animate the line - I've tried a few different things and
% none of them work
end