clc;
close all;
clear all;

syms theta h L1 r
T1 = [cos(theta) -sin(theta) 0 0; sin(theta) cos(theta) 0 0; 0 0 0 h; 0 0 0 1];
T2 = [1 0 0 0; 0 1 0 L1; 0 0 1 0; 0 0 0 1];
T3 = [1 0 0 0; 0 1 0 r; 0 0 1 0; 0 0 0 1];

T = T1*T2*T3