clear;
clc;
close all;

M = csvread("dados_acelerometro_1.csv");

theta = M(33:45,1);
c21 = M(33:45,2);
c32 = M(33:45,3);
c21d = c21-c21(1);
c32d = c32-c32(1);



figure(1)
plot(theta, c21d, "r", theta, c32d, "b")
legend("C12", "C32")

figure(2)
plot(c21d, c32d, "r")