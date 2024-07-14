clc;
clear all;
close all;

E = 30*10^6;
A = 2;
L = 60;

k_global = (E*A*4/L).*[ 2 -1 0 0;...
                        -1 2 -1 0;...
                        0 -1 2 -1;
                        0 0 -1 1];
F = [2250 1875 1500 1875]';

u = k_global\F;
fprintf('u: \n');
disp(u);

Rx = (-u(1)*E*4*A/L) - 375;
fprintf('Rx: \n');
disp(Rx);