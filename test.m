%Testing things 

mat = [1,2,3,4,5;6,7,8,9,10;11,12,13,14,15];
% mat2 = [16,17,18,19,20];
% mat3 = [21,22,23,24,25];
% mat = rand(10,10);

% ds = mat2dataset(mat);
% 
% export(ds,'file','test.dat');

% dlmwrite('test.dat',mat,'-append');
% dlmwrite('test.dat',mat2,'-append');
% dlmwrite('test.dat',mat3,'-append');

% M = dlmread('test.dat',',');
% 
% tbl = containers.Map;
% tbl(mat2str([1;2;3])) = 1;
% tbl(mat2str([0;1;1])) = 2;

y =  cell(1,10^6);

for i=1:10^6
    x = round(rand(10^2,1));
    y{i} = sparse(rand(10^4,1));
end

