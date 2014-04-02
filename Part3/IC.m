%I.C.1, I.C.2, I.C.3
function IC
%Initialize values
load IC2.mat;
load IC3.mat;
ran2H = IC2Heads;
ran2T = IC2Tails;
s2 = length(IC2Heads);
ran3H = IC3Heads;
ran3T = IC3Tails;
s3 = length(IC3Heads);
c = 200; %The number of trials. 

%Initialize variables 
%I.C.1
c1 = zeros(1,c); %The number of heads per trial

%I.C.2
c2Countsh = zeros(s2,10); %The number of heads 
c2Numsh = zeros(s2,10); %The number of trials being considered
c2Countst = zeros(s2,10);
c2Numst = zeros(s2,10);

%I.C.3
c3Datah = zeros(s3,2); %c3Datah(:,1) keeps track of number of heads
                       %c3Datah(:,2) keeps track of number of trials being
                       %considered
c3Datat = zeros(s3,2);

%Calculations
for h=1:10^3
    M = rand(10^6,10^3) >= .5;
    [~,step] = size(M);
    
    %I.C.1
    c1(step*(h-1)+1:step*h) = sum(M,1); %count the heads in each trial
    
    %I.C.2
    for i=1:s2
        c2_h = 1:step; %Denotes the trials we want to consider at each step
        c2_t = 1:step;
        for j = 0:9
            %Heads
            c2Countsh(i,j+1) = sum(M(ran2H(i)+j,c2_h));
            c2Numsh(i,j+1) = length(c2_h);
            c2_h = find(M(ran2H(i)+j,c2_h)); %Only consider for the next 
                                             %round the columns 
                                             %where there was a head

            %Tails
            c2Countst(i,j+1) = length(c2_t) - sum(M(ran2T(i)+j,c2_t));
            c2Numst(i,j+1) = length(c2_t);
            c2_t = find(M(ran2T(i)+j,c2_t)==0);%Only consider for the next 
                                               %round the columns 
                                               %where there was a tail
         end
    end
    
    %I.C.3
    c3_h = 1:step; %Denotes the trials we want to consider at each step
    c3_t = 1:step;

    for i=1:6
        %Heads
        c3Datah(i,1) = sum(M(ran3H(i),c3_h));
        c3Datah(i,2) = length(c3_h);
        c3_h = find(M(ran3H(i),c3_h)); %Only consider for the next round the columns 
                                       %where there was a head

        %Tails
        c3Datat(i,1) = (length(c3_t) - sum(M(ran3T(i),c3_t)));
        c3Datat(i,2) = length(c3_t);
        c3_t = find(M(ran3T(i),c3_t)==0); %Only consider for the next round the 
                                          %columns where there was a tail
    end
end

%End Processing
%I.C.1
keys1 = {'0-50000','50001-150000','150001-250000','250001-350000',...
        '350001-450000','450001-549999','550000-649999', ...
        '650000-749999','750000-849999','850000-949999', ...
        '950000-1000000'};
val1 = {inR(c1,0,5e4),inR(c1,5e4+1,15e4),inR(c1,15e4+1,25e4),...
        inR(c1,25e4+1,35e4),inR(c1,35e4+1,45e4),inR(c1,45e4+1,55e4-1),...
        inR(c1,55e4,65e4-1),inR(c1,65e4,75e4-1),inR(c1,75e4,85e4-1),...
        inR(c1,85e4,95e4-1),inR(c1,95e4,100e4)};
tbl1 = containers.Map(keys1,val1);
tblToFile(tbl1,'IC1A.dat'); 
keys2 = {'0-499784','499785-500215','500216-1000000'};
val2 = {inR(c1,0,499784),inR(c1,499785,500215),inR(c1,500216, 100e4)};
tbl2 = containers.Map(keys2,val2);
tblToFile(tbl2,'IC1B.dat'); 
keys3 = {'0-499579','499580-499873','499874-500126','500127-500420',...
         '500421-1000000'};
val3 = {inR(c1,0,499579),inR(c1,499580,499873),inR(c1,499874,500126), ...
        inR(c1,500127,500420),inR(c1,500421,1000000)};
tbl3 = containers.Map(keys3,val3);
tblToFile(tbl3,'IC1C.dat'); 


%I.C.2
IC2H = c2Countsh ./ c2Numsh; %Probabilities 
IC2T = c2Countst ./ c2Numst;
save('IC2_results.mat','IC2H', 'IC2T');

%I.C.3
IC3H = c3Datah(:,1) ./ c3Datah(:,2); %Probabilities
IC3T = c3Datat(:,1) ./ c3Datat(:,2);
save('IC3_results.mat','IC3H', 'IC3T');

end

%count is the number of heads that fall in the range [lb,ub]
function count = inR(x,lb,ub)
    count = sum(x>= lb & x <= ub)/10^6;
end 