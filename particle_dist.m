function prob_beta = particle_dist(beta, A, B, e_1)

t=400;
N=50;

X = zeros(t+2, N);
e = beta(5)*e_1;
sigma_1 = [beta(7), 0; 0, beta(8)];

for j=3:402
    x = zeros(1, 100);
    w = zeros(1, 100);
    x = beta(1)*X(j-1,:) + beta(2)*X(j-2,:) + beta(3)*e(j-1,:) + beta(4)*e(j-2,:) + e(j,:);
    
    
    w = zeros(1, N);
    for i=1:N
    w(i)=1e60*(1/((2*pi*(det(sigma_1)))^(1/2)))*exp((-1/2)*[(log(A(j-2))-x(i)); (B(j-2)-beta(6)*(x(i)^2))]'*inv(sigma_1)*[(log(A(j-2))-x(i)); (B(j-2)-beta(6)*(x(i)^2))]);
    end
    
    if max(w)<=1e-10
        w=ones(1,N);
    elseif min(w)<0
        w=ones(1,N);
    elseif sum(w)<=0
        w=ones(1,N);
    end
    
    try
    X(j,:) = randsample1(x, N, true, w);
    catch
    w=ones(1,N);
    X(j,:) = randsample1(x, N, true, w);
    end
end

L = zeros(t, 1);

for t = 1:400
    
    L(t)=(1/N)*trace((1/((2*pi*(det(sigma_1)))^(1/2)))*exp((-1/2)*[(log(A(t))-X(t+2, :)); (B(t)-beta(6)*(X(t+2, :).^2))]'*inv(sigma_1)*[(log(A(t))-X(t+2, :)); (B(t)-beta(6)*(X(t+2, :).^2))]));
    
end

L;

prob_beta = sum(log(L))
     