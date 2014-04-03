%I.A.3
%Produces the probability of the next flip being heads given all the
%previous flips are heads

function IA3
    load('10flips.mat');
    M = flips;

    [r,~] = size(M);
    
    %The probabilities given a streak of i heads
    IA3H = zeros(r-1,2); 
    IA3T = zeros(r-1,2);
    for i=1:r-1
        IA3H(i,:) = [i,streaks(M,i, true)];
        IA3T(i,:) = [i,streaks(M,i, false)];
    end
    
    %Write to file
    save('IA3_results.mat','IA3H', 'IA3T');    
end

%Precondition: j is in interval [1,number of flips)
%Given j and heads = true, produces the probability that the j+1 flip is 
%heads if the first j flips are heads. 
%Given j and heads = false, produces the probability that the j+1 flip is 
%tails if the first j flips are tailss. 
function prob = streaks(M,j,heads)
    if (heads)
        jflips = sum(M(1:j,:),1); %The first j flips
        streak = jflips == j; %Finds which trials have the first j flips 
                              %as heads
    else
        jflips = j - sum(M(1:j,:),1); %The first j flips
        streak = jflips == j; %Finds which trials have the first j flips 
                              %as tails
    end
    
    realizations = M(j+1,streak);
    prob = mean(realizations);
end
