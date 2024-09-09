function [raiz, fx, ea, iter] = aula_2_bisseccao_algo_2(xl,xu,es,imax)

  % esse código adiciona linhas em aula_2_bisseccao_algo.m para tornar
  % o processo de cálculo mais eficiente.

  n_iter = 0;
  xr = 0;

  fl = myfunc(xl); %%%%%%%%%%%%%%

  t0 = tic;

  while(1)
    xl
    xu
    xr_ant = xr
    xr = (xl+xu)/2

    fr = myfunc(xr); %%%%%%%%%%%%%



    n_iter = n_iter+1;
    if xr ~= 0
      ea = abs((xr-xr_ant)/xr)*100
    endif
    test = fl*fr
    if test < 0
      xu = xr;
    elseif test > 0
      xl = xr;
      fl = fr;
    else
      ea = 0;
    endif
    disp('')

    if ea < es || n_iter >= imax
      fx = myfunc(xr);
      raiz = xr;
      iter = n_iter;
      toc(t0);
      break;
    endif

  endwhile

endfunction


function f_x = myfunc(x)
##  f_x = 4*x-16;
  f_x = sin(10*x)+cos(3*x);
endfunction
