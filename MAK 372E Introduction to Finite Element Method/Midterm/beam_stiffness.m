% Used in Q2 MATLAB method
function matrix = beam_stiffness(L)
%UNTİTLED2 Summary of this function goes here
%   Detailed explanation goes here
    matrix = [  12 6*L -12 6*L;
                6*L 4*L^2 -6*L 2*L^2;
                -12 -6*L 12 -6*L;
                6*L 2*L^2 -6*L 4*L^2];
end

