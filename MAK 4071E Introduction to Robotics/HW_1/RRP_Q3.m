clc;
close all;
clear all;

syms theta phi L1 L2 r

R1 =[cos(phi) -sin(phi) 0 0; sin(phi) cos(phi) 0 0; 0 0 1 0; 0 0 0 1];
T1 = [1 0 0 0; 0 1 0 0; 0 0 1 L1; 0 0 0 1];
R2 = [1 0 0 0; 0 cos(theta) -sin(theta) 0; 0 sin(theta) cos(theta) 0; 0 0 0 1];
T2 = [1 0 0 0; 0 1 0 L2; 0 0 1 0; 0 0 0 1];
R3 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
T3 = [1 0 0 0; 0 1 0 r; 0 0 1 0; 0 0 0 1];

Ttotal = R1*T1*R2*T2*R3*T3
