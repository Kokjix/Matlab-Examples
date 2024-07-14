clc;
clear all;
close all;

fs = 10;
h = 1/fs;

% Ko = 1;

z = tf('z', h);

% Gop = Ko/((z-0.9)*(z-0.7))

% figure
% rlocus(Gop)
% grid on

Kp = 0.1901;
Ki = 1.3205;
Kd = 5.685 * 10^-3;

b0 = Kp + Ki*h + (Kd/h);
b1 = -(Kp + (2*Kd/h));
b2 = Kd/h;




Ha = (0.1*z*(z-1))/((z-0.3)*(z-0.5)*(z-0.7)*(z-0.9));

Gc = (b0 + (b1*z^(-1)) + b2*(z^(-2)))/(1-z^(-1));
Gop = Gc * Ha;
Gcl = feedback(Gop,1);


figure
pzmap(Gcl)
grid on