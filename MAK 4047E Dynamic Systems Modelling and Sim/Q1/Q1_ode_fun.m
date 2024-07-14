function dydt = Q1_ode_fun(t, w, y, init_step)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    dydt(1,1) = y(2);
    dydt(2,1) = -(w^2)*y(1);
end