%%%% Newton-Raphson
f = @(x)(2*x^3-11.7*x^2+17.7*x-5);
fd = @(x)(6*x^2-23.4*x+17.7);
x_ant = 4;

while(1)
  disp('f = ')
  f(x_ant)
  disp('fd = ')
  fd(x_ant)
  x_new = x_ant - f(x_ant)/fd(x_ant)
  ea = abs((x_new-x_ant)/x_new)*100
  x_ant = x_new;
  disp('')
  if(ea < 1)
    break
  end
endwhile
