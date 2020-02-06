% Import smallperiodictable.txt
T = readtable('smallperiodictable.txt');

% Add variable names
T.Properties.VariableNames = {'atomicnum' 'element' 'symbol' 'atomicweight' 'density' 'isotopes' 'discyear'};

% Convert to a struct
S = table2struct(T);

% Questions

% Q1
disp('Q1')
% Find the density of mercury by indexing into the struct
Hg = S(80).density;
% Find the list of elements denser than mercury and with < 30 isotopes
% Shoutout to Stephan for this code
d30 = T.element(T.density>Hg & T.isotopes<30);
% Find the number of elements
ne = numel(d30);
disp(ne)
% List the elements in alphabetical order
disp(sort(d30))

% Q2
disp('Q2')
% Calculate the average atomic weight of elements discovered in the 20th
% century
avg = mean(T.atomicweight(T.discyear>=1901 & T.discyear<=2000));
disp(avg)
% List those elements' symbols
disc20 = T.symbol(T.discyear>=1901 & T.discyear<=2000);
disp(disc20)

% Q3
disp('Q3')
% Find the locations in the table of the top 10 largest numbers of isotopes
[top10,index] = maxk(T.isotopes,10);
% List the names of those elements
names = T.element(index);
disp(names)

% Q4
% Tables are easier to deal with because it is quite simple to index into
% them. Using structures would be advantageous when you need to see
% multiple properties of a single element at once. 




