function wi_R = angular_velocity(w_j_R_j,Aji, wi_R_j)
%ANGULAR_VELOCİTY Summary of this function goes here
%   Detailed explanation goes here
    wi_R = wi_R_j + Aji * w_j_R_j;
end

