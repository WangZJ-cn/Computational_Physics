function lesson9()
h = 0.25;
T = 400;
theta1 = pi/6;
v1 = 0 - h / 2 * sin(theta1);
for i = 1 : T / h
    theta2 = theta1 + h * v1;
    v2 = v1 - h * sin(theta2);
    theta(i) = theta2;
    v(i) = v2;
    theta1 = theta2;
    v1 = v2;
end
for k = 1 : (length(v)-1)
    w(k) = (v(k) + v(k + 1)) / 2;
end
theta(1) = [];
figure(1)
plot(theta, w);
for n = 1 : (length(w))
    E(n) = w(n)^2 / 2 - cos(theta(n));
end
t0 = linspace(0, 400, 1600);
t0(1) = [];
figure(2)
plot(t0, E);
%=============================
[t, y] = ode45(@f, [0, 400], [pi / 6 ; 0]);
theta2 = y(:, 1);
w2 = y(:, 2);
theta2(1) = [];
w2(1) = [];
% ============================
figure(3)
axis([-1, 1, -1.3, 0]);
hold on
H1_1 = plot([0, cos(theta - 0.5 * pi)], [0, sin(theta - 0.5 * pi)], 'r-');
H1_2 = plot(cos(theta - 0.5 * pi), sin(theta - 0.5 * pi), 'ro');
H2_1 = plot([0, cos(theta2(1) - 0.5 * pi)], [0, sin(theta2(1) - 0.5 * pi)], 'b-');
H2_2 = plot(cos(theta2(1) - 0.5 * pi), sin(theta2(1) - 0.5 * pi), 'bo');
for m = 1 : length(theta)
    set(H1_1, 'XData', [0, cos(theta(m) - 0.5 * pi)], 'YData', [0, sin(theta(m) - 0.5 * pi)]);
    set(H1_2, 'XData', cos(theta(m) - 0.5 * pi), 'YData', sin(theta(m) - 0.5 * pi));
    set(H2_1, 'XData', [0, cos(theta2(m) - 0.5*pi)], 'YData', [0, sin(theta2(m) - 0.5 * pi)]);
    set(H2_2,'XData', cos(theta2(m) - 0.5 * pi), 'YData', sin(theta2(m) - 0.5 * pi));
    pause(0.1)
end
end
function dy = f(t,y)
dy = [y(2); -sin(y(1))];
end