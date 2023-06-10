clc;
clear all;
close all;

t = linspace(0,2*pi,10000);

x1 = sin(t);

ws = 10;
T_s = 1/ws;

n = ws;

n_1 = 0:T_s:2*pi;

x1_s = sin(n_1);

figure
plot(t,x1);
hold on 
stem(n_1, x1_s, 'k');
title('Sampled and Continous Time Signals x1 = sin(t)')
ylabel('x');
xlabel('time [sec]');
legend('x1', 'x1_s')
grid on

x2 = sin(t) + sin(3*t);
x2_s = sin(n_1) + sin(3*n_1);

figure
plot(t,x2);
hold on 
stem(n_1, x2_s, 'k');
ylabel('x');
xlabel('time [sec]');
legend('x2', 'x2_s')
title('Sampled and Continous Time Signals x2 = sin(t) + sin(3t)')
grid on

