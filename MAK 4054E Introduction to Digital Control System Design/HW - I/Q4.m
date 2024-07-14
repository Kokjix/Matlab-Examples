clc;
clear all;
close all;

syms z kh

A = (0.85 + 0.61i)/1.22i;

B = (0.85 - 0.61i)/(-1.22i);

G1_z = (A*z/(z-0.35-0.61i)) + (B*z/(z-0.35 - 0.611i));

G1_t = iztrans(G1_z, kh)

C = 1.6;
D = -0.6;
E = -1.6;

G2_z = (C/z) + (D/z^2) + (E/(z-1));

G2_t = iztrans(G2_z, kh)
