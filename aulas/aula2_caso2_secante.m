## secante
Vinj = 150;
t = 20;
alpha = 0.58;
f = @(x)(Vinj*exp(alpha/x*(1-exp(-x*t))))-1110;
x_ant = 0.5;
x_ant_ant = 0.4;

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
  if(abs(ea) < 0.5)
    break
  end
endwhile
