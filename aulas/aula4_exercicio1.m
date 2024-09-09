clc

ea = 0.01;
##f = @(x)(2*x+3/x);
fd = @(x)(2-3/x^2);
##fdd = @(x)(6/x^3);

x0 = 1;

while(1)
  x = x0 - fd(x0)/fdd(x0)
  erro = abs((x-x0)/x)
  if  erro < ea
    break;
  endif
  x0 = x;
end


##function fd_val = fd(x)
##  fd_val = 2-3/x^2;
##endfunction
##
##function fdd_val = fdd(x)
##  fdd_val = 6/x^3;
##  endfunction
