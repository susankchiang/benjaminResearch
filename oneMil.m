%Motherload, does everything...
function oneMil
% global trials;
% trials = 10^6; %Figure out how to make this work...

%Generating a million sequences of 1 million (10^6) coin flips
%Need to break it up into blocks of 100x10^6 because of Matlab memory
%overflow
for i=1:10^4
    flips = round(rand(100,10^6));
    dlmwrite('1milflips.dat',flips,'-append');
    
    %Counts the number of heads in this section
    h = sum(flips,1);
end

%I.C.1
keys = {'0-50,000','50,001-150,000','150,001-250,000','250,001-350,000',...
        '350,001-450,000','450,001-549,999','550,000-649,999', ...
        '650,000-749,999','750,000-849,999','850,000-949,999', ...
        '950,000-1,000,000'};
rlzations = {inR(h,0,5e4),inR(h,5e4+1,15e4),inR(h,15e4+1,25e4),...
             inR(h,25e4+1,35e4),inR(h,35e4+1,45e4),inR(h,45e4+1,55e4-1),...
             inR(h,55e4,65e4-1),inR(h,65e4,75e4-1),inR(h,75e4,85e4-1),...
             inR(h,85e4,95e4-1),inR(h,95e4,100e4)};
tbl = containers.Map(keys,rlzations);

tblToFile(tbl,'IC1.dat');
end

%prob is the realized probability that the number of heads falls in the
%range [lb,ub]
function prob = inR(x,lb,ub)
    prob = sum (x >=lb && x <=ub)/10^6;
end