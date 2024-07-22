%% Questão 7a)

% Parâmetros do motor
R1 = 1;  % Constante de tempo do motor 
k1 = 1;  % Ganho em regime do motor 

A1 = [0 1; 0 -1/R1];
B1 = [0; k1/R1];
C1 = [1 0];
D1 = 0;

G1= ss(A1, B1, C1, D1);

% O sistema
disp('Sistema de espaço de estado:');
G1


%% Questão 7b)

% Parâmetros do motor
R = 0.5;  % Constante de tempo do motor 
k = 2;  % Ganho em regime do motor 
T_s = 0.1;  % Tempo de amostragem

A = [0 1;0 -1/R];
B = [0;k/R];
C = [1 0];
D = 0;

G1 = ss(A, B, C, D);

%sistema discreto
discreto = c2d(G1, T_s);

disp('Sistema discreto:');
discreto

% matrizes do sistema discreto
[A_d, B_d, C_d, D_d] = ssdata(discreto);

%% Questão 7c)

p1 = -1/2 + 1i*sqrt(3)/2;
p2 = -1/2 - 1i*sqrt(3)/2;
p = [p1 p2];
disp("Matriz K:")

% Estimador K 
K = place(A,B,p)

% Sistema de malha fechada
MF = A - B * K;
Polos_MF = eig(MF);

disp('Polos de malha fechada:');
disp(Polos_MF)

%% Questão 7d)

% Polos desejados discreto
PO_D = [0.5, 0.25];

% Estimador L 
L = place(A_d', C_d', PO_D)';

disp('Matriz do Estimador L:');
disp(L)

%% Questão 7e)

% Matriz erro
A_e = A_d - L * C_d;

% Estados iniciais do estimador
x_estimador_0 = [-1; 1]; % [rad, rad/s]

% Estados iniciais do Motor 
x_Motor_0 = [0; 0];

% Estado inicial do erro
e_0 = x_Motor_0 - x_estimador_0;

% Número de passos de tempo
Passos = 15;

% Vetor de erro
Ev_Erro = zeros(2, Passos);
Ev_Erro(:, 1) = e_0;

% Simulação da evolução do erro
for k = 2:Passos
    Ev_Erro(:, k) = A_e * Ev_Erro(:, k-1);
end

time = 0: T_s: (Passos-1)*T_s;

% Plot da evolução do erro
figure;
plot(time, Ev_Erro(1, :), 'black', 'LineWidth', 1.5);
hold on;
plot(time, Ev_Erro(2, :), 'b', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Erro de Estimação');
legend('Erro de posição angular', 'Erro de velocidade angular');
title('Evolução do Erro de Estimação');
grid on;