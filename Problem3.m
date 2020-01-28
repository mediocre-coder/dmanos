% load variables
load('p3')

% v.*u
ans1 = v.*u

% v*u'
ans2 = v*u'

%v'*u
ans3 = v'*u

%u/v
ans4 = u/v

%u./v
ans5 = u./v

%A*u
%ans6 = A*u
%error

%A.*u
ans7 = A.*u

%A*v'
ans8 = A*v'

%A^2
ans9 = A^2
%this multiplies the entire matrix by itself

%A.^2
ans10 = A.^2
%this squares each individual element within the matrix

%infinite series
n = (1:100);
series = (12^(.5)).*(((-3).^(-n))./(2.*n+1));
sum = sum(series)

