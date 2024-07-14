clc;
clear all;
close all;

num = [1];
den = [1 -0.985];
h = 1;

H = tf(num,den,h);

Ko = 1;

H = Ko*H;

figure
bode(H)

numa = [0.1];
dena = [1 -0.985];
Ha = tf(numa,dena,h);
Kp = 14.1416;
Gc = Kp;

Ha_op = Gc*Ha;

% figure
% pzmap(Ha_op)
[pa, za] = pzmap(Ha_op)
figure
nyquist(Ha_op)

