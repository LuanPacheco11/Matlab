num = 6;
den = poly([-10, -3, -0.2]);

[r,p,k] = residue(num, den)

k = 1
g = tf(num, den)
H = feedback(g,k)