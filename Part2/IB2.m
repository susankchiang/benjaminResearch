%I.B.2
%Produces the probability of the next flip being heads given all the
%previous flips are heads. The index to start at is predetermined
load 1000flips.mat;
load IB2.mat;

heads = getCounts(1, IB2Heads);
tails = getCounts(0, IB2Tails);

save('IB2_results.mat', 'heads', 'tails');