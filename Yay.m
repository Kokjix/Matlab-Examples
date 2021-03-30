clc
clear all

m = 1;
k = 10;
b = 10;

num = [1];

den = [1 10 10];

G = tf(num,den)

impulse(G)
title('Output')
hold on
step(G)
grid on

stepinfo(G)