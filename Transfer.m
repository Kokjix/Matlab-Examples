clc
clear all

num = [1];
den = [1 3 2];

G = tf(num,den);

zeros = roots(num)
kutup = roots(den)

pzmap(G)
grid on
