clc;
clear all;
close all;

q1 = 120*pi/180;
q2 = 60*pi/180;
q3 = 270*pi/180;
k = 4000;
A = 5*10^-4;
E = 210*10^9;
L1 = 5;
L2 = 5;

% syms q1 q2 q3 A E L1 L2 k
k1 = (E*A/L1).*stiffness_matrix(q1);
k2 = (E*A/L2).*stiffness_matrix(q2);
k3 = k.*stiffness_matrix(q3);

k_global = zeros(8,8);
% k_global = subs(k_global);
k_global(1:4,1:4) = k1 + k_global(1:4,1:4);
k_global(1:2,1:2) = k2(1:2, 1:2) + k_global(1:2,1:2);
k_global(5:6,5:6) = k2(3:4, 3:4) + k_global(5:6,5:6);
k_global(2,2) = k3(2,2) + k_global(2,2);
k_global(8,2) = k3(4,2) + k_global(8,2);
k_global(2,8) = k3(2,4) + k_global(2,8);
k_global(8,8) = k3(4,4) + k_global(8,8);

fprintf('k1: \n');
disp(k1);
fprintf('k2: \n');
disp(k2);
fprintf('k3: \n');
disp(k3);
fprintf('k_global: \n');
disp(k_global);

% Solution
% k_global_sol = (10^7).*[    1.0500 0.0000 -0.5250 0.9093 0 0 0 0; ...
%                              0.0000 3.1504 0.9093 -1.5750 0 0 0 -0.0004];
k_global_sol = (10^7).*[    1.0500 0.0000; ...
                             0.0000 3.1504];
F = [0 10^5]';

d = k_global_sol\F;
fprintf('Solution d: \n');
disp(d);

sigma1 = (E/L1) .* [-cos(q1) -sin(q1) cos(q1) sin(q1)] * [0 0.0032 0 0]';
sigma2 = (E/L2) .* [-cos(q2) -sin(q2) cos(q2) sin(q2)] * [0 0.0032 0 0]';
sigma3 = k .* [-cos(q3) -sin(q3) cos(q3) sin(q3)] * [0 0.0032 0 0]';

fprintf('sigma 1: \n');
disp(sigma1/1000);
fprintf('sigma 2: \n');
disp(sigma2/1000);
fprintf('sigma 3: \n');
disp(sigma3/1000);