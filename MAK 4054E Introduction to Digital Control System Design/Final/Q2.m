clc;
clear all;
close all;

num = [10 1];
den = [1 0 0];

Gsa = tf(num,den);

h = 1;
Hza = c2d(Gsa,h,'zoh');

Kp = 1/10.5;
Gzc = Kp;

Gop = Gzc * Hza;

figure
bode(Gop)

% figure
% nyquist(Gop)