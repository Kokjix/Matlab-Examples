function rmatrix = rotational_matrix_z(q)
%ROTATİONAL_MATRİX_Z Summary of this function goes here
%   Detailed explanation goes here
rmatrix = [cos(q) sin(q) 0;
            -sin(q) cos(q) 0;
            0 0 1];
end

