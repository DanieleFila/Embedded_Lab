%% ========================================================================
% REAL TIME PLOTS WITH DIFFERENT INPUT YAW
%  ========================================================================
%
% The following script is executed at the end of the Simulink simulation in
% order to have the final plots with the desired settings ready to be
% inserted in the report.

close all; clc;

rw = out.logsout.get('rightWheelSpeed').Values;     % extract log of right motor
lw = out.logsout.get('leftWheelSpeed').Values;      % extract log of left motor
in_yaw = out.logsout.get('inYawAngle').Values;      % extract log of input target yaw
out_yaw = out.logsout.get('outYawAngle').Values;    % extract log of output yaw

% PLOT ANGULAR SPEEDS FOR EACH WHEEL
figure('Color', 'w', 'Name', 'Wheel Speeds');
hold on; grid on;
plot(rw.Time, rw.Data, 'LineWidth', 1.5, 'DisplayName', 'Right Wheel');
plot(lw.Time, lw.Data, 'LineWidth', 1.5, 'DisplayName', 'Left Wheel');
xlabel('Time [s]', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('Angular Speed [rad/s]', 'Interpreter', 'latex', 'FontSize', 18);
title('Wheels Speeds', 'Interpreter', 'latex', 'FontSize', 20);
lgd1 = legend('show');
set(lgd1, 'Interpreter', 'latex', 'FontSize', 18, 'Location', 'southeast');

% PLOT OUTPUT YAW
figure('Color', 'w', 'Name', 'Yaw Angle');
hold on; grid on;

plot(in_yaw.Time, in_yaw.Data, 'Color', 'k', 'LineStyle', '--', 'LineWidth', 1, ...
    'DisplayName', 'Target Yaw');
plot(out_yaw.Time, out_yaw.Data, 'Color', 'c', 'LineWidth', 1.5, ...
    'DisplayName', 'Output Yaw');
xlabel('Time [s]', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('$$\dot{\psi}~[rad]$$', 'Interpreter', 'latex', 'FontSize', 18);
title('Yaw Angle', 'Interpreter', 'latex', 'FontSize', 20);
lgd2 = legend('show');
set(lgd2, 'Interpreter', 'latex', 'FontSize', 18, 'Location', 'southeast');
