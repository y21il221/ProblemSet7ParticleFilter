function [beta_1, a] = particle_step(beta_0, sig, A, B, e_1)

  beta_p = normrnd(beta_0, sig, [8,1])
  beta_p(5) = abs(beta_p(5));
  beta_p(7) = abs(beta_p(7));
  beta_p(8) = abs(beta_p(8));
  
  accprob = particle_dist(beta_p, A, B, e_1) - particle_dist(beta_0, A, B, e_1);
  u = rand;
  if log(u) <= accprob
      beta_1 = beta_p;
      a = 1;
  else
      beta_1 = beta_0;
      a = 0;
  end