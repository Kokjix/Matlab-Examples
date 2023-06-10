% (b) Question 1 with using MATLAB method
clc;
clear all;
close all;

E = 30*10^6;
A1 = 10;
A2 = 12.5;
A3 = 12.5;
A4 = 10;
A5 = 10;
q1 = 90*pi/180;
q2 = -36.869*pi/180;
q3 = -36.869*pi/180;
q4 = 0;
q5 = -90*pi/180;

L1 = 30;
L2 = 25;
L3 = 25;
L4 = 20;
L5 = 15;

F = [0 0 0 -20000]';
k1_global = zeros(8,8);
k2_global = zeros(8,8);
k3_global = zeros(8,8);
k4_global = zeros(8,8);
k5_global = zeros(8,8);


k1 = E*A1/L1 .* stiffness_matrix(q1);
k2 = E*A2/L2 .* stiffness_matrix(q2);
k3 = E*A3/L3 .* stiffness_matrix(q3);
k4 = E*A1/L4 .* stiffness_matrix(q4);
k5 = E*A5/L5 .* stiffness_matrix(q5);

k1_global(1:4, 1:4) = k1;
k2_global(3:6, 3:6) = k2;
k3_global(1:2, 1:2) = k3(1:2, 1:2);
k3_global(5:6, 5:6) = k3(3:4, 3:4);
k4_global(3:4, 3:4) = k4(1:2, 1:2);
k4_global(7:8, 7:8) = k4(3:4, 3:4);
k5_global(5:8, 5:8) = k5;

k_global = k1_global + k2_global + k3_global + k4_global + k5_global;

fprintf('k_global: ');
disp(k_global);

k_global(:,1) = [];
k_global(:,2-1) = [];
k_global(:,5-2) = [];
k_global(:,7-3) = [];

k_global(1,:) = [];
k_global(2-1,:) = [];
k_global(5-2,:) = [];
k_global(7-3,:) = [];

k_modified = k_global;

d = k_modified\F;
d_global = [0 0 d(1) d(2) 0 d(3) 0 d(4)]';
fprintf('displacement: \n');
disp(d_global);

sigma1 = (E/L1) .* [-cos(q1) -sin(q1) cos(q1) sin(q1)] * [0 0 0.0006 -0.0006]';
sigma2 = (E/L2) .* [-cos(q2) -sin(q2) cos(q2) sin(q2)] * [0.0006 -0.0006 0 -0.0025]';
sigma3 = (E/L3) .* [-cos(q3) -sin(q3) cos(q3) sin(q3)] * [0 0 0 -0.0025]';
sigma4 = (E/L4) .* [-cos(q4) -sin(q4) cos(q4) sin(q4)] * [0.0006 -0.0006 0 -0.0035]';
sigma5 = (E/L5) .* [-cos(q5) -sin(q5) cos(q5) sin(q5)] * [0 -0.0025 0 -0.0035]';

sigma = [sigma1 sigma2 sigma3 sigma4 sigma5]';

fprintf('sigma: \n');
disp(sigma)
