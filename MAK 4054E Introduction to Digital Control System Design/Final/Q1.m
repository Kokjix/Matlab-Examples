clc;
clear all;
close all;

y = [1 2 -1 2 -2 5/3 -19/9 1.62962];
k = [-2 -1 0 1 2 3 4 5];

figure
stem(k,y)
xlabel('k');
ylabel('y')
grid on