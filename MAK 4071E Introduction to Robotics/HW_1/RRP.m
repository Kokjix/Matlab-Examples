%%
clc;
close all;
clear all;

syms theta1 theta2 l1 l2 r;

OO1 = [0 0 0]';

% O1O2 = [0 0 l1]';
% O2P1 = [0 l2 0]';
PC = [0 r 0]';

A01 = [1 0 0; 0 1 0; 0 0 1];

A12 = [cos(theta1) -sin(theta1) 0; sin(theta1) cos(theta1) 0; 0 0 1];
A23 = [1 0 0; 0 cos(theta2) -sin(theta2); 0 sin(theta2) cos(theta2)];

A34 = [1 0 0; 0 1 0; 0 0 1];

A02 = A01 * A12;
A03 = A01 * A12 * A23;
A04 = A01 * A12 * A23 * A34;

OC = OO1 + A04 * PC;

%%
clc;
close all;
clear all;

x = zeros(1000000,1);
y = zeros(1000000,1);
z = zeros(1000000,1);
a = 1;
b = 2;

t1lo = -120*pi/180;
t1up = 120*pi/180;
t2lo = -30*pi/180;
t2up = 60*pi/180;

for i = 1:1000000
    r = (b-a)*rand(1) + a;
    theta1 = (t1up-t1lo)*rand(1) + t1lo;
    theta2 = (t2up-t2lo)*rand(1) + t2lo;
    
    x(i) = - r*cos(theta2)*sin(theta1);
    y(i) =  r*cos(theta1)*cos(theta2);
    z(i) =  r*sin(theta2);
end

figure
plot3(x,y,z,'.')
xlabel('x(t)')
ylabel('y(t)')
zlabel('z(t)')
grid on

figure
plot3(x,y,z,'.')
view(0,90)
xlabel('x(t)')
ylabel('y(t)')
zlabel('z(t)')
grid on

figure
plot3(x,y,z,'.')
view(90,0)
xlabel('x(t)')
ylabel('y(t)')
zlabel('z(t)')
grid on

figure
plot3(x,y,z,'.')
view(0,0)
xlabel('x(t)')
ylabel('y(t)')
zlabel('z(t)')
grid on
