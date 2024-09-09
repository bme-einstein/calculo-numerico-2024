## secante
f = @(x)(2*x^3-11.7*x^2+17.7*x-5);
x_ant = 1.5;
x_ant_ant = 1.4;

while(1)
  disp('f_ant = ')
  f(x_ant)
  disp('f_ant_ant = ')
  f(x_ant_ant)
  x_new = x_ant - (f(x_ant)*(x_ant_ant-x_ant))/(f(x_ant_ant)-f(x_ant))
  ea = abs((x_new-x_ant)/x_new)*100
  x_ant_ant = x_ant;
  x_ant = x_new;
  disp('')
  if(abs(ea) < 5)
    break
  end
endwhile
