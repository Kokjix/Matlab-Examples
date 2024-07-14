clc;
clear all;
close all;


a = 1;
th = 0:pi/50:2*pi;
r1 = exp(2*a);
r2 = 1/exp(2*a);

e = zeros(size(th));

x1 = r1*cos(th);
y1 = r1*sin(th);
Z1 = x1 + y1;

x2 = r2*cos(th);
y2 = r2*sin(th);
Z2 = x2 + y2;

figure

plot(x1,y1, x2,y2);

title('Complex Plane');
ylabel('Imag Axis [J]');
xlabel('Real Axis');

grid on