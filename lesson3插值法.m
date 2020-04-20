function main()
x = [1 1.5 2.1 2.5 3.0];
y = [1 2 2.1 1.6 0.8];
p = spline(x,y);
x2 = linspace(1,3.0,100);
x0 = linspace(1,3.0,100);
array = p.coefs;
d = array(: ,1);
c = array(: ,2);
b = array(: ,3);
a = array(: ,4);
% y2 = ppval(p ,x2);
N = length(c);
for i = 1:100
    for j = 1:N
        if x2(i) >= x(j) && x2(i) < x(j + 1)
            h = x2(i) - x(j);
            y2(i) = a(j) + b(j) * h + c(j) * h^2 + d(j)*h^3;
            y3(i) = b(j) + 2 * c(j) * h + 3 * d(j) * h^2;
            break
        end
    end
end
x0(100) = [];
y2(100) = 0.8;
figure(1)
plot(x2 ,y2);
hold;
scatter(x2 ,y2 ,8 ,'filled');
legend('function' ,'y2');
figure(2)
plot(x2 ,y2);
hold;
scatter(x2 ,y2 ,8 ,'filled');
scatter(x0 ,y3 ,8 ,'filled');
legend('function' ,'y2' ,'y3');
for m = 1:100
    if y2(m) == max(y2)
        fprintf("y2最大值对应的x2值为：%d\n" ,x2(m))
    end
end
for n = 1:99
    if abs(y3(n)) == min(abs(y3))
        fprintf("y3绝对值最小值对应的x2值为：%d\n" ,x2(n))
    end
end
end