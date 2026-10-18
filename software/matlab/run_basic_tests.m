function run_basic_tests()
%RUN_BASIC_TESTS Deterministic examples only, not hardware verification.
    assert(adc_to_servo_angle(500) == 0);
    assert(adc_to_servo_angle(680) == 120);
    assert(adc_to_servo_angle(800) == 180);
    assert(adc_to_servo_angle(900) == 180);
    assert(abs(adc_to_radians(688,688)) < 1e-12);
    assert(virtual_wall_gain(12) == 0);
    assert(abs(virtual_wall_gain(2) - 0.35) < 1e-12);
    assert(abs(virtual_wall_gain(6) - 0.35/8) < 1e-12);
    assert(left_channel_gain(2,0.3,1,0.1) > right_channel_gain(2,0.3,1,0.1));
    clear directional_obstacle_flag;
    assert(directional_obstacle_flag(8, 1) == 0);
    assert(directional_obstacle_flag(4, 1) == 1);
    assert(directional_obstacle_flag(8,-1) == 1);
    assert(directional_obstacle_flag(16,-1) == 1); % retained flag after unlock
    assert(directional_obstacle_flag(4,-1) == 2);
    clear ultrasonic_distance_filter;
    assert(ultrasonic_distance_filter(8) == 8);
    assert(ultrasonic_distance_filter(200) == 8); % out of range hold
    disp('Basic deterministic checks passed (hardware NOT tested).');
end
