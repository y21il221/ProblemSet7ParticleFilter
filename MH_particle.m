function [Beta,acc] = MH_particle(A, B, e_1)
%parameters
burnin = 40000;
lag = 1;
nsamp = 40000;
sig = 0.01;
b = [0.48; 0.48; 1, ;0.16; 1; 4.5; 0.01; 11];


% storage
Beta = zeros(nsamp, 8);
acc = [0,0];

% MH routine
for i = 1:burnin
    [b,a] = particle_step(b,sig, A, B, e_1);
    i
    acc = acc + [a 1];
end

for i = 1:nsamp
    for j=1:lag
        [b,a] = particle_step(b,sig, A, B, e_1);
        acc = acc + [a 1];
    end
    i
    Beta(i, :) = b;
end