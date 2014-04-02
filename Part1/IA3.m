%I.A.3
%Produces the probability of the next flip being heads given all the
%previous flips are heads

function IA3
    load('10flips.mat');
    M = flips;

    [r,~] = size(M);
    
    %The probabilities given a streak of i heads
    x = zeros(r-1,2); 
    for i=1:r-1
        x(i,:) = [i,streaks(M,i)];
    end
    
    %Write to file
    save('IA3_results.mat','x');    
end

%Precondition: j is in interval [1,number of flips)
%Given j, produces the probability that the j+1 flip is heads if the first 
%j flips are heads
function prob = streaks(M,j)
    jflips = sum(M(1:j,:),1); %The first j flips
    streak = jflips == j; %Finds which trials have the first j flips as heads

    realizations = M(j+1,streak);
    prob = mean(realizations);
end