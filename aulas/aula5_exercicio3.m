pkg load optim
clc

f = [6; 2];

# x = [x1; x2]
A = [-10, -1;
     -5,  -4;
     -3,  -7;
     -1, -12;];

b = [-10;
     -20;
     -21;
     -12];

[x, fval] = linprog(f, A, b)

% Criando a malha de pontos
[x, y] = meshgrid(-5:0.1:15, -5:0.1:15);
z = 6*x + 2*y;

% Plot 3D
figure;
subplot(1, 2, 1);
mesh(x, y, z);
xlabel('x');
ylabel('y');
zlabel('z');
title('Gráfico 3D da função');

% Plot 2D com curvas de nível
subplot(1, 2, 2);
contour(x, y, z, 20); % 20 níveis de contorno
xlabel('x');
ylabel('y');
title('Curvas de nível da função');
colorbar;

% Adding constraint lines
hold on;
y1 = (-10*x + 10) / 1;
y2 = (-5*x + 20) / 4;
y3 = (-3*x + 21) / 7;
y4 = (-1*x + 12) / 12;

plot(x(1,:), y1(1,:), 'k', 'LineWidth', 2);
plot(x(1,:), y2(1,:), 'g', 'LineWidth', 2);
plot(x(1,:), y3(1,:), 'b', 'LineWidth', 2);
plot(x(1,:), y4(1,:), 'r', 'LineWidth', 2);

legend('Curvas de nível', 'y1: -10x + y = 10', 'y2: -5x + 4y = 20', 'y3: -3x + 7y = 21', 'y4: -x + 12y = 12');
hold off;

