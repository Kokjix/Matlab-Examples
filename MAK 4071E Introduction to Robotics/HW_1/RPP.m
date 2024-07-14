%%
clc;
close all;
clear all;

syms h theta r;

OO1 = [0 0 0]';
A01 = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
A02 = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
O1P1 = [0 0 h]';
P2C = [0 r 0]';

OC = OO1 + A01 * O1P1 + A02 * P2C;
disp(OC);
% OC(1)

% X = OC(1);
% Y = OC(2);
% Z = linspace(0.5,2.5);
% 
% fsurf(X, Y, Z, [0.5 2.5 -1.57 1.57])

%% 
clc;
close all;
clear all;

x = zeros(1000000,1);
y = zeros(1000000,1);
z = zeros(1000000,1);
a = 0.5;
b2 = 2.5;
b1 = 1.5;
tlo = -90*pi/180;
tup = 90*pi/180;
for i = 1:1000000
    r = (b1-a)*rand(1) + a;
    h = (b2-a)*rand(1) + a;
    theta = (tup-tlo)*rand(1) + tlo;
    
    x(i) = -r * sin(theta);
    y(i) = r * cos(theta);
    z(i) = h;
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



