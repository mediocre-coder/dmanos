function [varargout] = ptable(varargin)
% 

% import data
pt = xlsread('periodictabledata');

% define variable locations
an = pt(2:113 , 1);
nuc = pt(2:113 , 1);
aw = pt(2:113 , 4);

% define constants in MeV
mp = 938.28;
mn = 939.57;

% define coefficients in MeV
av = 15.8;
as = 18.3;
ac = .714;
aa = 23.3;
ap = 12;

% define variable delta
if rem(an,2) == 0 && rem(nuc,2) == 0
    d = 1;
elseif rem(nuc,2) ~== 0
    d = 0;
elseif rem(an,2) ~== 0 & rem(nuc,2) == 0
    d = -1;
end

% calculate binding energy per nucleon using semi-empirical formula
eb = (av*nuc)-(as*nuc^(2/3))-((ac*(an(an-1)))/nuc^(1/3))-((aa*((nuc-2*an)^2)/nuc))+((ap/nuc^(1/2))*d);

% calculate mass using semi-empirical formula
ms = (nuc*mp)+((nuc-an)*mn)-(eb/1^2);

% calculate mass using atomic weight
mw = aw;

% allow for variable number of inputs and outputs
if nargin == 0
    figure(1)
    plot(an,ms)
    title('mass (from equation) vs. atomic number')
    xlabel('atomic number')
    ylabel('mass (MeV)')
    figure(2)
    plot(an,mw)
    title('mass (from atomic weight) vs. atomic number')
    xlabel('atomic number')
    ylabel('mass (MeV)')
    figure(3)
    plot(an,eb)
    title('binding energy per nucleon vs. atomic number')
    xlabel('atomic number')
    ylabel('binding energy (MeV)')
elseif nargin == 1
    
    