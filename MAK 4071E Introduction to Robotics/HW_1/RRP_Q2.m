clc;
close all;
clear all;

syms h q1 q2 r L1 L2 w2;

OO1 = [0 0 0]';
A01 = [cos(q1) -sin(q1) 0; sin(q1) cos(q1) 0; 0 0 1];
A12 = [1 0 0; 0 cos(q2) -sin(q2); 0 sin(q2) cos(q2)];
A23 = [1 0 0; 0 1 0; 0 0 1];
A02 = A01 * A12;
A03 = A01 * A12 *A23;
O1O2 = [0 0 L1]';
O2P1 = [0 L2 0]';
P1C = [0 r 0]';

OC = OO1 + A01 * O1O2 + A02 * O2P1 + A03 * P1C;
% disp(OC);

J = jacobian([- L2*cos(q2)*sin(q1) - cos(q2)*r*sin(q1), L2*cos(q1)*cos(q2) + cos(q1)*cos(q2)*r ,  L1 + r*sin(q2) + L2*sin(q2)], ...
              [q1, q2, r])

detJ = det(J)
w2 = solve(detJ, q1, q2, r)
