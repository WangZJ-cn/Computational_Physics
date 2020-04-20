function lesson14
N = 999;
l = 100;
h = 80 * pi / (N + 1);
H0 = zeros(N, N);V = zeros(N, N);x = linspace(-40 * pi, 40 * pi, 999);
for k = 1:N-1
    H0(k, k) = -2;
    H0(k, k + 1) = 1;
    H0(k + 1, k) = 1;
end
H0(N, N) = 2;
H0 = H0./2./h./h;
for k = 1:N
    if 0 <= x(k) <= 10
        V(k) = 0.5;
    end
end
H = H0 +V;
delta_t = 0.2 ; x0 = -20 * pi ; p0 = 1 ; sigma0 = 10;
A = eye(N) + delta_t ./ 2 ./ i * H;
%初值
phi1= 1 ./ (pi^0.25 .* sqrt(sigma0)) .* exp(-(x - x0).^2 ./ 2 ./ sigma0.^2) .* exp(i .* p0 .* x);
b = A * phi1';
hp = plot([0], '-b');
axis([-40*pi, 40*pi, -0.5, 0.5]);
%随时间的变化
for t = 1 : N
    phi2 = A \ b;
    b = (eye(N) - delta_t / 2 / i .* H) * phi2;
    set(hp, 'XData', x, 'YData', real(phi2));
    drawnow;
    pause(0.0000001);
end
end
    
