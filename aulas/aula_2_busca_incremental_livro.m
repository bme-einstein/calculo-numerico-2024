function xb = busca_inc(func,xmin,xmax,ns)
# busca _ inc: busca incremental para localização de raízes
##  xb = busca _ inc(func,xmin,xmax,ns):
##  encontra os subintervalos de x que contêm mudanças de sinal
##  de uma função em um intervalo
##entrada:
##  func = nome de uma função
##  xmin, xmax = extremidades do intervalo
##  ns = número de subintervalos (default: 50)
##saída:
##  xb(k, 1): limite inferior da k-ésima mudança de sinal
##  xb(k, 2): limite superior da k-ésima mudança de sinal
##  Se nenhum subintervalo foi encontrado, xb = [].
if nargin < 3
  error('são necessários pelo menos 3 argumentos');
endif

if nargin < 4
   ns = 50; %se ns é vazio, ele é definido como 50
endif

% Busca incremental
x = linspace(xmin,xmax,ns);
f = func(x);
nb = 0;
xb = []; %xb é nulo a menos que seja detectada mudança de sinal for k = 1:length(x)-1

t_init = tic;

for k = 1:length(x)-1
  if sign(f(k)) ~= sign(f(k+1)) %verifica se há mudança de sinal
    nb = nb + 1;
    xb(nb,1) = x(k);
    xb(nb,2) = x(k+1);
  endif
endfor

t_end = toc(t_init);

if isempty(xb) %exibe que nenhum subintervalo foi encontrado
  disp('nenhum subintervalo encontrado')
  disp('verifique o intervalo ou aumente ns')
else
  disp('número de subintervalos:') %exibe o número de subintervalos
  disp(nb)

  plot(x, f)
  my_roots = (xb(:,1)+xb(:,2))/2
  hold on
  plot(my_roots, zeros(length(my_roots),1), 'o');
  hold off

end

disp('Essa busca levou um total de [s]:')
disp(t_end)

