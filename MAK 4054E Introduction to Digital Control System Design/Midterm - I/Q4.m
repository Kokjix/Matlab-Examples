clc;
clear all;
close all;

num = [0.3 0.3];
den = [1 -0.9 0.2];
z = tf('z');
T = (0.3*z + 0.3)/(z^2 -0.9*z + 0.2);

zeros = roots(num);
poles = roots(den);
figure
pzmap(T)
grid on

figure
impulse(T)
grid on