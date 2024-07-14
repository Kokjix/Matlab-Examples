clc;
clear all;
close all;

s = tf('s');

Ga_s = (s+2)/((s-1)*(s+3));

fs = 10;
Ts = 1/fs;

H_z = c2d(Ga_s, Ts,'zoh') 

figure
pzmap(H_z)
figure
pzmap(Ga_s)
figure
pzmap(Ga_s)
hold on
pzmap(H_z)