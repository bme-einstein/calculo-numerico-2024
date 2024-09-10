clc

f = @(x,y) 2*x.*y+2*x-x.^2-2*y.^2;
fx = @(x,y) (2*y+2-2*x);
fy = @(x,y) (2*x-4*y);

x_ant = -1;
y_ant = 1;

H = [-2, 2;
     2, -4];

x_new = 0;
y_new = 0;

count = 1;

while (count < 3)
  count
  grad_ = [fx(x_ant, y_ant);
           fy(x_ant, y_ant)]
  H_inv = inv(H);

  X_ant = [x_ant; y_ant];
  X_new = X_ant - H_inv*grad_

  e_x = abs((x_new - x_ant)/x_new)
  e_y = abs((y_new - y_ant)/y_new)
  if (e_x < 0.05) && (e_y < 0.05) && ...
    (abs(fx(x_new, y_new))<0.05) && (abs(fy(x_new, y_new))< 0.05)
    break;
  endif

  x_ant = X_ant(1);
  y_ant = X_ant(2);

  count = count + 1;
endwhile

