clc;
clear all;
close all;

z = tf('z');

Ko = -1;

H = Ko*(z+0.77)/((z+1)*(z-0.61));
% Gs = d2c(H)
figure
rlocus(H)

Kp = -0.959;
Gc = Kp;
Ha = 0.22*(z+0.77)/((z+1)*(z-0.61));

Ha_op = Gc*Ha;
[pa,za] = pzmap(Ha_op)
Ha_cl = feedback(Ha_op,1);

figure
pzmap(Ha_cl)

figure
step(Ha_cl)

figure
nyquist(Ha_op)