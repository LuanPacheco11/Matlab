%% Caminho-Erratico
% Parâmetros
N = 1000; % Número de amostras
p = 0.5; % Probabilidade de movimento para cima

% Gerar amostras do processo aleatório
D = 2 * (rand(1, N) < p) - 1;

% Calcular a soma acumulada
S = cumsum(D);

% Plotar função-amostra
figure;
subplot(2, 1, 1);
plot(S);
title('Função-Amostra para Caminho Errático');
xlabel('Tempo');
ylabel('Valor');

% Plotar função cumulativa
subplot(2, 1, 2);
ecdf(S);
title('Função Cumulativa (CDF) para Caminho Errático');
xlabel('Valor');
ylabel('Probabilidade');

%% Bernoulli

% Parâmetros
N = 1000; % Número de amostras
p = 0.5; % Probabilidade de sucesso

% Gerar amostras do processo aleatório
D = rand(1, N) < p;

% Calcular a soma acumulada
S = cumsum(D);

% Plotar função-amostra
figure;
subplot(2, 1, 1);
plot(S);
title('Função-Amostra para Bernoulli');
xlabel('Tempo');
ylabel('Valor');

% Plotar função cumulativa
subplot(2, 1, 2);
ecdf(S);
title('Função Cumulativa (CDF) para Bernoulli');
xlabel('Valor');
ylabel('Probabilidade');

%% Poisson

% Parâmetros
N = 100; % Número de amostras
lambda = 3.2; % Taxa de chegada

% Gerar amostras do processo aleatório
D = poissrnd(lambda, 1, N);

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