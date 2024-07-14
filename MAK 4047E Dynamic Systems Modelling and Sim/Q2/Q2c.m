clc;
clear;
close all;

opts = odeset('RelTol',0.0080,'AbsTol',0.0050,'InitialStep',0.01,'MaxStep',0.01);
odeFun = @(t,i,A) [i(2);
                4*i(2)+4*i(1)+A*cos(2*t)-4*dirac(t)];

tspan = [0.000001 1];

y0 = [0 0];

A1 = 1;
A2 = 2;
A3 = 5;
A4 = 10;

[t1_45,y1_45] = ode45(@(t,i,A)odeFun(t,i,A1),tspan,y0,opts);
[t2_45,y2_45] = ode45(@(t,i,A)odeFun(t,i,A2),tspan,y0,opts);
[t3_45,y3_45] = ode45(@(t,i,A)odeFun(t,i,A3),tspan,y0,opts);
[t4_45,y4_45] = ode45(@(t,i,A)odeFun(t,i,A4),tspan,y0,opts);

[t1_113,y1_113] = ode113(@(t,i,A)odeFun(t,i,A1),tspan,y0,opts);
[t2_113,y2_113] = ode113(@(t,i,A)odeFun(t,i,A2),tspan,y0,opts);
[t3_113,y3_113] = ode113(@(t,i,A)odeFun(t,i,A3),tspan,y0,opts);
[t4_113,y4_113] = ode113(@(t,i,A)odeFun(t,i,A4),tspan,y0,opts);

[t1_89,y1_89] = ode89(@(t,i,A)odeFun(t,i,A1),tspan,y0,opts);
[t2_89,y2_89] = ode89(@(t,i,A)odeFun(t,i,A2),tspan,y0,opts);
[t3_89,y3_89] = ode89(@(t,i,A)odeFun(t,i,A3),tspan,y0,opts);
[t4_89,y4_89] = ode89(@(t,i,A)odeFun(t,i,A4),tspan,y0,opts);

figure
plot(t1_45,y1_45(:,1));
hold on
plot(t2_45,y2_45(:,1));
hold on
plot(t3_45,y3_45(:,1));
hold on
plot(t4_45,y4_45(:,1));
hold on

plot(t1_113,y1_113(:,1));
hold on
plot(t2_113,y2_113(:,1));
hold on
plot(t3_113,y3_113(:,1));
hold on
plot(t4_113,y4_113(:,1));
hold on

plot(t1_89,y1_89(:,1));
hold on
plot(t2_89,y2_89(:,1));
hold on
plot(t3_89,y3_89(:,1));
hold on
plot(t4_89,y4_89(:,1));
hold on
legend('y 1V ode45','y 2V ode45','y 5V ode45','y 10V ode45') %,'y 1V ode113','y 2V ode113','y 5V ode113','y 10V ode113', 'y 1V ode89','y 2V ode89','y 5V ode89','y 10V ode89')
title('Linear Model Solutions')