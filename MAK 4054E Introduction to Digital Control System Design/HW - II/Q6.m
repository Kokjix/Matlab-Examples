clc;
clear all;
close all;

num = [0.9];
den = [1 -0.5];
h = 0.2;


H = tf(num,den,h);

Gz_op = H;

figure
bode(Gz_op)

figure
nyquist(Gz_op)