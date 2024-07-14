% (b) Question 2 with using MATLAB method
clc;
clear all;
close all;

L1 = 14;
L2 = 7;

E = 29*10^6;
I = 510;
w = 2000;


k1_global = zeros(6,6);
k2_global = zeros(6,6);
F1_global = [0 0 0 0 0 0]';
F2_global = [0 0 0 0 0 0]';

k1 = (E*I/L1^3) .* beam_stiffness(L1); 
k2 = (E*I/L2^3) .* beam_stiffness(L2);

k1_global(1:4, 1:4) = k1;
k2_global(3:6, 3:6) = k2;

k_global = k1_global + k2_global;

k_global_copy = k_global;

fprintf('k_global: ');
disp(k_global);

F1 = [-w*L1/2 -w*(L1^2)/12 -w*L1/2 w*(L1^2)/12]';
F2 = [-w*L2/2 -w*(L2^2)/12 -w*L2/2 w*(L2^2)/12]';

F1_global(1:4) = F1;
F2_global(3:6) = F2;

F_global = F1_global + F2_global;

F_global_copy = F_global;

k_global(:,1) = [];
k_global(:,2-1) = [];
k_global(:,3-2) = [];

k_global(1,:) = [];
k_global(2-1,:) = [];
k_global(3-2,:) = [];

k_modified = k_global;
fprintf('k_global modified: ');
disp(k_modified);

F_global(1:3) = [];
F_modified = F_global;

d_modified = k_modified\F_global;

d_copy = [0 0 0 d_modified(1) d_modified(2) d_modified(3)]';
fprintf('displacemant: \n');
disp(d_copy);



R = k_global_copy * d_copy - F_global_copy;

fprintf('Reaction Forces: \n');
disp(R);
