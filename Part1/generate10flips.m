%Generating a million sequences of 10 coin flips
function flips = generate10flips()

%ran is a 10 x 1 million matrix of random numbers from a uniform
%distribution on (0,1)
ran = rand(10,10^6);

%flips represents the 1 million sequences of 10 coin flips
%Let 0 = tails, 1 = heads
flips = round(ran);

%Save data into a file
save('10flips.mat','flips');