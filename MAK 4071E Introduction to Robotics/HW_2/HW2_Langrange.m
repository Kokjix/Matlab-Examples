clc;
clear all;
close all;
syms t q1 q2 q3 q4 q5 q6 L1 L2 L3 L4 L5 L6 l0 l1 l2 l3 l4 l5 l6 q1_dot(t) q2_dot(t) ...
    q3_dot(t) q4_dot(t) q5_dot(t) q6_dot(t) I1xx I1yy I1zz I1yx I1yz I1xz I1xy I1zy I1zx m1 m2 ...
    m3 m4 m5 m6 g I2xx I2yy I2zz I2yx I2yz I2xz I2xy I2zy I2zx I3xx I3yy I3zz I3yx I3yz I3xz I3xy I3zy I3zx ...
    I4xx I4yy I4zz I4yx I4yz I4xz I4xy I4zy I4zx I5xx I5yy I5zz I5yx I5yz I5xz I5xy I5zy I5zx ...
    I6xx I6yy I6zz I6yx I6yz I6xz I6xy I6zy I6zx;

A10 = rotational_matrix_z(q1);
A21 = rotational_matrix_x(q2);
A32 = rotational_matrix_x(q3);
A43 = rotational_matrix_z(q4);
A54 = rotational_matrix_x(q5);
A65 = rotational_matrix_z(q6);

I1 = [I1xx I1xy I1xz;
    I1xy I1yy I1yz;
    I1xz I1yz I1zz];
I2 = [I2xx I2xy I2xz;
    I2xy I2yy I2yz;
    I2xz I2yz I2zz];
I3 = [I3xx I3xy I3xz;
    I3xy I3yy I3yz;
    I3xz I3yz I3zz];
I4 = [I4xx I4xy I4xz;
    I4xy I4yy I4yz;
    I4xz I4yz I4zz];
I5 = [I5xx I5xy I5xz;
    I5xy I5yy I5yz;
    I5xz I5yz I5zz];
I6 = [I6xx I6xy I6xz;
    I6xy I6yy I6yz;
    I6xz I6yz I6zz];

w0_0_R0 = [0 0 0]';
w0_1 = [0 0 q1_dot]';
w1_2 = [q2_dot 0 0]';
w2_3 = [q3_dot 0 0]';
w3_4 = [0 0 q4_dot]';
w4_5 = [q5_dot 0 0]';
w5_6 = [0 0 q6_dot]';

w0_1_R1 = angular_velocity(w0_1, A10, w0_0_R0);
w0_2_R2 = angular_velocity(w1_2, A21, w0_1_R1);
w0_3_R3 = angular_velocity(w2_3, A32, w0_2_R2);
w0_4_R4 = angular_velocity(w3_4,A43,w0_3_R3);
w0_5_R5 = angular_velocity(w4_5,A54,w0_4_R4);
w0_6_R6 = angular_velocity(w5_6,A65,w0_5_R5);

v0O2_R2 = [0 0 0]';
vO1G1 = [0 0 0]';
vO2G2 = [0 0 0]';
vO3G3 = [0 0 0]';
vO4G4 = [0 0 0]';
vO5G5 = [0 0 0]';
vO6G6 = [0 0 0]';
O2G2 = [0 0 l2]';
O3G3 = [0 0 l3]';
O4G4 = [0 0 l4]';
O5G5 = [0 0 l5]';
O6G6 = [0 0 l6]';

O1O2 = [0 0 L2]';
O2O3 = [0 0 L3]';
O3O4 = [0 0 L4]';
O4O5 = [0 0 L5]';
O5O6 = [0 0 L6]';

v0O3_R3 = translational_velocity(v0O2_R2, A32, vO3G3, w0_3_R3, O2O3);
v0O4_R4 = translational_velocity(v0O3_R3, A43, vO4G4, w0_4_R4, O3O4);
v0O5_R5 = translational_velocity(v0O4_R4, A54, vO5G5, w0_5_R5, O4O5);
v0O6_R6 = translational_velocity(v0O5_R5, A65, vO6G6, w0_6_R6, O5O6);

v0G1 = [0 0 0]';
v0G2 = v0O2_R2 + vO2G2 + cross(w0_2_R2, O2G2);
v0G3 = v0O3_R3 + vO3G3 + cross(w0_3_R3, O3G3);
v0G4 = v0O4_R4 + vO4G4 + cross(w0_4_R4, O4G4);
v0G5 = v0O5_R5 + vO5G5 + cross(w0_5_R5, O5G5);
v0G6 = v0O6_R6 + vO6G6 + cross(w0_6_R6, O6G6);

Tr1 = 0.5 * w0_1_R1' * I1 * w0_1_R1;
Tr2 = 0.5 * w0_2_R2' * I2 * w0_2_R2;
Tr3 = 0.5 * w0_1_R1' * I3 * w0_3_R3;
Tr4 = 0.5 * w0_1_R1' * I4 * w0_4_R4;
Tr5 = 0.5 * w0_1_R1' * I5 * w0_5_R5;
Tr6 = 0.5 * w0_1_R1' * I6 * w0_6_R6;

Ttr1 = 0.5 * m1 * (v0G1') * v0G1;
Ttr2 = 0.5 * m2 * (v0G2') * v0G2;
Ttr3 = 0.5 * m3 * (v0G3') * v0G3;
Ttr4 = 0.5 * m4 * (v0G4') * v0G4;
Ttr5 = 0.5 * m5 * (v0G5') * v0G5;
Ttr6 = 0.5 * m6 * (v0G6') * v0G6;

Ttotal1 = Tr1 + Ttr1;
Ttotal2 = Tr2 + Ttr2;
Ttotal3 = Tr3 + Ttr3;
Ttotal4 = Tr4 + Ttr4;
Ttotal5 = Tr5 + Ttr5;
Ttotal6 = Tr6 + Ttr6;

Ttotal = Ttotal1 + Ttotal2 + Ttotal3 + Ttotal4 + Ttotal5 + Ttotal6;

dTdq1 = diff(Ttotal,q1);
dTdq2 = diff(Ttotal,q2);
dTdq3 = diff(Ttotal,q3);
dTdq4 = diff(Ttotal,q4);
dTdq5 = diff(Ttotal,q5);
dTdq6 = diff(Ttotal,q6);

dTdq1_dot = diff(Ttotal, q1_dot);
dTdq2_dot = diff(Ttotal, q2_dot);
dTdq3_dot = diff(Ttotal, q3_dot);
dTdq4_dot = diff(Ttotal, q4_dot);
dTdq5_dot = diff(Ttotal, q5_dot);
dTdq6_dot = diff(Ttotal, q6_dot);

ddTdq1_dotdt = diff(dTdq1_dot,t);
ddTdq2_dotdt = diff(dTdq2_dot,t);
ddTdq3_dotdt = diff(dTdq3_dot,t);
ddTdq4_dotdt = diff(dTdq4_dot,t);
ddTdq5_dotdt = diff(dTdq5_dot,t);
ddTdq6_dotdt = diff(dTdq6_dot,t);

T0 =  [ 1     0     0     0;
        0     1     0     0;
        0     0     1     l0;
        0     0     0     1];

T1 =  [ cos(q1)     -sin(q1)     0     0;
        sin(q1)     cos(q1)     0     0;
        0     0     1     0;
        0     0     0     1];

T2 =  [ 1     0     0     0;
        0     1     0     0;
        0     0     1     l1;
        0     0     0     1];

T3 = [  1     0     0     0;
        0     cos(q2) -sin(q2) 0;
        0     sin(q2)   cos(q2) 0;
        0       0           0   1];

T4 =  [ 1     0     0     0;
        0     1     0     0;
        0     0     1     l2;
        0     0     0     1];

T5 = [  1     0     0     0;
        0     cos(q3) -sin(q3) 0;
        0     sin(q3)   cos(q3) 0;
        0       0           0   1];

T6 =  [ 1     0     0     0;
        0     1     0     0;
        0     0     1     l3;
        0     0     0     1];

T7 =  [ cos(q4)     -sin(q4)     0     0;
        sin(q4)     cos(q4)     0     0;
        0     0     1     0;
        0     0     0     1];

T8 =  [ 1     0     0     0;
        0     1     0     0;
        0     0     1     l4;
        0     0     0     1];

T9 = [  1     0     0     0;
        0     cos(q5) -sin(q5) 0;
        0     sin(q5)   cos(q5) 0;
        0       0           0   1];

T10 =  [ 1     0     0     0;
        0     1     0     0;
        0     0     1     l5;
        0     0     0     1];

T11 =  [ cos(q6)     -sin(q6)     0     0;
        sin(q6)     cos(q6)     0     0;
        0     0     1     0;
        0     0     0     1];

T12 =  [ 1     0     0     0;
        0     1     0     0;
        0     0     1     l6;
        0     0     0     1];

z1 = T0*T1*T2;
z2 = T0*T1*T2*T3*T4;
z3 = T0*T1*T2*T3*T4*T5*T6;
z4 = T0*T1*T2*T3*T4*T5*T6*T7*T8;
z5 = T0*T1*T2*T3*T4*T5*T6*T7*T8*T9*T10;
z6 = T0*T1*T2*T3*T4*T5*T6*T7*T8*T9*T10*T11*T12;

dz1dq1 = diff(z1(3,4),q1);
dz2dq1 = diff(z2(3,4),q1);
dz3dq1 = diff(z3(3,4),q1);
dz4dq1 = diff(z4(3,4),q1);
dz5dq1 = diff(z5(3,4),q1);
dz6dq1 = diff(z6(3,4),q1);

dz2dq2 = diff(z2(3,4),q2);
dz3dq2 = diff(z3(3,4),q2);
dz4dq2 = diff(z4(3,4),q2);
dz5dq2 = diff(z5(3,4),q2);
dz6dq2 = diff(z6(3,4),q2);

dz3dq3 = diff(z3(3,4),q3);
dz4dq3 = diff(z4(3,4),q3);
dz5dq3 = diff(z5(3,4),q3);
dz6dq3 = diff(z6(3,4),q3);

dz4dq4 = diff(z4(3,4),q4);
dz5dq4 = diff(z5(3,4),q4);
dz6dq4 = diff(z6(3,4),q4);

dz5dq5 = diff(z5(3,4),q5);
dz6dq5 = diff(z6(3,4),q5);

dz6dq6 = diff(z6(3,4),q6);

theta1 = m1*g*dz1dq1 + m2*g*dz2dq1 + m3*g*dz3dq1 + m4*g*dz4dq1 + m5*g*dz5dq1 + m6*g*dz6dq1;
theta2 = m2*g*dz2dq2 + m3*g*dz3dq2 + m4*g*dz4dq2 + m5*g*dz5dq2 + m6*g*dz6dq2;
theta3 = m3*g*dz3dq3 + m4*g*dz4dq3 + m5*g*dz5dq3 + m6*g*dz6dq3;
theta4 = m4*g*dz4dq4 + m5*g*dz5dq4 + m6*g*dz6dq4;
theta5 = m5*g*dz5dq5 + m6*g*dz6dq5;
theta6 = m6*g*dz6dq6;

thetas = [theta1 theta2 theta3 theta4 theta5 theta6]';

tau1 = ddTdq1_dotdt - dTdq1 - theta1;
tau2 = ddTdq2_dotdt - dTdq2 - theta2;
tau3 = ddTdq3_dotdt - dTdq3 - theta3;
tau4 = ddTdq4_dotdt - dTdq4 - theta4;
tau5 = ddTdq5_dotdt - dTdq5 - theta5;
tau6 = ddTdq6_dotdt - dTdq6 - theta6;

tau = [tau1 tau2 tau3 tau4 tau5 tau6]';

fid = fopen('tau.txt', 'wt');
% tau = pretty(tau);
for i=1:6
    fprintf(fid,'[');
    fprintf(fid, '(%s)', char(tau(i)));

    fprintf(fid,']\n\n');
end


fclose(fid);

fid2 = fopen('theta.txt', 'wt');
% tau = pretty(tau);
for i=1:6
    fprintf(fid2,'[');
    fprintf(fid2, '(%s)', char(thetas(i)));

    fprintf(fid2,']\n\n');
end


fclose(fid2);
