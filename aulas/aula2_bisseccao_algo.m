function [raiz,fx, ea, iter] = aula_2_bisseccao_algo(xl,xu,es,imax)

  n_iter = 0;
  xr = 0;

  Ea = [];
##  Et = [];

##  xr_true = 4.7124;

  a = tic;

  while(1)
    xl
    xu
    xr_ant = xr
    xr = (xl+xu)/2
    n_iter = n_iter+1;
    if xr ~= 0
      ea = abs((xr-xr_ant)/xr)*100
##      et = abs((xr-xr_true)/xr_true)*100
      Ea = [Ea ea];
##      Et = [Et et];
    endif
    test = myfunc(xl)*myfunc(xr)
    if test < 0
      xu = xr;
    elseif test > 0
      xl = xr;
    else
      ea = 0;
    endif
    disp('')

    if ea < es || n_iter >= imax
      toc(a);
      fx = myfunc(xr);
      raiz = xr;
      iter = n_iter;
##      Ea
##      Et
##      plot(Ea)
##      hold on
##      plot(Et, 'r')
##      legend('Ea', 'Et')
##      hold off
      break;
    endif

  endwhile

endfunction


function f_x = myfunc(x)
##  f_x = 4*x-16;
##  f_x = sin(10*x)+cos(3*x);
  f_x = 45*(1-exp(-2*x))+10*sin(3*x)-40;
endfunction
