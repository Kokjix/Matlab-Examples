clc;
clear all;
close all;

E = 28*10^3;

A1 = 2*4;
A6 = A1;
A2 = 0.625*8;
A3 = A2;
A4 = A2;
A5 = A2;

L1 = 2;
L2 = 8;
L3 = L2;
L4 = L2;
L5 = L2;
L6 = 2;

k1 = E*A1/L1;
k2 = E*A2/L2;
k3 = E*A3/L3;
k4 = E*A4/L4;
k5 = E*A5/L5;
k6 = E*A6/L6;

k_global = [k1+k3+k3+k4+k5 -k2-k3-k4-k5 0; ...
            -k2-k3-k4-k5 k2+k3+k4+k5+k6 -k6; ...
            0 -k6 k6];

F_global = [0 0 500]';

d = k_global\F_global;

disp(d);

k_show = [k1 -k1 0 0;...
    -k1 k1+k3+k3+k4+k5 -k2-k3-k4-k5 0; ...
    0  -k2-k3-k4-k5 k2+k3+k4+k5+k6 -k6; ...
    0 0 -k6 k6];
disp(k_show);