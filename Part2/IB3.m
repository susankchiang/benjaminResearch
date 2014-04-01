%I.B.3
%Given a predetermined set of ranJ, find the probability that given the
%probabilty of random flip j1 being heads, the random flip j2 is heads.
%Do this given random flips j1 and j2. Also do this given j1,..., j5. 

function IB3
load 1000flips.mat;
load IB3.mat;
M = flips;
[~,c] = size(M);
ranJ = IB3Heads;
ranJ_t = IB3Tails;

probs = zeros(1,6); %Contains the probabilities
probs_t = zeros(1,6); %Tails
y = 1:c; %Denotes the trials we want to consider at each step
y_t = 1:c;

for i=1:6
    %Heads
    probs(i) = sum(M(ranJ(i),y))/ length(y);
    y = find(M(ranJ(i),y)); %Only consider for the next round the columns 
                            %where there was a head
                             
    %Tails
    probs_t(i) = (length(y_t) - sum(M(ranJ_t(i),y_t)))/length(y_t);
    y_t = find(M(ranJ_t(i),y_t)==0); %Only consider for the next round the 
                                     %columns where there was a tail
end

save('IB3_results.mat', 'probs', 'probs_t');

end