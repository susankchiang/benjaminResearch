%I.A.1
%Precondition: q is an integer in the interval [1,10]
%Given q, a table of all possible head/ tail combinations for flips 
%1,2,..., q-1 and the corresponding probability of the qth flip being
%heads (value = 1) is produced

function IA1(q) 
load('10flips.mat');
M = flips;
[~,c] = size(M);
tbl = containers.Map;

%Maps to each 1,...,1-q flips, a list of all the qth flip realizations...
for i=1:c 
    if q<=1
        key = '[]'; %When q = 1, there are no previous flips
    else
        key = mat2str(M(1:q-1,i));
    end
    
    %The values for the first matrix are stored as: [number of heads,
    %number of flips]
    if (tbl.isKey(key))
        x = tbl(key);
        tbl(key) = [x(1)+M(q,i), x(2)+1];
    else
        tbl(key) = [M(q,i),1];
    end
end

%Find the probability of the qth flip being heads for each key
ks = keys(tbl);
for i=1:length(ks)
    key = ks{i};
    x = tbl(key);
    tbl(key) = x(1)/x(2); %num of heads/ num of flips = prob of heads
end

tblToFile(tbl, strcat('IA1_',int2str(q),'_10flips.dat'));
save(strcat('IA1_',int2str(q),'_results.mat'), 'tbl');