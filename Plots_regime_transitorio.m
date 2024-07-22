t = 0:1e-3:1;
num = [0 0 100];
dem = [1 12 100];
rampa = lsim(num, dem, t, t);
degrau = step(num, dem, t);
impulso = impulse(num, dem, t);
cosseno = cos(50.*t);
period = lsim(num, dem, cosseno, t);

subplot(312);
plot(t, impulso, 'b');
grid;
title("Plot da resposta ao impulso");
legend('resp.impulso');

subplot(322);
plot(t, rampa, 'r');
grid;
title('Plot da resposa à rampa');
legend('resp.rampa');

subplot(321);
plot(t, degrau, 'g');
grid;
title('Plot da resposta ao degrau');
legend('resp.degrau');

subplot(313);
plot(t, period, 'm');
grid;
title('Plot da resposta periodica');
legend('resp.cos')

