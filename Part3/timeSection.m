flips = rand(10^4,10^6) > 1/2;
dlmwrite('flips.dat',flips);