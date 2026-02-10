clear; close all; clc;
addpath('extra_functions\');

%% ------------------------------------------------------------------------
%
% The following script plots the TurtleBot's wheels behaviour during the
% track travel, and it is possibile to visualize the values read by
% the line sensor.
% In the command window are displayed the average speeds (angular speed and
% plane speed) and an estimation of the run distance.
%
% -------------------------------------------------------------------------

%% MEASURED LAP TIMES (NO MODIFY)
% =========================================================================

lapFirstTrack = 22.07;  % lap time on the 'clepsydra' shaped track
lapSecondTrack = 19.38; % lap time on the 'bullet' shaped track

% =========================================================================

%% NOTE ON DATA FILES
%
%   File: 'track_acq_01_FC.mat' --> Clepsydra shaped track, clockwise,
%                                   Forward&Coast mode
%   File: 'track_acq_02_FB.mat' --> Clepsydra shaped track, clockwise,
%                                   Forward&Brake mode
%   File BEST: 'track_acq_03_FC.mat' --> Clepsydra shaped track, clockwise,
%                                   Forward&Coast mode
%   File BEST: 'track_acq_04_FC.mat' --> Bullet shaped track, clockwise, 
%                                   Forward&Coast mode

%% Import data file

data_folder = 'data';
file_name = 'track_acq_03_FC.mat';
data_path = fullfile(data_folder, file_name);

file_data = load(data_path);
data = file_data.(getDataName(file_data));  % extract data
time = data.time;          % extract time vector
Ts = time(2) - time(1);    % sampling period
Fc = 1;                    % filter cut off frequency [Hz]

% NOTE:
%   - Motor 1 = LEFT motor;
%   - Motor 2 = RIGHT motor;

w_1_acq = data.signals{1}(1, :);        % angular speed motor 1
w_2_acq = data.signals{1}(2, :);        % angular speed motor 2
line_sens_acq = data.signals{2}(1, :);  % value read by the line sensor

w_1 = filter_signal('lpf', Fc, Ts, w_1_acq);
w_2 = filter_signal('lpf', Fc, Ts, w_2_acq);

w_1_avg = mean(w_1);                   % average angular speed of motor 1
w_2_avg = mean(w_2);                   % average angular speed of motor 2
r = 0.034;                             % wheel radius [m]
w_avg_tBot = mean([w_1_avg, w_2_avg]); % Calculate the average angular speed
v_avg_tBot = w_avg_tBot*r;             % turtleBot average speed [m/s]

% Compute average speeds and estimated distance
fprintf('Turtlebot average angular speed: %.2f [rad/s]\n', w_avg_tBot);
fprintf('Turtlebot average speed: %.2f [m/s]\n', v_avg_tBot);
% NOTE: remember to change the lap time wrt the considered track
fprintf('Turtlebot estimated distance: %.2f [m]\n', v_avg_tBot*lapFirstTrack);

%% Plot on track

% NOTE: start_idx = 100 for acq_03; start_idx = 10 for acq_04
start_idx = 100;
end_idx = length(time); % Set end_idx to the length of the time vector

% Plot motors speeds
figure('Name', 'PlotOnTrack');
plot(time(start_idx:end_idx), w_1(start_idx:end_idx), 'b', 'LineWidth', 1.2, 'DisplayName', 'Angular Speed Left Motor');
hold on;
plot(time(start_idx:end_idx), w_2(start_idx:end_idx), 'r', 'LineWidth', 1.2, 'DisplayName', 'Angular Speed Right Motor');
yline(w_avg_tBot, 'k--', 'DisplayName', 'Average Angular Speed', 'LineWidth', 1.5);
hold off;

xlabel('Time [s]', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('Angular Speed [rad/s]', 'Interpreter', 'latex', 'FontSize', 18);
title('Motors Angular Speeds on Track', 'Interpreter', 'latex', 'FontSize', 20);
legend('show', 'FontSize', 18, 'Interpreter', 'latex');
xlim([(start_idx - 10)/10 inf]);    % shift the plot to a better visualization
grid on;

% Plot value read by the line sensor
figure('Name', 'LineSensorReadings');
plot(time(start_idx:end_idx), line_sens_acq(start_idx:end_idx), 'k', 'LineWidth', 1.2, 'DisplayName', 'Line Sensor Value');
xlabel('Time [s]', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('Sensor Value', 'Interpreter', 'latex', 'FontSize', 18);
title('Line Sensor Readings on Track', 'Interpreter', 'latex', 'FontSize', 20);
legend('show', 'FontSize', 18, 'Interpreter', 'latex');
xlim([(start_idx - 10)/10 inf]);
grid on;