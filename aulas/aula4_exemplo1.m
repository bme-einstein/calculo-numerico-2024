pkg load optim

##f = @(x)(35*x(1)+20*x(2)+40*x(3)+90*x(4)+55*x(5)+77*x(6));
f = [35; 20; 40; 90; 55; 77];

##x = [x11, x12, x13, x21, x22, x23]
x0 = [1, 1, 1, 1, 1, 1]';

## Ax<=b
A = [1, 1, 1, 0, 0, 0;
     0, 0, 0, 1, 1, 1];
b = [50;
     100];

## Aeq*x=beq
Aeq = [1, 0, 0, 1, 0, 0;
       0, 1, 0, 0, 1, 0;
       0, 0, 1, 0, 0, 1];
beq = [20;
       60;
       40];
[x, fval] = linprog(f, A, b, Aeq, beq, lb=zeros(6,1), ub=100*ones(6,1))

custo = f'*x
