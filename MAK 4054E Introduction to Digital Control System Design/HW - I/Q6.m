clc;
clear all;
close all;

z = tf('z');

h = 0.5;
wn = 4;
zeta = 0.5;
pa1 = -zeta*wn + wn*sqrt(zeta^2 - 1);
pa2 = -zeta*wn - wn*sqrt(zeta^2 - 1);

p1 = exp(pa1*h);
p2 = exp(pa2*h);

G = (1 + 2*z^-1 + z^-2)/((1-p1*z^-1)*(1-p2*z^-1));
impulse(G)
grid on