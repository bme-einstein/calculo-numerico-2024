close all
clear all
clc

tempo = [0, 1, 2, 3, 4, 5, 10, 15, 20, 24];
fluxo = [15, 14, 12, 11, 9, 8, 5, 2.5, 2, 1];


plot(tempo, fluxo, 'o')
hold on
grid on
xlabel('t [h]', 'fontsize', 15)
ylabel('Fluxo [mg/cm^2/h]', 'fontsize', 15)


# progressiva
dv_dt_prog = zeros(1, length(tempo)-1)

##df = @(xi, xi_mais_1, h)((fluxo(xi_mais_1)-fluxo(xi))/(xi_mais_1-xi))

for ii = 1:length(tempo)-1
  ii
  dv_dt_prog(ii) = (fluxo(ii+1)-fluxo(ii))/(tempo(ii+1)-tempo(ii));
  dv_dt_prog(ii)
##  plot(tempo, dv_dt_prog(ii)*(tempo-tempo(ii))+fluxo(ii), 'r')
endfor

# regressiva
dv_dt_reg = zeros(1, length(tempo)-1);

for ii = 2:length(tempo)
  ii
  dv_dt_reg(ii-1) = (fluxo(ii)-fluxo(ii-1))/(tempo(ii)-tempo(ii-1));
  dv_dt_reg(ii-1)
##  plot(tempo, dv_dt_prog(ii)*(tempo-tempo(ii))+fluxo(ii), 'k')
endfor

hold off
