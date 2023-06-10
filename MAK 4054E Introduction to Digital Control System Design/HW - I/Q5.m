clc;
clear all;
close all;

% syms Kp Ti s
s = tf('s');
Kp = 1.765; % 1.765
Ti = 1;
Td = 0.01;

num = [1];
den = [0.1 1 0];
C = Kp*(Ti*s + 1 + Ti*Td*s^2)/(Ti*s);

G = tf(num,den);

open_loop = C*G;

% figure
% bode(open_loop)
% grid on

closed_loop = feedback(open_loop,1);

figure
step(closed_loop)
grid on
stepinfo(closed_loop)