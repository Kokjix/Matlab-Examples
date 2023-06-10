clc;
clear all;
close all;

syms z k

X1_z = (z+0.25)/((z+1)^2);
X11_z = (z/(z+1)) - ((0.75*z)/(z+1)^2);

X1_k = iztrans(X1_z, k)
X11_k = iztrans(X11_z, k)