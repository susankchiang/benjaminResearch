%I.B.1
%Calculates the realized probabilities of there being 0,1,...,10 heads
%among all the trials

function IB1
load 1000flips.mat
M = flips;

%Count the number of instances of 0,1,...,10 heads
h = sum(M,1); %sums the columns

%Part A
heads = {'0-50','051-150','151-250','251-350','351-450','451-549', ...
        '550-649','650-749','750-849','850-949','950-1000'};
counts = {inR(h,0,50), inR(h,51,150), inR(h,151,250), inR(h,251,350), ...
         inR(h,351,450), inR(h,451,549), inR(h,550,649), ...
         inR(h,650,749), inR(h,750,849), inR(h,850,949), ...
         inR(h,950,1000)};
tbl = containers.Map(heads,counts);

tblToFile(tbl,'IB1A.dat'); 

%Part B
keys = {'0-480', '481-519', '520-1000'};
vals = {tbl('0-50')+tbl('051-150')+tbl('151-250')+tbl('251-350')+...
        tbl('351-450')+inR(h,451,480), inR(h,481,519), inR(h,520,549)+...
        tbl('550-649')+tbl('650-749')+tbl('750-849')+tbl('850-949')+...
        tbl('950-1000')};
tbl2 = containers.Map(keys,vals);
tblToFile(tbl2,'IB1B.dat');

%Part C
keys = {'0-450', '451-549', '550-1000'};
vals = {tbl('0-50')+tbl('051-150')+tbl('151-250')+tbl('251-350')+...
        tbl('351-450'), tbl('451-549'), ...
        tbl('550-649')+tbl('650-749')+tbl('750-849')+tbl('850-949')+...
        tbl('950-1000')};
tbl3 = containers.Map(keys,vals);
tblToFile(tbl3,'IB1C.dat');

%Part D
keys = {'0-50','051-150','151-250','251-350','351-480','481-519', ...
        '520-649','650-749','750-849','850-949','950-1000'};
vals = {tbl('0-50'), tbl('051-150'), tbl('151-250'), tbl('251-350'), ...
        inR(h,351,480), inR(h,481,519), inR(h,520,649), ...
        tbl('650-749'), tbl('750-849'), tbl('850-949'), ...
       tbl('950-1000')};
tbl4 = containers.Map(keys,vals);
tblToFile(tbl4,'IB1D.dat');

%Part E
keys = {'0-909', '910', '911-1000'};
vals = {tbl('0-50')+tbl('051-150')+tbl('151-250')+tbl('251-350')+...
        tbl('351-450')+tbl('451-549')+tbl('550-649')+tbl('650-749')+...
        tbl('750-849')+inR(h,850,909),inR(h,910,910), inR(h,911,949)+...
        tbl('950-1000')};
tbl5 = containers.Map(keys,vals);
tblToFile(tbl5,'IB1E.dat');

%Part F
keys = {'0-499', '500', '501-1000'};
vals = {tbl('0-50')+tbl('051-150')+tbl('151-250')+tbl('251-350')+...
        tbl('351-450')+inR(h,451,499), inR(h,500,500), inR(h,501,549)+...
        tbl('550-649')+tbl('650-749')+tbl('750-849')+tbl('850-949')+...
        tbl('950-1000')};
tbl6 = containers.Map(keys,vals);
tblToFile(tbl6,'IB1F.dat');

%Part G
keys = {'0-493', '494-506', '507-1000'};
vals = {tbl('0-50')+tbl('051-150')+tbl('151-250')+tbl('251-350')+...
        tbl('351-450')+inR(h,451,493), inR(h,494,506), inR(h,507,549)+...
        tbl('550-649')+tbl('650-749')+tbl('750-849')+tbl('850-949')+...
        tbl('950-1000')};
tbl7 = containers.Map(keys,vals);
tblToFile(tbl7,'IB1G.dat');

%Part H
keys = {'0-487', '488-496', '497-503', '504-512', '513-1000'};
vals = {tbl('0-50')+tbl('051-150')+tbl('151-250')+tbl('251-350')+...
        tbl('351-450')+inR(h,451,487), inR(h,488,496), inR(h,497,503),...
        inR(h,504,512), inR(h,513,549)+tbl('550-649')+tbl('650-749')+...
        tbl('750-849')+tbl('850-949')+tbl('950-1000')};
tbl8 = containers.Map(keys,vals);
tblToFile(tbl8,'IB1H.dat');

end

%prob is the realized probability that the number of heads falls in the
%range [lb,ub]
function prob = inR(x,lb,ub)
    prob = sum(x>= lb & x <= ub)/10^6;
end