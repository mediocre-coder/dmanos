function[hmax,range,time,traj] = projprojectile(hi,vi,angi)
% accepts inputs of initial height in m, initial velocity in m/s, and
% initial angle in deg and returns max height, range, time of flight, and a
% graph of trajectory

% define constants
g = 9.81;
rho = 2.225; % air density from Google
C = .1; % drag coeffecient of a sphere from Google
A = 5; % randomly decided number
m = 5; % randomly decided number

% calculate drag force coeffecient for use in motion equations
fdrag = (C*rho*A)/(2*m);

% set default values
if nargin == 0
    hi = 10;
    vi = 60;
    angi = 45;
end
    
% error messages for invalid inputs
if hi < 0
    error('height must be 0 or greater')
end
if vi <= 0
    error('velocity must be greater than 0')
end
if angi <= 0 || angi >= 90
    error('angle must be between 0 and 90 degrees')
end

% calculate components of initial velocity
vix = vi*cosd(angi);
viy = vi*sind(angi);

% create arrays
x = 0;
y = hi;
xarray = [x vix];
yarray = [y viy];

% calculate time and timespan
t = (sqrt(viy^2+2*g*hi)+viy)/g;
timespan = linspace(0, t);

% solve odes
options = odeset('refine', 10);
[xt, xsol] = ode45(@odex,timespan,vix,options,fdrag);
[yt, ysol] = ode45(@odey,timespan,viy,options,fdrag,g);

% make functions that return arrays
    function[dx] = odex(xt,xsol,fdrag)
        dx = [x(2);-fdrag*xsol(2)^2];
    end
    function[dy] = odey(yt,ysol,fdrag,g)
        dy = [y(2);-g-fdrag*ysol(2)^2];
    end

% calculate outputs
ypos = y(y(:,1)>=0);
numypos = numel(ypos);
hmax = max(ypos);
range = x(ynum);
time = yt(numypos);

% graph
xspan = x(1:numypos);
yspan = y(1:numypos);
traj = plot(xspan,yspan);
xlabel('range (m)');
ylabel('height (m)');
title('trajectory of a projectile with drag');

end