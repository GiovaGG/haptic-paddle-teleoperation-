function K = virtual_wall_gain(distance_cm)
%VIRTUAL_WALL_GAIN Cubic proximity damping from the thesis.
% Dimensionless controller gain; NOT a measured force in newtons.
    DIST_MAX = 10;
    DIST_MIN = 2;
    K_MAX = 0.35;
    d = double(distance_cm);
    if ~isfinite(d) || d <= 0 || d > DIST_MAX
        K = 0;
    elseif d < DIST_MIN
        K = K_MAX;
    else
        x = (DIST_MAX - d) / (DIST_MAX - DIST_MIN);
        K = K_MAX * x^3;
    end
end
