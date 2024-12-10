clear all
close all
clc

T = 0.1; #s
T_final = 50; #s
t = 0:T:T_final; #intervalo de simulação

N = length(t); #número de elementos do vetor t
v = zeros(1, N); #inicializando o vetor v da velocidade
vd = zeros(1, N); #inicializando o vetor vd das derivadas da velocidade

for ii = 1:N-1
  # PREDITOR: método de euler
  vd(ii) = 9.81 - v(ii)/7; # g - c/m*v
  v(ii+1) = v(ii) + vd(ii)*T;
  # ajustando com o método de heun

  v(ii+1) = ???
endfor

t_analitica = 0:0.1:T_final;
v_solucao_edo = 9.81*70/10*(1-exp(-10/70*t_analitica));

plot(t, v, 'b--', 'linewidth', 1.3)
hold on
plot(t_analitica, v_solucao_edo, 'k', 'linewidth', 1.3)
grid on
xlabel('tempo [s]', 'fontsize', 18)
ylabel('v [m/s]', 'fontsize', 18)
hold off
