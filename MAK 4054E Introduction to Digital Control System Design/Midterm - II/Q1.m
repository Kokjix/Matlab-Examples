clc;
clear all;
close all;

s = tf('s');

T = 1/((s+5)*(s+4+5i)*(s+4-5i))

T_closed = feedback(T,1);
step(T)
