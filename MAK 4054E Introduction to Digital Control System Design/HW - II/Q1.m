clc;
clear all;
close all;

num1 = [2];
den1 = [0.01 1 0];

G1_op = tf(num1,den1);

num2 = [10 1];
den2 = [5 6 1];

G2_op = tf(num2,den2);

figure
bode(G1_op);
title('G1 Open Loop Bode Diagram');
figure
bode(G2_op);
title('G2 Open Loop Bode Diagram');

G1_cl = feedback(G1_op,1);
G2_cl = feedback(G2_op,1);

figure
step(G1_cl);
figure
step(G2_cl);

G1_cl_step = stepinfo(G1_cl);
G2_cl_step = stepinfo(G2_cl);

% damp(G1_cl);
% damp(G2_cl);

h1 = G1_cl_step.SettlingTime/4;
h2 = G2_cl_step.SettlingTime/4;
fprintf('\nG1 sampling period: \n');
disp(h1);
fprintf('G2 sampling period: \n');
disp(h2);

H1 = c2d(G1_op,h1,'zoh');
H2 = c2d(G2_op,h2,'zoh');

[p1,z1] = pzmap(H1)
[p2,z2] = pzmap(H2)
figure
bode(H1);
title('H1 Open Loop Bode Diagram');
figure
bode(H2);
title('H2 Open Loop Bode Diagram');

figure
nyquist(H1);
title('H1 Nyquist Plot');
figure
nyquist(H2);
title('H2 Nyquist Plot');