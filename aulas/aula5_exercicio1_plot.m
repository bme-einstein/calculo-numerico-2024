% Definindo a função analítica
##f = @(x, y) sin(x).*cos(y);
f = @(x, y) 2*x.*y+2*x-x.^2-2*y.^2;

% Criando a malha de pontos
[x, y] = meshgrid(-5:0.1:5, -5:0.1:5);
z = f(x, y);

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

