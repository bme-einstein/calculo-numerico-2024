clc
##f = @(x, y) sin(sqrt(x.^2 + y.^2));
##fx = @(x,y) (cos(sqrt(x.^2 + y.^2)).*1/(sqrt(x.^2+y.^2))*2.*x);
##fy = @(x,y) (cos(sqrt(x.^2 + y.^2)).*1/(sqrt(x.^2+y.^2))*2.*y);
##x_ant = 2;
##y_ant = 2;
##alpha = 0.01;
clc

f = @(x,y) 2*x.*y+2*x-x.^2-2*y.^2;
fx = @(x,y) (2*y+2-2*x);
fy = @(x,y) (2*x-4*y);
x_ant = -1;
y_ant = 1;
alpha = 0.001;

count = 1;

while (1)
  x_new = x_ant + alpha*fx(x_ant,y_ant)
  y_new = y_ant + alpha*fy(x_ant,y_ant)
  e_x = abs((x_new - x_ant)/x_new)
  e_y = abs((y_new - y_ant)/y_new)
  if (e_x < 0.05) && (e_y < 0.05) && ...
    (abs(fx(x_new, y_new))<0.05) && (abs(fy(x_new, y_new))< 0.05)
    break;
  endif
  x_ant = x_new;
  y_ant = y_new;
  count = count + 1;
endwhile
count
