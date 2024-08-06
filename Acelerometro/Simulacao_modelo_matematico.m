clc;
clear;
close all;

% Metade da espessura da placa
e_placa = 0.4e-3;

% Tamanho gap
d_esp = 0.2e-3; % Distancia real do gap encontrada por comparacao dads curvas


d_1 = d_esp + e_placa;

K = 2.635e-3;
R = 2.25e-2;

e0 = 8.85418782e-12;

x = K:0.0001:(K+2*R);


% Integra para todo theta entre 0 e 0.1029 graus
N=0;
for theta=0:0.0001:0.1029
    
    p = theta*(pi/180);
    a = sin(p);

    num1 = e0*2*sqrt(R^2-(x-(R+K)).^2);
    den1 = d_1-(a.*(x+K)+e_placa/cos(p));
    y1 = num1./den1;
    
    num2= e0*2*sqrt(R^2-(x-(R+K)).^2);
    den2= d_1+(a.*(x+K)-e_placa/cos(p));
    y2 = num2./den2;
    
    % Calcula a integral
    N=N+1; % Indice

    avg_y1=y1(1:length(x)-1) + diff(y1)/2;
    A = sum(diff(x).*avg_y1);
    C1(N) = A;

    avg_y2=y2(1:length(x)-1) + diff(y2)/2;
    B = sum(diff(x).*avg_y2);
    C2(N) = B;
end

x = 0:0.0001:0.1029; % Faixa em graus que trabalhamos fisicamente

C1 = C1 - C1(1); % Deslocando a curva para a origem
C2 = C2 - C2(1); %

figure(1)
plot(x, C1, 'r', x, C2, 'b')
subtitle('Dados Esperados')
ylabel('Capacitancia')
xlabel("Angulo (°)")


% Dados obtidos
M = csvread("dados_acelerometro_1.csv");

% Adquire os dados medidos do acelerometro
theta = M(33:45,1);
c21 = M(33:45,2);
c32 = M(33:45,3);
c21d = c21-c21(1);
c32d = c32-c32(1);


% deixa os dados medidos na mesma proporção dos modelados
theta = linspace(0, 0.103, 13); 

% Plot dos dois dados comparando a capacitancia com o angulo
figure(2)
title("Capacitancia pelo angulo(°)")
plot(theta, c21d, "r", theta, c32d, "b")
subtitle("Obtidos")
xlabel("Angulo (°)")
ylabel("Capacitancia (pF)")


C1_norm = C1*10^12; % Valores normalizados para ser medido em pF
C2_norm = C2*10^12; % 
figure(3)
plot(theta, c21d, "r", theta, c32d, "r", x, C1_norm, "b", x, C2_norm, "b")
