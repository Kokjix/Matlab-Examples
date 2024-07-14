clc;
close all;
clear all;

syms h theta r L1 w2;

OO1 = [0 0 0]';
A01 = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
A12 = [1 0 0; 0 1 0; 0 0 1];
A23 = [1 0 0; 0 1 0; 0 0 1];
A02 = A01 * A12;
A03 = A01 * A12 *A23;
O1P1 = [0 0 h]';
P1P2 = [0 L1 0]';
P2C = [0 r 0]';

OC = OO1 + A01 * O1P1 + A02 * P1P2 + A03 * P2C;
disp(OC);

J = jacobian([-r*sin(theta) - L1*sin(theta), r*cos(theta) + L1*cos(theta), h], [theta, r, h])

detJ = det(J)
w2 = solve(detJ, theta)