x = 3;
##N = 100;

for N = 1:10
  exp_approx = 0;
  for n = 0:N
    exp_approx = exp_approx + x^n/factorial(n);
  endfor

  exp_approx;
  exp(3);
  N
  erro = exp(x) - exp_approx
endfor
##print('erro = ', erro)
