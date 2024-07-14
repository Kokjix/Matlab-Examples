function z = pos(x)
%UNTİTLED3 Summary of this function goes here
%   Detailed explanation goes here
% order: [teta13 teta14 teta15 teta16]
global m AB BD AG GF FD BC CE GE teta12 a3 a6

z(1) = AB*cos(teta12) + BD*cos(x(1)) - AG - GF*cos(x(4)) - FD*cos(x(2));
z(2) = AB*sin(teta12) + BD*sin(x(1)) - GF*sin(x(4)) - FD*sin(x(2));
z(3) = AB*cos(teta12) + BC*cos(x(1)+a3) + CE*cos(x(3)) - AG -GE*cos(x(4) + a6);
z(4) = AB*sin(teta12) + BC*sin(x(1)+a3) + CE*sin(x(3)) -GE*sin(x(4) + a6);
