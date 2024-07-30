clear;
clc;
close all;

M = csvread("dados_acelerometro_1.csv");

% Adquire os dados medidos do acelerometro
theta = M(33:45,1);
c21 = M(33:45,2);
c32 = M(33:45,3);
c21d = c21-c21(1);
c32d = c32-c32(1);


% deixa os dados medidos na mesma proporção dos modelados
theta = linspace(0, 0.103, 13); 

Eq = csvread("acelerometro_eq_pontos.csv");

% Adquire os dados modelados do acelerometro
C12_eq = Eq(1:103,1)'*10;
C32_eq = Eq(115:217,1)'*10;

C21d_eq = C12_eq-C12_eq(1);
C32d_eq = C32_eq-C32_eq(1);

theta_eq = linspace(0, 0.103, 103);


% Plot dos dois dados comparando a capacitancia com o angulo
figure(1)
title("Capacitancia pelo angulo(°)")
subplot(2,1,1)
plot(theta_eq, C21d_eq, 'r', theta_eq, C32d_eq, 'b')
subtitle("Modelado")
xlabel("Angulo (°)")
ylabel("Capacitancia (pF)")
subplot(2,1,2)
plot(theta, c21d, "r", theta, c32d, "b")
subtitle("Obtidos")
xlabel("Angulo (°)")
ylabel("Capacitancia (pF)")

% Plot comparando a variacao entre eles
figure(2)
title("Variação C1 por C2")
subplot(2,1,1)
plot(C21d_eq, C32d_eq, "r")
title("Modelada")
xlabel("C2")
ylabel("C1")

subplot(2,1,2)
plot(c21d, c32d, "r")
title("Obtido")