clc;
clear;
close all;

syms theta1(t) theta2(t)

dtheta1 = diff(theta1);
dtheta2 = diff(theta2);
ddtheta1 = diff(theta1,2);
ddtheta2 = diff(theta2,2);

delta = theta1 - theta2;

tspan = [1 25];
intcon = [pi/24 0 pi/4 0];
L1 = 1;
L2 = 1;
m1 = 2;
m2 = 2;

J1 = m1*(L1^2)/3;
J2 = m2*(L2^2)/3;
J3 = (m2*(L2^2)/12) + m2*(L1 + L2/2)^2;

g = 9.81;

eqn_theta1 = (J1 + J3 + (m1*L1^2/4) + m2*L1)*ddtheta1 + (m2*L1*L2/2)*ddtheta2*cos(delta) + ...
    m2*L1*L2*(dtheta2^2)*sin(delta)/2 + m1*L1*g*sin(theta1)/2 + m2*L1*g*sin(theta1)/2 == 0;

eqn_theta2 = (J2 + m2*L2^2/4)*ddtheta2 + m2*L1*L2*ddtheta1*cos(delta)/2 - m2*L1*L2*(dtheta1^2)*sin(delta)/2 + ...
    m2*L2*g*sin(theta2)/4 == 0;

[V,S] = odeToVectorField(eqn_theta1, eqn_theta2);

M = matlabFunction(V,'vars',{'t','Y'});

sol = ode45(M,tspan,intcon);

f1 = figure;
plot(sol.x,sol.y)
title('Solutions of Positions')
xlabel('Time (s)')
ylabel('Solutions [rad]')
legend({'$\theta_2$','$\dot{\theta_2}$','$\theta_1$','$\dot{\theta_1}$'}, 'Interpreter', 'latex')

x1 = @(t) L1*sin(deval(sol,t,3));
y1 = @(t) -L1*cos(deval(sol,t,3));

x2 = @(t) L1*sin(deval(sol,t,3)) + (L2*sin(deval(sol,t,1)));
y2 = @(t) -L1*cos(deval(sol,t,3)) - (L2*cos(deval(sol,t,1)));

f2 = figure;
% fanimator(@(t) plot(x1(t),y1(t),'ro','MarkerSize',m1*10,'MarkerFaceColor','r'), 'AnimationRange', tspan);
axis equal;
hold on;
fanimator(@(t) plot([0 x1(t)],[0 y1(t)],'r-'), 'AnimationRange', tspan);
% fanimator(@(t) plot(x2(t),y2(t),'go','MarkerSize',m2*10,'MarkerFaceColor','g'), 'AnimationRange', tspan);
fanimator(@(t) plot([x1(t) x2(t)],[y1(t) y2(t)],'g-'), 'AnimationRange', tspan);

fanimator(@(t) text(-0.3,0,"Timer: "+num2str(t,2)), 'AnimationRange', tspan);
hold off;
playAnimation