function z = vel(x)
%UNTİTLED4 Summary of this function goes here
%   Detailed explanation goes here
global m AB BD AG GF FD BC CE GE teta12 a3 a6 teta13 teta14 teta15 teta16 w12

% order: [w13 w14 w15 w16]
z(1) = AB*w12*sin(teta12) + BD*x(1)*sin(teta13) - GF*x(4)*sin(teta16) -FD*x(2)*sin(teta14);
z(2) = AB*w12*cos(teta12) + BD*x(1)*cos(teta13) - GF*x(4)*cos(teta16) -FD*x(2)*cos(teta14);
z(3) = AB*w12*sin(teta12) + BC*x(1)*sin(teta13 + a3) + CE*x(3)*sin(teta15) -GE*x(4)*sin(teta16 + a6);
z(4) = AB*w12*cos(teta12) + BC*x(1)*cos(teta13 + a3) + CE*x(3)*cos(teta15) -GE*x(4)*cos(teta16 + a6);