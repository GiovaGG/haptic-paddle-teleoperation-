function d_f = ultrasonic_distance_filter(d)
%ULTRASONIC_DISTANCE_FILTER Reconstructed thesis MATLAB Function block.
% Multi-stage HC-SR04 processing: valid range, spike hold, LPF, deadband.
% Reset state in MATLAB: clear ultrasonic_distance_filter
    persistent d_old d_f_old spike_count
    d = double(d);
    if isempty(d_old)
        d_old = d;
        d_f_old = d;
        spike_count = 0;
    end
    DIST_MIN = 2.5;
    DIST_MAX = 40;
    MAX_STEP = 3;
    MAX_SPIKES = 3;
    ALPHA = 0.3;
    DEADBAND = 0.1;

    if ~isfinite(d) || d < DIST_MIN || d > DIST_MAX
        d = d_old;
    end
    if abs(d - d_old) > MAX_STEP
        spike_count = spike_count + 1;
        if spike_count < MAX_SPIKES
            d = d_old;
        else
            spike_count = 0;
        end
    else
        spike_count = 0;
    end
    d_f_temp = ALPHA * d + (1 - ALPHA) * d_f_old;
    if abs(d_f_temp - d_f_old) >= DEADBAND
        d_f = d_f_temp;
    else
        d_f = d_f_old;
    end
    d_old = d;
    d_f_old = d_f;
end
