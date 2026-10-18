function w_outl = left_channel_gain(w_in, K, flag, b)
%LEFT_CHANNEL_GAIN Conditional gain for one PWM channel (thesis §4.5.4).
% This preserves the thesis block logic. Check physical motor sign separately.
    if flag == 1
        w_outl = w_in * (K + b);
    else
        w_outl = w_in * b;
    end
end
