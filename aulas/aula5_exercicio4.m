pkg load optim
clc

f = -[150;175];

# x = [x1; x2]
A = [7,  11;
     10,  8;];

b = [77;
     80;];

Aeq = [];
beq = [];

lb = [0; 0];
ub = [9; 6];

[x, fval] = linprog(f, A, b, Aeq, beq, lb, ub)

% Criando a malha de pontos
[x1, x2] = meshgrid(-1:0.1:15, -1:0.1:15);
z = 150*x1 + 175*x2;

% Plot 3D
figure;
subplot(1, 2, 1);
mesh(x1, x2, z);
xlabel('x_1');
ylabel('x_2');
zlabel('z');
title('Gráfico 3D da função');

% Plot 2D com curvas de nível
subplot(1, 2, 2);
contour(x1, x2, z, 20); % 20 níveis de contorno
xlabel('x_1');
ylabel('x_2');
title('Curvas de nível da função');
colorbar;

% Adding constraint lines
hold on;
y1 = (-7/11*x1 + 7) ;
y2 = (-10*x1 + 80) / 8;
y3 = [-20,20];
y4 = ones(size(x1))*6;

plot(x1(1,:), y1(1,:), 'k', 'LineWidth', 2);
plot(x1(1,:), y2(1,:), 'g', 'LineWidth', 2);
plot([9, 9], y3(1,:), 'b', 'LineWidth', 2);
plot(x1(1,:), y4(1,:), 'r', 'LineWidth', 2);

legend('Curvas de nível', 'x_2 <= 7-7/11x_1', 'x_2<=10-10/8x_1', 'x_1<=9', 'x_2<=6');
hold off;

