clc;
clear all;
close all;

% syms lambda
XY = 96;
% syms XY
k1 = 10*exp((-1/2)*((XY+50)/150)^2)*10^5;
k2 = 11*exp((-1/2)*((XY+50)/150)^2)*10^5;
k3 = 4*exp((-1/2)*((XY+50)/150)^2)*10^5;
k4 = k3;
k5 = 6*exp((-1/2)*((XY+50)/150)^2)*10^4;
k6 = k5;

m1 = 30*exp((-1/2)*((XY+50)/150)^2);
m2 = m1;
m3 = 300*exp((-1/2)*((XY+50)/150)^2);
m4 = 100*exp((-1/2)*((XY+50)/150)^2);
m5 = m4;
J3 = 250*exp((-1/2)*((XY+50)/150)^2);
L = 1;

m = [m1 0 0 0 0 0;
     0 m2 0 0 0 0;
     0 0 m3 0 0 0;
     0 0 0 m4 0 0;
     0 0 0 0 m5 0;
     0 0 0 0 0  J3];

 
 k = [k1+k3 0 -k3 0 0 -k3*L;
      0 k2+k4 -k4 0 0 -k4*L;
      -k3 -k4 (k3 + k4 + k5 + k6) -k5 -k6 (k3-k4+k5-k6);
        0  0   -k5 k5 0 -k5*L
        0 0 -k6 0 k6 -k6*L;
        -k3*L k4*L L*(k3-k4+k5-k6) -k5*L -k6*L (k4 + k3 + k4 + k5 + k6)*L^2];


lambda = eig(k,m);

wn = sqrt(lambda);

X = [];

for i=1:length(lambda)
    I = eye(6);
    A = k - lambda(i)*I.*m;
    B = A(2:6,1);
    A(1,:) = [];
    A(:,1) = [];
    Result = A\B;
    X = horzcat(X,Result);

end

X = vertcat([1 1 1 1 1 1],X);
X = horzcat(["X1" "X2" "X3" "X4" "X5" "X6"]',X);
X = vertcat(["Natural Frquencies" "wn1" "wn2" "wn3" "wn4" "wn5" "wn6"],X);
fprintf('Mods: \n')
disp(X);

for i=1:6
    fprintf('Wn %d: \n',i);
    disp(wn(i));
end
