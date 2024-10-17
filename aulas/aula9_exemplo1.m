clear all
close all

xi = 1:7;
yi = [0.5, 2.5, 2.0, 4.0, 3.5, 6.0, 5.5];

plot(xi, yi, 'o')
xlim([0, 8])
ylim([0, 8])
grid on
xlabel('x')
ylabel('y')

# MMQ
n = length(xi);

##a1 = (n*xi*yi' - sum(xi)*sum(yi))/(n*sum(xi.^2)-(sum(xi)^2))
a1 = (n*sum(xi.*yi) - sum(xi)*sum(yi))/(n*sum(xi.^2)-(sum(xi)^2))
a0 = mean(yi) - a1*mean(xi)

hold on
plot(xi, a1*xi+a0, 'r')

St = sum((yi - mean(yi)).^2)
Sr = sum((yi-(a0+a1*xi)).^2)
r2 = (St-Sr)/St
s_yx = sqrt(Sr/(n-2))
s_y = sqrt(St/(n-1))
