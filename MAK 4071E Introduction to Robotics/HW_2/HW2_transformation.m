clc;
clear all;
close all;

syms q1 q2 q3 q4 q5 q6 L0 L1 L2 L3 L4 L5 L6;

T0 =  [ 1     0     0     0;
        0     1     0     0;
        0     0     1     L0;
        0     0     0     1];

T1 =  [ cos(q1)     -sin(q1)     0     0;
        sin(q1)     cos(q1)     0     0;
        0     0     1     0;
        0     0     0     1];

T2 =  [ 1     0     0     0;
        0     1     0     0;
        0     0     1     L1;
        0     0     0     1];

T3 = [  1     0     0     0;
        0     cos(q2) -sin(q2) 0;
        0     sin(q2)   cos(q2) 0;
        0       0           0   1];

T4 =  [ 1     0     0     0;
        0     1     0     0;
        0     0     1     L2;
        0     0     0     1];

T5 = [  1     0     0     0;
        0     cos(q3) -sin(q3) 0;
        0     sin(q3)   cos(q3) 0;
        0       0           0   1];

T6 =  [ 1     0     0     0;
        0     1     0     0;
        0     0     1     L3;
        0     0     0     1];

T7 =  [ cos(q4)     -sin(q4)     0     0;
        sin(q4)     cos(q4)     0     0;
        0     0     1     0;
        0     0     0     1];

T8 =  [ 1     0     0     0;
        0     1     0     0;
        0     0     1     L4;
        0     0     0     1];

T9 = [  1     0     0     0;
        0     cos(q5) -sin(q5) 0;
        0     sin(q5)   cos(q5) 0;
        0       0           0   1];

T10 =  [ 1     0     0     0;
        0     1     0     0;
        0     0     1     L5;
        0     0     0     1];

T11 =  [ cos(q6)     -sin(q6)     0     0;
        sin(q6)     cos(q6)     0     0;
        0     0     1     0;
        0     0     0     1];

T12 =  [ 1     0     0     0;
        0     1     0     0;
        0     0     1     L6;
        0     0     0     1];

T_total = T0*T1*T2*T3*T4*T5*T6*T7*T8*T9*T10*T11*T12;
x = T_total(1,4);
y = T_total(2,4);
z = T_total(3,4);

Rx = T_total(1,1);
Ry = T_total(2,2);
Rz = T_total(3,3);

J = jacobian([x, y, z, Rx, Ry, Rz], [q1;q2;q3;q4;q5;q6]);
J_S = simplify(J);

fid = fopen('a.txt', 'wt');

for i=1:6
    fprintf(fid,'[');
    for j=1:6
        fprintf(fid, '(%s),\t\t', char(J_S(i,j)));
    end
    fprintf(fid,']\n\n');
end


fclose(fid);

fid2 = fopen('a2.txt', 'wt');

for i=1:4
    fprintf(fid2,'[');
    for j=1:4
        fprintf(fid2, '(%s),\t\t', char(T_total(i,j)));
    end
    fprintf(fid2,']\n\n');
end


fclose(fid2);