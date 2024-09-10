pkg load optim
clc

fun = @(x)(9*x(1)^2+6*x(2)^2+x(3)^2-18*x(1)-12*x(2)-6*x(3)-8);

x0 = [1, 1, 1];

A = [1, 2, 1];
b = [4];

Aeq = [];
beq = [];

lb = [0, 0, 0];
ub = [];

[x_opt,fval] = fmincon(fun, x0, A, b, Aeq, beq, lb, ub);

% Define a grid for x1 and x2
[x1, x2] = meshgrid(0:0.1:2, 0:0.1:2);
x3 = (4 - A(1)*x1 - A(2)*x2) / A(3); % Solve for x3 from the constraint

% Evaluate the function over the grid
z = arrayfun(@(x1, x2, x3) fun([x1, x2, x3]), x1, x2, x3);

% Plot the contour of the function
figure;
contour(x1, x2, z, 20); % 20 contour levels
xlabel('x1');
ylabel('x2');
title('Contour plot of the function with constraint plane');
colorbar;
hold on;

% Plot the constraint plane
surf(x1, x2, x3, 'FaceAlpha', 0.5, 'EdgeColor', 'none');

% Plot the optimal point
plot3(x_opt(1), x_opt(2), x_opt(3), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
hold off;

% Create a new figure for the 3D plot
figure;
surf(x1, x2, x3, 'FaceAlpha', 0.5, 'EdgeColor', 'none');
hold on;

% Plot the function surface
mesh(x1, x2, z);
xlabel('x1');
ylabel('x2');
zlabel('f(x)');
title('3D plot of the function with constraint plane');
colorbar;

% Plot the optimal point
plot3(x_opt(1), x_opt(2), fval, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
hold off;
