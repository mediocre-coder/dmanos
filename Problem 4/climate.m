% load files
budget = xlsread('GlobalCarbonBudget2018','Historical Budget');
temptable = importdata('GlobalTempbyYear.txt');

% extract the first 2 columns from temptable
temps = temptable(: , 1:2);

