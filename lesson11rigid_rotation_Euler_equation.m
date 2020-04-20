function lesson11
a = 1;
b = 2;
r = [-b, a, 0;
    -b, 0, 0;
    -b, -a, 0;
    0, a, 0;
    0, 0, 0;
    0, -a, 0;
    b, a, 0;
    b, 0, 0;
    b, -a, 0];
I = zeros(3, 3);
for n = 1:9
    I(1, 1) = I(1, 1) + r(n, 2)^2 + r(n, 3)^2;
    I(2, 2) = I(2, 2) + r(n, 1)^2 + r(n, 3)^2;
    I(3, 3) = I(3, 3) + r(n, 1)^2 + r(n, 2)^2;
    I(1, 2) = I(1, 2) - r(n, 1) * r(n, 2);
    I(2, 1) = I(2, 1) - r(n, 1) * r(n, 2);
    I(2, 3) = I(2, 3) - r(n, 2) * r(n, 3);
    I(3, 2) = I(3, 2) - r(n, 2) * r(n, 3);
    I(1, 3) = I(1, 3) - r(1, 3) * r(n, 3);
    I(3, 1) = I(3, 1) - r(1, 3) * r(n, 3);    
end
disp(I)
% 
% 求得的矩阵为
%      6     0     0
%      0    24     0
%      0     0    30
% 为对角矩阵，所以该坐标系是刚体的主轴坐标系

%===================================================%
h = 0.05;
Ixx = I(1, 1);
Iyy = I(2, 2);
Izz = I(3, 3);
%第一组
w10 = [1, 0.01, 0.01];
w1x(1) = w10(1);
w1y(1) = w10(2);
w1z(1) = w10(3);
for i = 1:1000
    w1x(i + 1) = w1x(i) + h * (Iyy - Izz) * w1y(i) * w1z(i) / Ixx;
    w1y(i + 1) = w1y(i) + h * (Izz - Ixx) * w1z(i) * w1x(i) / Iyy;
    w1z(i + 1) = w1z(i) + h * (Ixx - Iyy) * w1x(i) * w1y(i) / Izz;    
end
t=[0 : 0.05 : 50];
figure(1)
plot(t, w1x, t, w1y, t, w1z)
legend('w_x', 'w_y', 'w_z');

%第二组
w10 = [0.01, 1, 0.01];
w1x(1) = w10(1);
w1y(1) = w10(2);
w1z(1) = w10(3);
for i = 1 : 1000
    w1x(i + 1) = w1x(i) + h * (Iyy - Izz) * w1y(i) * w1z(i) / Ixx;
    w1y(i + 1) = w1y(i) + h * (Izz - Ixx) * w1z(i) * w1x(i) / Iyy;
    w1z(i + 1) = w1z(i) + h * (Ixx - Iyy) * w1x(i) * w1y(i) / Izz;    
end
t = [0 : 0.05 : 50];
figure(2)
plot(t, w1x, t, w1y, t, w1z)
legend('w_x', 'w_y', 'w_z');
%第三组
w10 = [0.01, 0.01, 1];
w1x(1) = w10(1);
w1y(1) = w10(2);
w1z(1) = w10(3);
for i = 1:1000
    w1x(i + 1) = w1x(i) + h * (Iyy - Izz) * w1y(i) * w1z(i) / Ixx;
    w1y(i + 1) = w1y(i) + h * (Izz - Ixx) * w1z(i) * w1x(i) / Iyy;
    w1z(i + 1) = w1z(i) + h * (Ixx - Iyy) * w1x(i) * w1y(i) / Izz;    
end
t = [0 : 0.05 : 50];
figure(3)
plot(t, w1x, t, w1y, t, w1z)
legend('w_x', 'w_y', 'w_z');

% 可见该刚体绕x、z轴转动可以稳定，绕y轴转动不能稳定
end