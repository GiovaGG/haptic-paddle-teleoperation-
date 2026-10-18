function flag = directional_obstacle_flag(d, theta)
%DIRECTIONAL_OBSTACLE_FLAG Direction latch documented in thesis.
% flag 1 = side selected when theta >= 0; flag 2 = theta < 0.
% Enter close range <5cm, release latch >15cm.
% Note: original logic RETAINS flag_locked after release; K(d)=0 far away.
% To reset in MATLAB: clear directional_obstacle_flag
    persistent flag_locked locked;
    if isempty(flag_locked)
        flag_locked = double(0);
        locked = false;
    end
    SOGLIA_IN = double(5);
    SOGLIA_OUT = double(15);
    if d < SOGLIA_IN && ~locked
        if theta >= 0
            flag_locked = double(1);
        else
            flag_locked = double(2);
        end
        locked = true;
    elseif d > SOGLIA_OUT
        locked = false;
    end
    flag = flag_locked;
end
