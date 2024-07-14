clc;
clear all;
close all;

syms z k

X1_z = 1/((z^2) - 0.1*z);

X1_k = iztrans(X1_z, k);

X2_z = (z+3)/((z^2)-3*z + 2);
X2_k = iztrans(X2_z, k);

X4_z = z/((z-0.7)^2 * (z-1));
X4_k = iztrans(X4_z,k)


% M = [ -1.7 1 -1.4;
%         0.7 -1 0.49;
%         1 0 1];
% n = [1 0 0]';
% 
% S = M\n