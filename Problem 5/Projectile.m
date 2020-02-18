function [x,t] = Projectile(vi,viunit,a)
% Uses initial velocity and launch angle of a projectile to calculate the
% range and time of flight.

% define function contraints
if a <=0 | a >= 0
    error("angle must be between 0 and 90 degrees")
end

if ~isnumeric(vi)
    error("velocity must be a number")
end

if ~isnumeric(a)
    error("angle must be a number")
end

% convert units to m/s
if viunit == mph
    vinew = (vi/2.237);
elseif viunit == m/s
    vinew = vi;
end

% find components of initial velocity
vix = vinew*cos(a);
viy = vinew*sin(a);

% define gravity constant
g = 9.81;

% calculate range of flight

end


