% load files
budget = xlsread('GlobalCarbonBudget2018','Historical Budget');
temptable = importdata('GlobalTempbyYear.txt');

% extract the data from 1850-2017 from budget
b = budget(101:268 , :);

% extract the data from 1850-2017 from temptable
tt = temptable(1:168 , :);

% extract the first 2 columns from tt
temps = tt(: , 1:2);

% calculate the cumulative sums of the specified columns in budget
s = cumsum(b(: , 2:3) , 'omitnan');

% calculate the total cumulative sums
ts = s(: , 1) + s(: , 2);

% create a table of the specified data from budget
t = table(b(: , 1) , b(: , 2) , b(: , 3) , ts(:) , tt(: , 2) , tt(: , 11) , tt(: , 12));

% name the columns of the table
t.Properties.VariableNames = {'year' , 'fossil fuel and industry emissions' , 'land-use change emissions' , 'cumsum' , 'avg global temp' , 'lower bound' , 'upper bound'};

% plot global temp and cumsum vs. year
figure(1)
hold on
yyaxis left
plot(t.('year') , t.('avg global temp'))
xlabel('Year')
ylabel('Average Global Temperature')
yyaxis right
plot(t.('year') , t.('cumsum'))
ylabel('Total Carbon Emissions')
title('Average Global Temperature and Total Carbon Emissions Since 1850')
hold off

% plot global temp with error bars and and cumsum vs. year
error = (t.('upper bound')) - (t.('lower bound'));
figure(2)
hold on
yyaxis left
plot(t.('year') , t.('avg global temp'))
xlabel('Year')
ylabel('Average Global Temperature')
errorbar(t.('year') , t.('avg global temp') , error)
yyaxis right
plot(t.('year') , t.('cumsum'))
ylabel('Total Carbon Emissions')
title('Average Global Temperature and Total Carbon Emissions Since 1850')
hold off

% create a scatterplot of temp vs. cumsum
figure(3)
hold on
scatter(t.('avg global temp') , t.('cumsum')) % I'm getting an error that x and y aren't the same length, so nothing is getting plotted - not sure how to fix this
xlabel('Average Global Temperature')
ylabel('Total Carbon Emissions')
title('Average Global Temperature vs. Total Carbon Emissions')
hold off

% save the data to a .mat file
save('climate.mat');

% write the table to a .txt file
writetable(t , 'climate.txt');