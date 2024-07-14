clc;
clear;
close all;

opts = odeset('RelTol',0.0080,'AbsTol',0.0050,'InitialStep',0.01,'MaxStep',0.01);
init_step = opts.InitialStep;

tspan = [0 3];
y0 = [1 0];
w1 = 1;
w2 = 10;
w3 = 100;



[t1_45,y1_45] = ode45(@(t,y)Q1_ode_fun(t,w1,y,init_step),tspan,y0,opts);
[t2_45,y2_45] = ode45(@(t,y)Q1_ode_fun(t,w2,y,init_step),tspan,y0,opts);
[t3_45,y3_45] = ode45(@(t,y)Q1_ode_fun(t,w3,y,init_step),tspan,y0,opts);

% y1_analytic = cos(w1*t1_45);
% y2_analytic = cos(w2*t2_45);
% y3_analytic = cos(w3*t3_45);
% 
% ydot1_analytic = -w1*sin(w1*t1_45);
% ydot2_analytic = -w2*sin(w2*t2_45);
% ydot3_analytic = -w3*sin(w3*t3_45);
% 
% figure
% plot(t1_45,y1_analytic);
% hold on
% plot(t2_45,y2_analytic);
% hold on
% plot(t3_45,y3_analytic);
% hold on
% plot(t1_45,y1_45(:,1));
% hold on
% plot(t2_45,y2_45(:,1));
% hold on
% plot(t3_45,y3_45(:,1));
% 
% title('Analytic and Numerical Solution')
% legend('y1 Analytic','y2 Analytic','y3 Analytic','y1 Numeric','y2 Numeric','y3 Numeric')


[t1_113,y1_113] = ode113(@(t,y)Q1_ode_fun(t,w1,y,init_step),tspan,y0,opts);
[t2_113,y2_113] = ode113(@(t,y)Q1_ode_fun(t,w2,y,init_step),tspan,y0,opts);
[t3_113,y3_113] = ode113(@(t,y)Q1_ode_fun(t,w3,y,init_step),tspan,y0,opts);

[t1_78,y1_78] = ode78(@(t,y)Q1_ode_fun(t,w1,y,init_step),tspan,y0,opts);
[t2_78,y2_78] = ode78(@(t,y)Q1_ode_fun(t,w2,y,init_step),tspan,y0,opts);
[t3_78,y3_78] = ode78(@(t,y)Q1_ode_fun(t,w3,y,init_step),tspan,y0,opts);

[t1_89,y1_89] = ode89(@(t,y)Q1_ode_fun(t,w1,y,init_step),tspan,y0,opts);
[t2_89,y2_89] = ode89(@(t,y)Q1_ode_fun(t,w2,y,init_step),tspan,y0,opts);
[t3_89,y3_89] = ode89(@(t,y)Q1_ode_fun(t,w3,y,init_step),tspan,y0,opts);

figure
plot(t1_45,y1_45(:,1));
hold on
plot(t2_45,y2_45(:,1));
hold on
plot(t3_45,y3_45(:,1));
hold on
plot(t1_113,y1_113(:,1));
hold on
plot(t2_113,y2_113(:,1));
hold on
plot(t3_113,y3_113(:,1));
hold on
plot(t1_78,y1_78(:,1));
hold on
plot(t2_78,y2_78(:,1));
hold on
plot(t3_78,y3_78(:,1));
hold on
plot(t1_89,y1_89(:,1));
hold on
plot(t2_89,y2_89(:,1));
hold on
plot(t3_89,y3_89(:,1));

title('ODE 45-113-78-89 Solutions Y')
legend('y1 45','y2 45','y3 45','y1 113','y2 113','y3 113','y1 78','y2 78','y3 78','y1 89','y2 89','y3 89')

figure
plot(t1_45,y1_45(:,2));
hold on
plot(t2_45,y2_45(:,2));
hold on
plot(t3_45,y3_45(:,2));
hold on
plot(t1_113,y1_113(:,2));
hold on
plot(t2_113,y2_113(:,2));
hold on
plot(t3_113,y3_113(:,2));
hold on
plot(t1_78,y1_78(:,2));
hold on
plot(t2_78,y2_78(:,2));
hold on
plot(t3_78,y3_78(:,2));
hold on
plot(t1_89,y1_89(:,2));
hold on
plot(t2_89,y2_89(:,2));
hold on
plot(t3_89,y3_89(:,2));


title('ODE 45-113-78-89 Solutions $\dot{Y}$','Interpreter','latex')
legend('y1 45','y2 45','y3 45','y1 113','y2 113','y3 113','y1 78','y2 78','y3 78','y1 89','y2 89','y3 89')





