clc;
clear all;
close all;

z = tf('z');
K = 0.99;
H_z_open = K*10*(z-0.5)/((z-0.2)*(z-1))

% figure
% bode(H_z_open);

H_z_closed = feedback(H_z_open,1)
figure
step(H_z_closed)
figure
pzmap(H_z_closed)


stepinfo(H_z_closed)
