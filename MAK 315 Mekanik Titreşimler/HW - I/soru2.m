clc;
clear all;
close all;

t = 0:0.0001:20;
wn = 20.5395;
sonum_orani = 0.1141;
Y0 = 5/100;
T = 6;
w = 2*pi/6;
l = 6;
k = 500;
n = w/wn;
c = 50;
F = [];

phi = atan(-2*sonum_orani*n/(1-n^2));

x = 4*4*Y0*abs(cos(w*t+phi)/(9*k*(l^2)*((1-n^2)^2 + (2*sonum_orani*n)^2)^0.5));
x_dot = diff(x);
for i=1:length(diff(x))
    F(i) = k * x(i) + c * x_dot(i);
end
t(end) = [];

figure

plot(t,F)
title('Zemine aktarılan değişken kuvvet');
ylabel('F [N]');
xlabel('t [sec]');

grid on