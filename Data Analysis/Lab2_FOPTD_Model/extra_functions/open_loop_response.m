%% OPEN LOOP RESPONSE

function open_loop_response(PWM_volt, mu, T, tau, idx_start_step, time, w, u, motor_id)
%
% OPEN LOOP RESPONSE
%
% This function plots the open-loop step response of the motor.
%
% === Input parameters ===
% PWM_Volt = (Scalar) Input step amplitude [V]
% mu       = (Scalar) DC static gain [rad/sV]
% T        = (Scalar) Time constant [s]
% tau      = (Scalar) Time delay [s]
% idx_start_step = (Integer) Time instant from which the input step started
% time    = (Array) Time vector [s]
% w       = (Array) Angular speed [rad/s]
% u       = (Array) Input step [V]
% motor_ID = (String) Reference name of the considered motor
%
% === Output parameters ===
% (Void)

    % Motor Transfer Function Definition: G(s) = K * exp(-L*s) / (Tau*s + 1)
    motor_tf = tf(mu, [T 1], 'InputDelay', tau);
    u_sim = (time >= time(idx_start_step));
    response = lsim(PWM_volt * motor_tf, u_sim, time);
    
    figure('Name', ['Step_Response_Motor_', motor_id]);
    plot(time, w, time, response, time, u, 'LineWidth', 1.5);
    xlim([4.9 8.0]);
    ylim([-1 12]);
    hold on;
    title(['Step Response - Motor ', motor_id], 'FontSize', 20, 'Interpreter','latex');
    xlabel('Time [s]', 'FontSize', 18, 'Interpreter','latex');
    legend('Real Response [rad/s]', 'Matlab Response [rad/s]', 'Input step [V]', ...
        'FontSize', 18, 'Location', 'southeast', ...
        'Interpreter','latex');
    grid on;
    hold off;

end