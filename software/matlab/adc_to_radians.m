function theta = adc_to_radians(adc, offset)
%ADC_TO_RADIANS Calibrated one-revolution mapping from the thesis.
% Reference: measured travel of ~230 ADC counts for 2*pi rad in model.
% offset is determined by startup calibration (mean of 100 samples).
    theta = (double(adc) - double(offset)) * (2*pi/230);
end
