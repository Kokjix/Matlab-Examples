% Q1a
clc;
clear all;
close all;

F2y = 500; % N
F2z = 300;

% mm
a = 5 * 0.1;
b = 2.5 * 0.1;
c = 2 * 0.1;

% N*mm
M2 = (F2y-F2z)*a;

% mm^4
Iyy = ((c^3)*b)/12;
Izz = ((b^3)*c)/12;

% MPa
E = 2*10^5;

% In Y axis
ky_global = (E*Iyy/a^3)*beam_stiffness(a);

Fy_global_reduced = [F2y M2]';
ky_global_reduced = ky_global(3:4,3:4);

d2y = ky_global_reduced\Fy_global_reduced; % mm

% In Z axis
kz_global = (E*Izz/a^3)*beam_stiffness(a);
Fz_global_reduced = [F2z M2]';
kz_global_reduced = kz_global(3:4,3:4);
d2z = kz_global_reduced\Fz_global_reduced; % mm

fprintf('Displacement in y: \n')
disp(d2y)

fprintf('\nDisplacement in z: \n')
disp(d2z)

sigma_bend_max = M2*a/Iyy
