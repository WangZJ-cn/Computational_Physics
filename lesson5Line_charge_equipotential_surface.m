function lesson5_3_4()
fprintf("(1,2,3)处电势为%f\n", potential(1, 2, 3))
theta = linspace(0, 2 * pi, 100);
rz = 0;
for i = 1 : 100
    r0(i) = fzero(@(r)potential(r * cos(theta(i)), r * sin(theta(i)), rz) - 1.5, 1);
    r1(i) = fzero(@(r)potential(r * cos(theta(i)), r * sin(theta(i)), rz) - 1, 1);
    r2(i) = fzero(@(r)potential(r * cos(theta(i)), r * sin(theta(i)), rz) - 2, 1);
    r3(i) = fzero(@(r)potential(r * cos(theta(i)), r * sin(theta(i)), rz) - 3, 1);
end
figure(1)
polar(theta, r0);
figure(2)
polar(theta, r1);
hold on;
polar(theta, r2);
hold on;
polar(theta, r3);
end
function phi = potential(rx, ry, rz)
phi=integral(@(x)(1 ./ sqrt((rx - x).^2 + ry.^2 + rz.^2)), -0.5, 0.5);
end