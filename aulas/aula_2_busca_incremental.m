function x_roots = aula_2_busca_incremental(xmin,xmax,n)
# busca _ inc: busca incremental para localização de raízes
##  xb = busca_incremental(xmin,xmax,ns):
##  encontra os subintervalos de x que contêm mudanças de sinal
##  de uma função em um intervalo
##entrada:
##  xmin, xmax = extremidades do intervalo
##  ns = número de subintervalos (default: 50)
##saída:
##  xb(k, 1): limite inferior da k-ésima mudança de sinal
##  xb(k, 2): limite superior da k-ésima mudança de sinal
##  Se nenhum subintervalo foi encontrado, xb = [].

% Busca incremental
dx = (xmax-xmin)/n;
x = xmin:dx:xmax;
n_roots = 0;
x_roots = []; %x_roots é nulo a menos que seja detectada mudança de sinal for k = 1:length(x)-1

t_init = tic;

for k = 1:length(x)-1
  if sign(myfunc(x(k))) ~= sign(myfunc(x(k+1))) %verifica se há mudança de sinal
    n_roots = n_roots + 1;
    x_roots(n_roots,1) = x(k);
    x_roots(n_roots,2) = x(k+1);
  endif
endfor

t_end = toc(t_init);

if isempty(x_roots) %exibe que nenhum subintervalo foi encontrado
  disp('nenhum subintervalo encontrado')
  disp('verifique o intervalo ou aumente n')
else
  disp('número de subintervalos:') %exibe o número de subintervalos
  disp(n_roots)

  % plot(x, f)
  % my_roots = (x_roots(:,1)+x_roots(:,2))/2
  % hold on
  % plot(my_roots, zeros(length(my_roots),1), 'o');
  % hold off
end

disp('Essa busca levou um total de [s]:')
disp(t_end)

endfunction

function f_x = myfunc(x)
##  f_x = 4*x-16;
  f_x = sin(10*x)+cos(3*x);
endfunction
