clear;
close all;
clear;

Eq = csvread("acelerometro_eq_pontos.csv");

C12 = Eq(1:114,1)';
C32 = Eq(115:228,1)';

C21d = C12-C12(1);

C32d = C32-C32(1);

theta = linspace(0, 113, 114);

plot(theta, C21d, 'r', theta, C32d, 'b')