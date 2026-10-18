function w_outr = right_channel_gain(w_in, K, flag, b)
%RIGHT_CHANNEL_GAIN Conditional gain for other PWM channel (thesis §4.5.4).
    if flag == 2
        w_outr = w_in * (K + b);
    else
        w_outr = w_in * b;
    end
end
