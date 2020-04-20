function lesson7
global I;
I = 0;
global v0;
v0 = -61.816;
CM = 1;
GL = 0.3;
ENa = 50;
GNa = 120;
Ek = -71;
GK = 36;
EL = -55;
%==================================%
m0 =alpham(v0) / (alpham(v0) + betam(v0))
h0 = alphah(v0) / (alphah(v0) + betah(v0))
n0 = alphan(v0) / (alphan(v0) + betan(v0))
%==================================%
I = 0;
[t, u] = ode15s(@f, [0, 100], [v0, m0, h0, n0]);
v = u(:, 1);
m = u(:, 2);
h = u(:, 3);
n = u(:, 4);
iNa = GNa.*u(:, 2).^3 .* u(:, 3) .* (u(:, 1) - ENa);
iL = GL .* (u(:, 1) - EL);
iK = GK .* u(:, 4).^4 .* (u(:, 1) - Ek);
figure(1)
plot(t, u(:, 1));
figure(2)
plot(t, iNa, t, iK, t, iL, t, iNa + iL + iNa);
legend('i_{Na}','i_K','i_L','i_{Na}+i_K+i_L')
%=======================================================%
I = 1;
[t, u] = ode15s(@f, [0, 100], [v0, m0, h0, n0]);
figure(3)
plot(t, u(:, 1));
xlabel('时间t');
ylabel('薄膜电势v');
%=================================================%
I = 10;
[t, u] = ode15s(@f, [0, 100], [v0, m0, h0, n0]);
figure(4)
plot(t, u(:, 1));
xlabel('时间t');
ylabel('薄膜电势v');
%===============================================%
[t, u] = ode15s(@f4, [0, 100], [v0, m0, h0, n0]);
figure(5)
plot(t, u(:, 1));
xlabel('时间t');
ylabel('薄膜电势v');
end
function du = f(t, u)
global I;
v0 = -61.816;
CM = 1;
GL = 0.3;
ENa = 50;
GNa = 120;
Ek = -71;
GK = 36;
EL = -55;
v = u(1);
m = u(2);
h = u(3);
n = u(4);
dv = 1 / CM .* [I - GL * (v - EL) - GNa .* m.^3 .* h .* (v - ENa) - GK .* n.^4 .*(v - Ek)];
dm = alpham(v) .* (1 - m) - betam(v) .*m;
dh = alphah(v) .* (1 - h) - betah(v) .* h;
dn = alphan(v) .* (1 - n) - betan(v) .* n;
du = [dv; dm; dh; dn];
end
function du = f4(t, u)
global I;
global v0;
I = 10 .* sin(t);
CM = 1;
GL = 0.3;
ENa = 50;
GNa = 120;
Ek = -71;
GK = 36;
EL = -55;
v = u(1);
m = u(2);
h = u(3);
n = u(4);
dv = 1 / CM .* [I - GL * (v - EL) - GNa .* m.^3 .* h .* (v - ENa) - GK .* n.^4 .* (v - Ek)];
dm = alpham(v) .* (1 - m) - betam(v) .* m;
dh = alphah(v) .* (1 - h) - betah(v) .* h;
dn = alphan(v) .* (1 - n) - betan(v) .* n;
du = [dv; dm; dh; dn];
end
function y = alpham(v)
v0 = -61.816;
y = (2.5 - 0.1 .* (v - v0)) ./ (exp(2.5 - 0.1 .* (v - v0)) - 1);
end
function y = alphah(v)
v0 = -61.816;
y = 0.07 .* exp(-0.05 .* (v - v0));
end
function y = alphan(v)
v0 = -61.816;
y = (0.1 - 0.01 .* (v - v0)) ./ (exp(1 - 0.1 .* (v - v0)) - 1);
end
function y = betam(v)
v0 = -61.816;
y = 4.*exp(-0.055 .* (v - v0));
end 
function y = betah(v)
v0 = -61.816;
y = 1 ./ (exp(3 - 0.1 .* (v - v0)) + 1);
end
function y = betan(v)
v0 = -61.816;
y = 0.125 .* exp(-0.0125 .* (v - v0));
end