close all
clear all
clc

x = 0:0.01:2;

f = @(x)(x.^2);

% aproximação 1: n = 1; de 0 a 2 -> h = 2
h = 2;
f_integral = 2^3/3
f1_1_integral = h/2*(f(0)+f(2))

% aproximação 2: n = 2; de 0 a 1 e 1 a 2 -> h = 1
h = 1;
f2_1_integral = h/2*(f(0)+2*f(1)+f(2))

% aproximação 3: n = 4; 0 a 0.5; 0.5 a 1.0; 1.0 a 1.5; 1.5 a 2 -> h = 0.5
h = 0.5;
f3_1_integral = h/2*(f(0) + 2*(f(0.5) + f(1.0) + f(1.5)) + f(2))


n = 50;
a = 0;
b = 2;
x0 = a;
xn = b;
% aproximação 4 (maneira compacta): n = 50 ?
h = (b-a)/n;
xi = x0+h:h:xn-h;
f4_1_integral = h/2*(f(x0) + 2*sum(f(xi)) + f(xn))


%% mesma conta da anterior, mas usando um for
n = 50;
a = 0;
b = 2;
x0 = a;
xn = b;
h = (b-a)/n;
minha_integral = 0;
minha_integral = minha_integral + f(xn)*h/2 + f(x0)*h/2;
for xj = x0+h:h:xn-h
  minha_integral = minha_integral + f(xj)*h;
endfor
minha_integral

plot(x, f(x))
hold on
plot(x, 2*x,'r')
grid on
xlabel('x')
ylabel('y')
legend('y=x^2', 'y = 2*x', 'location', 'southeast')
hold off
