% ------------------------------------------------------------------------
%
% THE FOLLOWING SCRIPT CAN BE USED TO PLOT CHE CLOSED LOOP RESPONSES
% IN ORDER TO COMPARE THE EFFECT OF HAVING AN ANTIWINDUP.
%
% ------------------------------------------------------------------------

clear; close all; clc;

addpath('extra_functions\');    % add the custom functions path
data_folder = 'data';

% import data file .mat - Forward&Brake mode, no Antiwindup
file_name = 'dataM1_20M2_20FB_NOWINDUP.mat';
data_path = fullfile(data_folder, file_name);
file_data = load(data_path);
data = file_data.data;

% import data file .mat - Forward&Brake mode, with Antiwindup
win_file_name = 'dataM1_20M2_20FB_WINDUP.mat';
win_data_path = fullfile(data_folder, win_file_name);
file_data_win = load(win_data_path);
data_win = file_data_win.data;

time = data.time;          % extract time vector
Ts = time(2) - time(1);    % sampling period

% Simulation parameters
speed_reference = 20;   % Reference speed [rad/s]
sim_time = 3;           % simulation time [s]

%% EXTRACT AND FILTER ACQUIRED SIGNALS - NO ANTIWINDUP

array_length = 1000;
w_1_acq = data.signals{1}(1, :);    % angular speed motor 1
w_2_acq = data.signals{1}(2, :);    % angular speed motor 2
u_1_acq = data.signals{2}(1, :);    % input motor 1
u_2_acq = data.signals{2}(2, :);    % input motor 2

% Remove irrelevant data from the acquisition buffer
[w_1, u_1] = remove_NaN(w_1_acq, u_1_acq, array_length);
[w_2, u_2] = remove_NaN(w_2_acq, u_2_acq, array_length);
[time, ~] = remove_NaN(time, time, array_length);

% Filter acquired signals
fc = 1;     % cut off frequency
w_1 = filter_signal('lpf', fc, Ts, w_1);
w_2 = filter_signal('lpf', fc, Ts, w_2);

%% EXTRACT AND FILTER ACQUIRED SIGNALS - WITH ANTIWINDUP

w_1_win_acq = data_win.signals{1}(1, :);    % angular speed motor 1 with antiwindup
w_2_win_acq = data_win.signals{1}(2, :);    % angular speed motor 2 with antiwindup
u_1_win_acq = data_win.signals{2}(1, :);    % input motor 1 with antiwindup
u_2_win_acq = data_win.signals{2}(2, :);    % input motor 2 with antiwindup

% Remove irrelevant data from the acquisition buffer
[w_1_win, w_2_win] = remove_NaN(w_1_win_acq, w_2_win_acq, array_length);
[u_1_win, u_2_win] = remove_NaN(u_1_win_acq, u_2_win_acq, array_length);

% Filter acquired signals with anti-windup
fc = 1;     % cut off frequency
w_1_win = filter_signal('lpf', fc, Ts, w_1_win);
w_2_win = filter_signal('lpf', fc, Ts, w_2_win);

%% COMPARISON PLOT CLOSED-LOOP RESPONSE MOTOR 2

% REAL RESPONSE WITHOUT ANTIWINDUP
comparison_plot('noaw_aw', time, sim_time, Ts, speed_reference, u_1, w_1, NaN, '1');
ylim([0.0 150.0]);  % set y-axis limit
title('Step Response No Antiwindup - Motor 1', ...
          'FontSize', 20, ... 
          'FontWeight', 'bold', 'Interpreter', 'latex');

% REAL RESPONSE WITH ANTIWINDUP
comparison_plot('noaw_aw', time, sim_time, Ts, speed_reference, u_1_win, w_1_win, NaN, '1');

%% COMPARISON PLOT CLOSED-LOOP RESPONSE MOTOR 2

% REAL RESPONSE WITHOUT ANTIWINDUP
comparison_plot('noaw_aw', time, sim_time, Ts, speed_reference, u_2, w_2, NaN, '2');
ylim([0.0 70.0]);   % set y-axis limit
title('Step Response No Antiwindup - Motor 2', ...
          'FontSize', 20, ... 
          'FontWeight', 'bold', 'Interpreter', 'latex');

% REAL RESPONSE WITH ANTIWINDUP
comparison_plot('noaw_aw', time, sim_time, Ts, speed_reference, u_2_win, w_2_win, NaN, '2');