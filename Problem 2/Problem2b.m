% input number and unit
str = input('Input time in seconds (s), minutes (m), hours (h), or days (d)' , 's');

% Not sure how to do this since the input is now a string instead of just a
% number
% reject non-numeric values
%if ~isnumeric(str)
  % error("input must be a number with unit")
%end

% split the number from the unit
newStr = split(str);
% extract the number
numb = newStr{1};
% convert the string to a number
time = str2num(numb);

% extract the unit
unit = newStr{2};
% differentiate between units and convert to seconds
if unit == 's'
    T = time
elseif unit == 'm'
    T = time*60;
elseif unit == 'h'
    T = time*3600;
elseif unit == 'd'
    T = time*86400;
end

% define constants: earth's radius, G, earth's mass
R = 6.371E6;
G = 6.67E-11;
M = 5.98E24;

% calculate height in meters
h = (G*M*T^2/(4*pi^2))^(1/3)-R; 
% calculate height in km
x = h/1000; 

% reject the value for x if it is <0
if x<0
     error("altitude can't be less than 0")
end
    
% calculate velocity in m/s
v = ((G * M)/ (h + R))^(1/2);
% calculate velocity in km/s
v = v/1000;

% round answers
xr = round(x);
vr = round(v);

% display answers
disp('The height in km is')
disp(xr)
disp('The velocity in km/s is')
disp(vr)