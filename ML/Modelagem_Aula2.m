%% Aula 2: Diagramas de blocos
%% Questão 1
num1 = 10;
den1 = [1 2 10];

num2 = 5;
den2 = [1 5];

[num, den] = series(num1,den1,num2,den2);
printsys(num,den)

[num, den] = parallel(num1,den1,num2,den2);
printsys(num,den)

[num,den] = feedback(num1,den1,num2,den2);
printsys(num,den)

%% Questão 2

numg = 1; deng = [500 0 0];
numc=[1 1]; denc=[1 2];

[num1, den1] = series(numg, deng, numc, denc);
[num, den]=cloop(num1, den1, -1);
printsys(num, den)

%% Espaço de estados 

%% Questao 1

num = 1;
den = [1 14 56 160];

[A, B, C, D] = tf2ss(num, den)

[num, den] = ss2tf(A, B, C, D)
printsys(num, den)

%% Questão 2

A = [0 1 0; 0 0 1; -5 -25 -5];
B = [0; 25; -120];
C = [1 0 0];
D = 0;

[num, den] = ss2tf(A, B, C, D)
printsys(num, den)

%% Questão 3

A = [-1 1 0; 0 -1 1; 0 0 -2];
B = [0; 0; 1];
C = [1 0 0];
D = 0;

[num,den] = ss2tf(A, B, C, D);
printsys(num, den)

%% Questão 4















