%Motherload, does everything...
function oneMil
%Generating a million sequences of 1 million (10^6) coin flips
%Need to break it up into blocks of 100x10^6 because of Matlab memory
%overflow
% h = zeros(1,10^6);
for i=1:10 %TODO: This is for testing purposes
%     flips = round(rand(10^4,10^6));
    flips = round(rand(10^6,100));
    
    %Counts the number of heads in this section
%     h(10^3*(i-1):10^3*i) = sum(flips,1);
end

%I.C.1
% keys = {'0-50000','50001-150000','150001-250000','250001-350000',...
%         '350001-450000','450001-549999','550000-649999', ...
%         '650000-749999','750000-849999','850000-949999', ...
%         '950000-1000000'};
% rlzations = {inR(h,0,5e4),inR(h,5e4+1,15e4),inR(h,15e4+1,25e4),...
%              inR(h,25e4+1,35e4),inR(h,35e4+1,45e4),inR(h,45e4+1,55e4-1),...
%              inR(h,55e4,65e4-1),inR(h,65e4,75e4-1),inR(h,75e4,85e4-1),...
%              inR(h,85e4,95e4-1),inR(h,95e4,100e4)};
% tbl = containers.Map(keys,rlzations);
% 
% tblToFile(tbl,'IC1.dat');

%I.C.2

end

%prob is the realized probability that the number of heads falls in the
%range [lb,ub]
function prob = inR(x,lb,ub)
    prob = sum(x>= lb & x <= ub)/10^6;
end