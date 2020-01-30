% Starting point for Problem 4
load('smallperiodictable')

% Questions

% Q1
% Assign a variable to density
d = density;
% Index into d to find elements denser than water
w = d(d>1);
% Find the number of elements
n = numel(w)
% List the elements
a = names(d>1)

% Q2
% Assign a variable to isotopes
i = isotopes;
% Index into i to find elements with > 100 isotopes
o = i(i>100);
% Find the number of elements
u = numel(o)
% List the elements
b = names(i>100)

% Q3
% Assign a variable to discyear
y = discyear;
% Index into y to find elements discovered before 1900
s = y(y<1900);
% Find the number of elements
m = numel(s)
% List the elements
c = names(y<1900)

% Q4
% Assign a variable to atomic weight
t = atomicweight;
% Plot density vs. atomic weight
plot(t,d)
% Add a title and axis labels
title('Density vs. Atomic Weight')
xlabel('Atomic Weight (u)')
ylabel('Density (g/cm^3)')
