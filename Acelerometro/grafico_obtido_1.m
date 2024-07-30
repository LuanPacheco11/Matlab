clear;
clc;
close all;

M = csvread("dados_acelerometro_1.csv");

theta = M(33:45,1);
c21 = M(33:45,2);
c32 = M(33:45,3);
c21d = c21-c21(1);
c32d = c32-c32(1);


Eq = csvread("acelerometro_eq_pontos.csv");

C12_eq = Eq(1:114,1)';
C32_eq = Eq(115:228,1)';

C21d_eq = C12_eq-C12_eq(1);
C32d_eq = C32_eq-C32_eq(1);

theta_eq = linspace(0, 1.13, 114);


figure(1)
subplot(2,1,1)
plot(theta_eq, C21d_eq, 'r', theta_eq, C32d_eq, 'b')


subplot(2,1,2)
plot(theta, c21d, "r", theta, c32d, "b")
legend("C12", "C32")

figure(2)
subplot(2,1,1)
plot(C21d_eq, C32d_eq, "r")
subplot(2,1,2)
plot(c21d, c32d, "r")