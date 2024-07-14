function vi_Ri = translational_velocity(vj_Rj, Aij, vi_Rj, w, r)
%TRANSLATİONAL_VELOCİTY Summary of this function goes here
%   Detailed explanation goes here
vi_Ri = Aij * vj_Rj + vi_Rj + cross(w,r);
end

