function lesson8
u1 = [-7, 9, 21];
[t, u] = ode45(@f, [0, 20], u1);
x = u(:, 1);
y = u(:, 2);
z = u(:, 3);
plot3(u(:, 1), u(:, 2), u(:, 3));
%========================================%
hold on
plot3(x(1), y(1), z(1), 'g-');
hold on
h = plot3(x(1), y(1), z(1), 'ro')
for i = 1 : length(x)
set(h, 'Xdata', x(i), 'YData', y(i), 'ZData', z(i));
pause(0.1)
end
end
function du = f(t, u)
dx = 10 .* (u(2) - u(1));
dy = u(1) .* (28 - u(3)) - u(2);
dz = u(1) .* u(2) -8/3 .* u(3);
du = [dx; dy; dz];
end