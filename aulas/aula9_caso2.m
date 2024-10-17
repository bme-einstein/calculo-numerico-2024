T = [0, 5, 10, 15, 20, 25, 30];
c_10 = [12.9, 11.3, 10.1, 9.03, 8.17, 7.46, 6.85];

# grau 1
a = polyfit(T, c_10, 1)

f_c_10 = @(T)(a(1)*T+a(2))
f_c_10(18)

# grau 2
b = polyfit(T, c_10, 2)

f_c_10_grau_2 = @(T)(b(1)*T.^2+b(2)*T + b(3))
f_c_10_grau_2(18)


plot(T, c_10, 'bo-')
hold on
grid on
##xlabel('T [C]')
##ylabel('c_{10} [g/L]')
##
##plot(T, f_c_10(T), 'r')
##plot(18, f_c_10(18), 'ro')
##plot(T, f_c_10_grau_2(T), 'k')
##plot(18, f_c_10_grau_2(18), 'ko')

