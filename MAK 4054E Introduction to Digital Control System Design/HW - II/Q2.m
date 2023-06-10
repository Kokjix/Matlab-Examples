clc;
clear all;
close all;

s = tf('s');
z = tf('z');


Y_s = 5*(s+2);
U_s = (s+1)*(s+5)*(s+15);

Ga_s_op = Y_s/U_s;

Ga_s_cl = feedback(Ga_s_op,1);

figure
step(Ga_s_cl);
title('G_a(s) Closet Loop Step Response');
Ga_s_cl_resp = stepinfo(Ga_s_cl);

h = Ga_s_cl_resp.SettlingTime/4;

Ha = c2d(Ga_s_op,h,'zoh');
[pa,za] = pzmap(Ha)
figure
pzmap(Ha)

Ha_rlocus = ((z-0.2277)*(z+0.0128))/((z)*(z-1)*(z-0.4531));

figure
rlocus(Ha_rlocus);
grid on

ko = 0.401;
bo = ko/0.09145;
b1 = bo*(-0.0191);
b2 = 0;
Kd = b2*h;
Kp = (2*Kd/h) - b1;
Ki = (-Kp + bo)/h;


Gc_z = (bo + b1*(z^-1) + b2*(z^-2))/(1 - (z^-1));

% tracking control
Gw_z = feedback(Gc_z*Ha,1);
figure
step(Gw_z)
title('G_w(z) Closed Loop Step Response')

% set-point control
v_s = 1/s;
Gv_z = c2d(Ga_s_op*v_s,h,'zoh')/(1 + (Gc_z*Ha));
figure
step(Gv_z)
title('G_v(z) Closed Loop Step Response')