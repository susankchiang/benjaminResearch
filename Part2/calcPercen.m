%Generates the percentages given a table of the counts of heads or tails
%depending on the previous flip
calcPercen(X, heads)
[r,c] = size(X);
percens = zeros(r,c);
for j=1:10
    if (j==1)
        percens(j,:) = X(j,:)/10^6;
    else
        percens(j,:) = X(j,:)/X(j-1,:);
    end
end

save('IB2.mat','percens');

