function lesson13
fprintf('第一问：\n');
fprintf('N=99时,基态能量为%f\n', f1(99));
fprintf('N=149时,基态能量为%f\n', f1(149));
fprintf('N=199时,基态能量为%f\n', f1(199));
fprintf('N=299时,基态能量为%f\n', f1(299));
fprintf('===========================================\n');
fprintf('第二问：\n');
[phi1,phi2] = f2(399);
phi1 = phi1 ./ sqrt(sum(abs(phi1 .* phi1)));
phi2 = phi2 ./ sqrt(sum(abs(phi2 .* phi2)));
x=linspace(-1 , 1 , 399);
plot(x,phi1, 'r', x, phi2, 'b');
legend('Bonding/Symmetric', 'Anti-bonding/Anti-symmetric')

end

function E0 = f1(N)
h = 2 / (N + 1);
V0 = 50;
d = 0.1;
a = 2 * V0 * h^2 + 2;
H = zeros(N, N);
for i = 1 : N-1
    if i<(1-d)/h | i>(1+d)/h
        H(i, i) = 2;
    else 
        H(i, i) = a;
    end   
    H(i, i + 1) = -1;
    H(i + 1, i) = -1;
end
H(N, N) = 2;
[V, D] = eig(H);
E0 = D(1, 1) / 2 / h^2;
end

function [x0, x1] = f2(N)
h = 2 / (N+1);
V0 = 50;
d = 0.1;
a = 2 * V0 * h^2 + 2;
H = zeros(N, N);
for i = 1:N-1
    if i<=(1-d)/h | i>=(1+d)/h
        H(i,i) = 2;
    else 
        H(i,i) = a;
    end   
    H(i,i+1) = -1;
    H(i+1,i) = -1;
end
H(N,N) = 2;
[V,D] = eig(H);
x0 = V(:,1);
x1 = V(:,2);
end
