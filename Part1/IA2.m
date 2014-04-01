%I.A.2
%Calculates the realized probabilities of there being 0,1,...,10 heads
%among all the trials

function IA2
load('10flips.mat');
M = flips;
[~,c] = size(M);

%Count the number of instances of 0,1,...,10 heads
heads = {'00','01','02','03','04','05','06','07','08','09','10'};
counts = {0,0,0,0,0,0,0,0,0,0,0};
tbl = containers.Map(heads,counts);

countHeads = sum(M,1); %sums the columns

%Part A
for i=0:10
    tbl(toString(i)) = sum(countHeads==i)/c; %realized probability
end

tblToFile(tbl,'IA2A_10flips.dat');

%Part B
keys = {'0-3','4','5','6','7-10'};
realizations = {tbl('00')+tbl('01')+tbl('02')+tbl('03'),...
                tbl('04'),tbl('05'), ...
                tbl('06'),tbl('07')+tbl('08')+tbl('09')+tbl('10')};
tbl2 = containers.Map(keys, realizations);

tblToFile(tbl2,'IA2B_10flips.dat');

%Part C
keys = {'0-4','5','6-10'};
realizations = {tbl('00')+tbl('01')+tbl('02')+tbl('03')+tbl('04'),...
                tbl('05'), ...
                tbl('06')+tbl('07')+tbl('08')+tbl('09')+tbl('10')};
tbl3 = containers.Map(keys, realizations);

tblToFile(tbl3,'IA2C_10flips.dat');
end

function str = toString(num)
if(num>=0 && num <10)
    str = strcat('0',int2str(num));
else
    str = int2str(num);
end
end
