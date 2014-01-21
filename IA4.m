%I.A.4
%Precondition: a, b are in the interval [1,number of flips]
%Reports the probability of flip b at random is heads given that flip a is
%heads

function prob = IA4(M,a,b)
    aHeads = M(a,:) ==1; %The a flips that are heads
    prob = mean(M(b,aHeads));
end