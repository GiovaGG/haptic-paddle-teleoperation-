function angle = adc_to_servo_angle(adc)
%ADC_TO_SERVO_ANGLE Piecewise master-to-slave mapping from the thesis.
    POT_MIN = 500;
    POT_MID = 680;
    POT_MAX = 800;
    if adc < POT_MID
        angle = (double(adc) - POT_MIN) * 120 / (POT_MID - POT_MIN);
    else
        angle = 120 + (double(adc) - POT_MID) * 60 / (POT_MAX - POT_MID);
    end
    angle = max(0, min(180, angle));
end
