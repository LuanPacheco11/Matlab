% EXEMPLO 6.15 

% planta
num = 1;
den = [1 1 0];
g = tf(num, den);

%constantes
ts = 0.001;
k = [1; 0.01; 1000];
t = 0:0.01:10;
u = t;

num2 = 1
den2 = [1 1 1]

g2 = tf(num2, den2)

step(g2)
grid;
title("Step FTMF")


%% CONTROLADOR
ganho = 10;
numg = ganho.*[1 1.9];
deng = [1 4.6];
cont = tf(numg, deng)

% controlador discreto
disc = c2d(cont, 0.025, 'tustin')

%% JANELAS DE VISUZLIZAÇAÕ 
rltool(g, cont)
sisotool(g, cont)



