function [raiz,fx, ea, iter] = bissec(func,xl,xu,es,maxit,varargin)
## call: 
## bissec: localização de raízes pelo método da bissecção
## [raiz,fx,ea,iter]=bisect(func,xl,xu,es,maxit,p1,p2,...): usa o método da bissecção para encontrar a raiz de func
## entrada:
##    func = nome da função
##    xl, xu = aproximações inferior e superior
##    es = erro relativo desejado (padrão = 0,0001%)
##    maxit = número máximo de iterações permitidas (padrão = 50)
##    p1,p2,... = parâmetros adicionais usados por func
## saída:
##    raiz = raiz real
##    fx = valor da função em raiz
##    ea = erro relativo aproximado (%)

if nargin<3,error('são necessários pelo menos 3 argumentos de entrada'),endif

test = func(xl,varargin{:})*func(xu,varargin{:});
if test>0,error('não há mudança de sinal'),endif
if nargin<4|isempty(es), es=0.0001;endif
if nargin<5|isempty(maxit), maxit=50;endif

iter = 0;	xr = xl;
ea = 100;
while (1)
  xr_velho = xr
  xr = (xl + xu)/2;
  iter = iter + 1;
  if xr ~= 0,ea = abs((xr - xr_velho)/xr) * 100;endif
  test = func(xl,varargin{:})*func(xr,varargin{:});
  if test < 0
    xu = xr;
  elseif test > 0
    xl = xr;
  else
    ea = 0;
  endif

  if ea <= es | iter >= maxit,break,endif

endwhile

raiz = xr; fx = func(xr, varargin{:});

