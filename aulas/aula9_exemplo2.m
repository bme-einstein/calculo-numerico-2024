clear all
close all
clc

xi = 1:7;
yi = [0.5, 2.5, 2.0, 4.0, 3.5, 6.0, 5.5];

plot(xi, yi, 'o')
xlim([0, 8])
ylim([0, 8])
grid on
xlabel('x')
ylabel('y')

# MMQ

hold on

n = length(xi)

# grau 1
a = polyfit(xi, yi, 1);
a1 = a(1);
a0 = a(2);
plot(xi, a1*xi+a0, 'r')

disp('grau 1')
St = sum((yi - mean(yi)).^2);
Sr = sum((yi-(a0+a1*xi)).^2);
r2 = (St-Sr)/St
s_yx = sqrt(Sr/(n-2))
s_y = sqrt(St/(n-1))

# grau 2
a = polyfit(xi, yi, 2);
a2 = a(1);
a1 = a(2);
a0 = a(3);
plot(xi, a2*xi.^2+a1*xi+a0, 'k')

disp('grau 2')
St = sum((yi - mean(yi)).^2);
Sr = sum((yi-(a0+a1*xi+a2*xi.^2)).^2);
r2 = (St-Sr)/St
s_yx = sqrt(Sr/(n-2))
s_y = sqrt(St/(n-1))
