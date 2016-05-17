t = cputime;

clear all

load('data')
load('e_1')

t=400;
N=50;

A = data(:,1);
B = data(:,2);
%e_1 = normrnd(0, 1, t+2, N);

[beta a] = MH_particle(A, B, e_1);

e = cputime - t;

figure(1)
hist(beta(:,1))
title('\rho_1')
figure(2)
hist(beta(:,2))
title('\rho_2')
figure(3)
hist(beta(:,3))
title('\phi_1')
figure(4)
hist(beta(:,4))
title('\phi_2')
figure(5)
hist(beta(:,5))
title('\sigma_epsilon')
figure(6)
hist(beta(:,6))
title('\beta')
figure(7)
hist(beta(:,7))
title('\sigma_v_a^2')
figure(8)
hist(beta(:,8))
title('\sigma_v_b^2')

display (['runtime is ', num2str(e)])
