% Q1c
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

% Y axis
ky_global = zeros(6);

ky1 = (E*Iyy/(a/2)^3)*beam_stiffness(a/2);
ky2 = (E*Iyy/(a/2)^3)*beam_stiffness(a/2);

ky_global(1:4, 1:4) = ky1;
ky_global(3:4,3:4) = ky_global(3:4,3:4) + ky2(1:2,1:2);
ky_global(3:6,5:6) = ky2(1:4,3:4);
ky_global(5:6,3:4) = ky2(3:4,1:2);

ky_global_reduced = ky_global(3:6,3:6);

Fy_global_reduced = [0 0 F2y M2]';

d_y_global = ky_global_reduced\Fy_global_reduced

% Z axis
kz_global = zeros(6);

kz1 = (E*Izz/(a/2)^3)*beam_stiffness(a/2);
kz2 = (E*Izz/(a/2)^3)*beam_stiffness(a/2);

kz_global(1:4, 1:4) = kz1;
kz_global(3:4,3:4) = kz_global(3:4,3:4) + kz2(1:2,1:2);
kz_global(3:6,5:6) = kz2(1:4,3:4);
kz_global(5:6,3:4) = kz2(3:4,1:2);

kz_global_reduced = kz_global(3:6,3:6);

Fz_global_reduced = [0 0 F2z M2]';

d_z_global = kz_global_reduced\Fz_global_reduced