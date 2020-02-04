% load files
budget = xlsread('GlobalCarbonBudget2018','Historical Budget');
temptable = importdata('GlobalTempbyYear.txt');

% extract the first 2 columns from temptable
temps = temptable(: , 1:2);

% calculate the cumulative sums of the specified columns in budget
sum = cumsum(budget(100:268 , 2:3) , 'omitnan'); % not sure how to calculate the cumulative sum of both columns together - they're being calculated per column which produces 2 lines on my graphs instead of 1

% create a table of the specified data from budget
t = table(budget(100:268 , 1) , budget(100:268 , 2) , budget(100:268 , 3) , sum(: , 1:2) , temptable(: , 2) , temptable(: , 11) , temptable(: , 12));

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
save('climate.mat' , 'var');

% write the table to a .txt file
writetable(t , climate.txt);