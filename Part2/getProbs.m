%For input heads =1 with a random j, prob(1:10, j) is the probabilitie that
%the j+c flip is heads given that the [j,j+c-1] flips are heads (with c
%between 0 and 9 and corresponding to the rows).\
%Input js is the matrix of random j values
function prob = getProbs (heads, js)
load 1000flips.mat;
M = flips;
[r,c] = size(js); 
prob = zeros(10,1000);
                       
x = 1:10^6; %Denotes the trials we want to consider at each step
j=1;
for i=1:r*c
    if(heads==1)
        prob(j,i) = sum(M(i,x))/size(x);
        x = find(M(i,x)); %Only consider for the next round the columns 
                          %where there was a head
    else
        prob(j,i) = (size(x) - sum(M(i,x)))/size(x);
        x = find(M(i,x)==0);%Only consider for the next round the columns 
                            %where there was a tail
    end
    j=j+1;
end