%% Questoes da lista 1 Modelagem de Sistemas
%% Questao 1
clc;
clear;
close all;

num = [2 12];
den = [1 2 5];

numsym = poly2sym(num);
densym = poly2sym(den);

F = numsym/densym;
resp = ilaplace(F);

pretty(resp)
fplot(resp)

%% Questao 2
clc;
clear;
close all;

num = [1 2 3 4 5];
den = [1 1 0];

numsym = poly2sym(num);
densym = poly2sym(den);

F = numsym/densym;
resp = ilaplace(F);

pretty(resp)
fplot(resp)

%% Questao 3
% Feita no papel

%% Questao 4
clc;
clear;
close all;

num = poly2sym(3);
den = poly2sym([1 2 5 0]);

f = num/den;

resp = ilaplace(f);

pretty(resp)
fplot(resp)

%% Questao 5
clc;
clear;
close all;

num = poly2sym([6 21]);
den = poly2sym([2 7 3]);

f = num/den;
resp = ilaplace(f);

pretty(resp)
fplot(resp)

%% Questao 6
% Feita no papel

%% Questao 7
clc;
clear;
close all;

syms s t a b e w

num = a*s^2+s*(2*e*w*a-b)-w^2;
den = s^3 + 2*e*w*s^2;

f = num/den;

resp = ilaplace(f, s, t);

pretty(resp)

%% Questao 8
clc;
clear;
close all;

syms s a A w;

num = A*w;
den = s^3+ w^2*s+a*s^2+a*w^2;

f = num/den;
resp = ilaplace(f);

pretty(resp)

%% Questao 9
clc;
clear;
close all;

syms s t;

num = 3;
den = s^2 +3*s^ + 6;

f = num/den;
resp = ilaplace(f);

pretty(resp)
fplot(resp)



