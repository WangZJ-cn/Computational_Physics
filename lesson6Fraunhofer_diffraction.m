function lesson6_23()
x = 0;
y = linspace(-2500, 2500, 50);
R = 5;
L = 5000;
for n = 1 : 50
    I(n) = abs(f(x, y(n), R, L))^2 / 6000;
end
figure(1)
plot(y, I);
y = linspace(-2500, 2500, 50);
x = linspace(-2500, 2500, length(y));
for n = 1 : length(y)%x方向
    for p = 1 : length(y)%y方向
        I(n, p) = abs(f(x(n), y(p), R, L))^2;
    end
end
m = 0.2 .* max(I(:));
I = 255 .* min(1.0, I / m);
figure(2)
colormap(gray(255));
image(I);
end
function E = f(x, y, R, L)
lambda = 1;
k = 2 * pi / lambda;
E = integral2(@(r, theta)exp(-i .* k .* sqrt( (x - r .* cos(theta) ).^2 + ( y - r .* sin(theta) ).^2 + L.^2)) .* r, 0, R, 0, 2 * pi);
end