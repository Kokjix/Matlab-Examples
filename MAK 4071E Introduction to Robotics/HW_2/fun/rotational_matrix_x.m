function rmatrix = rotational_matrix_x(q)
%ROTATİONAL_MATRİX_X Summary of this function goes here
%   Detailed explanation goes here

rmatrix = [1 0 0;
           0 cos(q) sin(q);
           0 -sin(q) cos(q)];
end

