%Generating a million sequences of 1 million (10^6) coin flips
function flips = generate1000000flips()

%ran is a 10 x 1 million matrix of random numbers from a uniform
%distribution on (0,1)
ran = rand(10^6,10^6);

%flips represents the 1 million sequences of 1 million coin flips
%Let 0 = tails, 1 = heads
flips = round(ran);

%Save data into a file
dlmwrite('1000000flips.dat',flips);
