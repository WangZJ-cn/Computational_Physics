function lesson12
N = 39;
T = zeros(N,N);
T(:, N) = 100;

for k = 1:1000
    for j = 1:N
        T(1, j) = T(2, j);
        T(N, j) = T(N - 1, j);
    end
    for i = 2 : N-1
        for j = 2 : N-1
            T(i, j) = 0.25 * (T(i - 1, j) + T(i + 1, j) + T(i, j - 1) + T(i, j + 1));
        end
    end
end
x = 1 : N ; y = 1 : N;
figure(1)
surf(x, y, T);
%=========================================%
N = 39;
T2 = zeros(N, N);

for k = 1:1000
    for j = 1 : N
        T2(1, j) = T2(2, j);
        T2(N, j) = T2(N - 1, j);
    end
    for i = 2 : N - 1
        for j = 2 : N - 1
            if i == 20 & j == 20
                T2(i, j) = 0.25 * (T2(i - 1, j) + T2(i + 1, j) + T2(i, j - 1) + T2(i, j + 1)) + 100 * 0.25;
            else
                T2(i, j) = 0.25 * (T2(i - 1, j) + T2(i + 1, j) + T2(i, j - 1) + T2(i, j + 1));
            end
        end
    end
end
x2 = 1 : N ; y2 = 1 : N;
figure(2)
surf(x2, y2, T2);
end