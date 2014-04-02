%I.B.2
%Produces the probability of the next flip being heads given all the
%previous flips are heads. The index to start at is predetermined
function IB2
load 1000flips.mat;
load IB2.mat;
M = flips;
[~,c] = size(M);
ranJ_h = IB2Heads;
ranJ_t = IB2Tails;
n = length(ranJ_h); 

IB2H = zeros(10,n);
IB2T = zeros(10,n);
                       
for i=1:n
    x_h = 1:c; %Denotes the trials we want to consider at each step
    x_t = 1:c;
    for j = 0:9
        %Heads
        if(isempty(x_h))
            IB2H(j+1,i) = 0;
        else
            IB2H(j+1,i) = sum(M(ranJ_h(i)+j,x_h))/length(x_h);  
            x_h = find(M(ranJ_h(i)+j,x_h)); %Only consider for the next 
                                            %round the columns 
                                            %where there was a head
        end
        
        %Tails
        if(isempty(x_t))
            IB2T(j+1,i) = 0;
        else
            IB2T(j+1,i) = (length(x_t) - sum(M(ranJ_t(i)+j,x_t)))/length(x_t);
            x_t = find(M(ranJ_t(i)+j,x_t)==0);%Only consider for the next 
                                              %round the columns 
                                              %where there was a tail
        end
    end
end

save('IB2_results.mat', 'IB2H', 'IB2T');