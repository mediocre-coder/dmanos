function [x,t] = Projectile(vi,viunit,a,h)
% Uses initial velocity, launch angle, and height of a projectile to 
% calculate the range and time of flight. Initial velocity can be entered 
% in mph or m/s, launch angle is entered in degrees, and height is entered 
% in meters.

% set default values
if nargin == 0
    vi = 60;
    viunit = 'm/s';
    a = 45;
    h = 10;
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

% calculate time of flight
%%% tried using the mathematica notebook equations but then it didn't work
%%% for h == 0 :(
if h == 0
   %t = viy/(-g) + sqrt((viy)^2/g^2 + 2*(h/(-g)));
   t = 2*(0-viy)/(-g);
else
    %%% can't really figure out what's going on here - it's only plotting
    %%% the trajectory to the original height, not to zero - when I try to
    %%% fix it it plots negative height which is obvously wrong too
    tup = 2*(0-viy)/(-g);
    mh = viy*tup+(.5*(-g))*tup^2;
    disttoground = mh + h;
    tdown = sqrt(disttoground/(.5*(g)));
    t = tup + tdown;
end
% calculate range of flight
x = vix*t;

% graph trajectory of projectile and animate the line
clf
l = animatedline;
time = linspace(0,t);
height = (viy.*time) - (1/2).*g.*(time.^2) + h;
range = vix.*time;
xlabel('Range (m)')
ylabel('Height (m)')
title('Trajectory of a Projectile')
for k = 1:length(height)
    addpoints(l,range(k),height(k));
    drawnow
end
end