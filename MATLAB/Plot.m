clc
clear all
syms s

F = matlabFunction((s + 18)/((s^3) + 6*(s^2) + 60*s + 312)); 


s =  0:0.01:250;
plot(s,F(s))

grid on