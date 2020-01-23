% Import smallperiodictable.txt
T = readtable('smallperiodictable.txt');

% Add variable names
T.Properties.VariableNames = {'atomicnum' 'element' 'symbol' 'atomicweight' 'density' 'isotopes' 'discyear'};

% Convert to a struct
S = table2struct(T);

% Questions

%Q1
% Find the density of mercury by indexing into the struct
Hg = S(80).density;
% Isolate the densities from the table
de = T.density;
% Find the list of elements denser than mercury
numel = de(de>Hg)
% I have no idea how to do this!!
