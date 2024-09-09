clc
clear all

q = 2.5;
L = 6e2;
E = 5e4;
I = 3e4;

e = 0.01;

y = @(x)(q/(120*E*I*L)*(-x^5+2*L^2*x^3-L^4*x));
yd = @(x)(q/(120*E*I*L)*(-5*x^4+6*L^2*x^2-L^4));
ydd = @(x)(q/(120*E*I*L)*(-20*x^3+12*L^2*x));

x0 = 300;

x = fminbnd(y, 0, L)
y(x)
