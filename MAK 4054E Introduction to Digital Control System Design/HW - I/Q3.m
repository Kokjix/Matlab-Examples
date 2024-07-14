clc;
clear all;
close all;

syms s T1 T2 t

% num = [1 1];
% den = [1 1 0.9];

F = 1/(s*(1+s*T1)*(1+s*T2)^2);

ilaplace(F)
ztrans(ans)