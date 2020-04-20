function lesson10()
k0 = 1.38 * 10^ - 23;
r0 = [
    -1.5, 1.5;
    0, 1.5;
    1.5, 1.5;
    -1.5, 0;
    0, 0;
    1.5, 0;
    -1.5, -1.5;
    0, -1.5;
    1.5, -1.5];
T0 = 0.1;
theta0 = 2 * pi * rand(9);
v0 = ones(9, 2);
for i = 1:9
    v0(i, 1) = sqrt(2 * T0) * cos(theta0(i));
    v0(i, 2) = sqrt(2 * T0) * sin(theta0(i));
end
K0 = K(v0);
U0 = 1/2 * V(r0);
disp(K0 + U0)%初始总能量
%============================================%
h = 0.01;
data = zeros(9, 2);
figure(1)
hp = plot([0], 'ro');
axis([-2, 2, -2, 2]);
for t = 1 : 1000
    r1 = r0 + h .* v0;
    f = F(r0);
    v1 = v0 + h*f;
    for i = 1 : 9
        v1(i, 1) = v1(i, 1) * sqrt(2 * T0 / (v1(i, 1)^2 + v1(i, 2)^2));
        v1(i,2) = v1(i, 2) * sqrt(2 * T0 / (v1(i, 1)^2 + v1(i, 2)^2));
    end
    E(t) = K(v1) + 1/2 * V(r1);
    data = r1;
    set(hp, 'XData', data(:, 1), 'YData', data(:, 2));
    pause(0.03)
    v0 = v1;
    r0 = r1;
end
figure(2)
for i = 1:9
    scatter(r1(i, 1), r1(i, 2), 300, '.');
    hold on
end
t=[1 : 1 : 1000];
figure(3)
plot(t, E)

end
function y = K(v)
y = 0;
for i = 1:9
    y = y + 0.5 * (v(i, 1)^2 + v(i, 2)^2);
end
end

function y = V(r0)
for i = 1 : 9
    u(i) = 0;
    for m = 1:9
        if i == m
            continue;
        end
        r = sqrt((r0(m, 1) - r0(i, 1))^2 + (r0(m, 2) - r0(i, 2))^2);
        u(i) = u(i) + 4 * ((1 / r)^12 - (1/r)^6);
    end
end
y = sum(u);
end
function f = F(r0)
f = zeros(9, 2);
for i = 1 : 9
    for j = 1 : 9
        if i == j
            continue;
        end
        r = sqrt((r0(j, 1) - r0(i, 1))^2 + (r0(j, 2) - r0(i, 2))^2);
        rx = r0(i, 1) - r0(j, 1);
        ry = r0(i, 2) - r0(j, 2);
        f(i, 1) = f(i, 1) + (48 / r^14 - 24 / r^8) * rx;
        f(i, 2) = f(i, 2) + (48 / r^14 - 24 / r^8) * ry;
    end
end
end
    
    