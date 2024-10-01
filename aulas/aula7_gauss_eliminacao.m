function x = aula7_gauss_eliminacao(A, b)
    % Função para resolver o sistema de equações Ax = b usando o método da eliminação de Gauss Ingênua.
    % A é uma matriz n x n e b é o vetor de termos independentes.

    n = length(b);

    % Etapa de eliminação
    A
    for k = 1:n-1
        for i = k+1:n
            fator = A(i,k) / A(k,k)  % Calcula o fator de eliminação
            for j = k+1:n
                A(i,j) = A(i,j) - fator * A(k,j);  % Atualiza os elementos da matriz A
            end
            A
            b(i) = b(i) - fator * b(k);  % Atualiza o vetor b
        end
    end



    % Etapa de substituição retroativa
    x = zeros(n, 1);  % Inicializa o vetor solução
    x(n) = b(n) / A(n,n);  % Calcula o último valor de x

    for i = n-1:-1:1
        soma = b(i);  % Inicializa a soma com o valor bi
        for j = i+1:n
            soma = soma - A(i,j) * x(j);  % Subtrai os termos já conhecidos
        end
        x(i) = soma / A(i,i);  % Calcula o valor xi
    end
end
