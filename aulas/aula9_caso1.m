clear all
close all
fontsize_text = 18

t = 1:15;
vi = [10, 16.3, 23, 27.5, 31, 35.6,  39, 41.5, 42.9, 45, 46, 45.5, 46, 49, 50]

plot(t, vi, 'o')

n = length(vi);

m = 68.1; c = 12.5; g = 9.81;
v_exp = g*m/c*(1-exp(-c/m*t));
v_emp = g*m/c*t.*(3.75+t).^-1;

hold on
plot(t, v_exp, 'r')
plot(t, v_emp, 'k')

# analise 1: xi = vi; yi = v_exp;
xi = vi;
yi = v_exp;
n = length(xi);
grid on
xlabel('t [s]', 'FontSize', fontsize_text)
ylabel('vel. [m/s]', 'FontSize', fontsize_text)
xlim([0,16])
legend('vi', 'v_{exp}', 'v_{emp}', 'Location', 'southeast', 'FontSize', 14)
hold off

a1 = (n*xi*yi' - sum(xi)*sum(yi))/(n*sum(xi.^2)-(sum(xi)^2))
a0 = mean(yi) - a1*mean(xi)

St_exp = sum((yi - mean(yi)).^2)
Sr_exp  = sum((yi-(a0+a1*xi)).^2)
r2_exp  = (St_exp-Sr_exp)/St_exp
s_yx_exp  = sqrt(Sr_exp/(n-2))
s_y_exp  = sqrt(St_exp/(n-1))

figure(2)
plot(vi, v_exp, 'kx')
hold on
title('Modelo Exponencial (EDO)', 'FontSize', fontsize_text+2)
plot(vi, a0+a1*vi, 'k', 'LineWidth', 1.2)
xlim([0, 60])
ylim([0, 60])
text(35, 10, strcat('r2 = ',num2str(r2_exp)), 'FontSize', fontsize_text)
text(35, 6, strcat('s_{y/x, exp} = ',num2str(r2_exp)), 'FontSize', fontsize_text)
grid on
xlabel('vel. medida [m/s]', 'FontSize', fontsize_text)
ylabel('vel. modelo exp. [m/s]', 'FontSize', fontsize_text)
plot(1:60, 1:60, 'b--')
hold off


# analise 2: xi = vi; yi = v_emp;
xi = vi;
yi = v_emp;
n = length(xi);

a1 = (n*xi*yi' - sum(xi)*sum(yi))/(n*sum(xi.^2)-(sum(xi)^2))
a0 = mean(yi) - a1*mean(xi)

St_emp = sum((yi - mean(yi)).^2)
Sr_emp  = sum((yi-(a0+a1*xi)).^2)
r2_emp  = (St_emp-Sr_emp)/St_emp
s_yx_emp  = sqrt(Sr_emp/(n-2))
s_y_emp  = sqrt(St_emp/(n-1))

figure(3)
plot(vi, v_emp, 'kx')
hold on
title('Modelo empírico', 'FontSize', fontsize_text+2)
plot(vi, a0+a1*vi, 'k', 'LineWidth', 1.2)
xlim([0, 60])
ylim([0, 60])
text(35, 10, strcat('r2 = ',num2str(r2_emp)), 'FontSize', fontsize_text)
text(35, 6, strcat('s_{y/x, emp} = ',num2str(r2_emp)), 'FontSize', fontsize_text)
grid on
xlabel('vel. medida [m/s]', 'FontSize', fontsize_text)
ylabel('vel. modelo emp. [m/s]', 'FontSize', fontsize_text)
plot(1:60, 1:60, 'b--')
hold off

