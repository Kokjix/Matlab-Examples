% Used in Q1 MATLAB method
function matrix = stiffness_matrix(q)
%UNTİTLED2 Summary of this function goes here
%   Detailed explanation goes here
    matrix = [  cos(q)^2 cos(q)*sin(q) -(cos(q)^2) -(cos(q)*sin(q)); ...
                cos(q)*sin(q) sin(q)^2 -(cos(q)*sin(q)) -(sin(q)^2); ...
                -(cos(q)^2) -(cos(q)*sin(q)) cos(q)^2 cos(q)*sin(q); ...
                -(cos(q)*sin(q)) -(sin(q)^2) cos(q)*sin(q) sin(q)^2];
end

