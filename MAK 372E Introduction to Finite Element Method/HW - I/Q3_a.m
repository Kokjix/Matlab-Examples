clc;
clear all;
close all;

E = 30*10^6;
A = 2;
L = 30;

k_global = (E*A/L).*[2 -1;-1 1];

F = [9000 7500]';

u = k_global\F;

fprintf('u: \n');
disp(u);

Rx = -(E*A/L)*u(1) - 1500;

fprintf('Rx: \n');
disp(Rx);
