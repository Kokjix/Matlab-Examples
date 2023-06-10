clc;
clear all;
close all;

t = 0:0.0001:2;

y = 0.0502.*exp(-3.51.*t).*cos(42.19.*t+0.0972);

figure

plot(t,y,'r');

title('Vibration');
xlabel('t [s]');
legend('0.0502.*exp(-3.51.*t).*cos(42.19.*t+0.0972)');
grid on