clc;
clear all;
close all;

num = [0.7];
den = [1 -0.95];
h = 0.01;

H = tf(num,den,h);

Gz_op = H;

figure
bode(Gz_op)