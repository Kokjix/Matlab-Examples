clc
clear all
num=[1 13];
den=[1 10 49 312];
G=tf(num,den)
step(G)