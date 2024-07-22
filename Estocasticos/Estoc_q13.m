dados = [1 5 1 2 2.5 2 2.5 1.5 6.5 2.5 10 2.5 2 2 1.5 1];

% Parâmetros

%lambda = mean(dados); % Taxa de chegada
lambda = 1

% Gerar amostras do processo aleatório
D = poissrnd(lambda, 1, 50);

% Calcular a soma acumulada
S = cumsum(D);

% Plotar função-amostra
figure;
subplot(2, 1, 1);
plot(S);
title('Função-Amostra para Poisson');
xlabel('Tempo');
ylabel('Valor');

% Plotar função cumulativa
subplot(2, 1, 2);
ecdf(S);
title('Função Cumulativa (CDF) para Poisson');
xlabel('Valor');
ylabel('Probabilidade');