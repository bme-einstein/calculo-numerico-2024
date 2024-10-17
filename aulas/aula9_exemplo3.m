clear all
close all
clc

fontsize_text = 18

t = 1:15;
vi = [10, 16.3, 23, 27.5, 31, 35.6,  39, 41.5, 42.9, 45, 46, 45.5, 46, 49, 50];

plot(t, vi, 'o')

n = length(vi);

m = 68.1; c = 12.5; g = 9.81;
v_exp = g*m/c*(1-exp(-c/m*t));

p_grau2 = polyfit(t, vi, 2);
y_grau2 = p_grau2(1)*t.^2+p_grau2(2)*t+p_grau2(3);

p_grau3 = polyfit(t, vi, 3);
y_grau3 = p_grau3(1)*t.^3+p_grau3(2)*t.^2+p_grau3(3)*t+p_grau3(4);

n = length(t);

a2_grau2 = p_grau2(1);
a1_grau2 = p_grau2(2);
a0_grau2 = p_grau2(3);

St = sum((vi - mean(vi)).^2)
s_y = sqrt(St/(n-1))

disp('Grau 2')
Sr_grau2= sum((vi-(a0_grau2+a1_grau2*t+a2_grau2*t.^2)).^2)
r2_grau2  = (St-Sr_grau2)/St
s_yx_grau2  = sqrt(Sr_grau2/(n-2))

a3_grau3 = p_grau3(1);
a2_grau3 = p_grau3(2);
a1_grau3 = p_grau3(3);
a0_grau3 = p_grau3(4);

disp('Grau 3')
Sr_grau3= sum((vi-(a0_grau3+a1_grau3*t+a2_grau3*t.^2+a3_grau3*t.^3)).^2)
r2_grau3  = (St-Sr_grau3)/St
s_yx_grau3  = sqrt(Sr_grau3/(n-2))

hold on
plot(t, v_exp, 'r')
plot(t, y_grau2, 'b')
plot(t, y_grau3, 'k')
grid on
xlabel('t [s]', 'FontSize', fontsize_text)
ylabel('vel. [m/s]', 'FontSize', fontsize_text)
xlim([0,16])
legend('vi', 'v_{exp}', strcat('grau 2; r^2=', num2str(r2_grau2), '; s_{y/x}=', num2str(s_yx_grau2)), strcat('grau 3; r^2=', num2str(r2_grau3), '; s_{y/x}=', num2str(s_yx_grau3)), 'Location', 'southeast', 'FontSize', 14)
hold off
