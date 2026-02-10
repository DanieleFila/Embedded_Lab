%% ------------------------------------------------------------------------
%
% THE FOLLOWING SCRIPT CAN BE USED TO ESTIMATE THE MOTOR PARAMETERS WITH
% TWO METHODS:
%
%   1) GRAPHICALLY - ROUGH METHOD
%   2) TANGENT METHOD
%
% THE GENERATED PLOTS SHOW THE OPEN-LOOP RESPONSES OF THE MOTORS WITH
% DIFFERENT INPUT VOLTAGES, AND THE TANGENT METHOD APPLIED DIRECTLY TO THE
% OPEN-LOOP RESPONSES.
% FINALLY THE ESTIMATED PARAMETERS ARE EXPORTED INTO A .txt FILE.
%
% -------------------------------------------------------------------------

clear;
close all;
clc;

addpath('extra_functions\');
data_folder = 'data';

%% Import data

file_name = 'dataM1_50M2_3.mat';
data_path = fullfile(data_folder, file_name);

% Import data file
file_data = load(data_path);
data = file_data.data;

% Split acquired data
time = data.time;                   % time vector
w_1_acq = data.signals{1}(1, :);    % angular speed motor 1
w_2_acq = data.signals{1}(2, :);    % angular speed motor 2
u_1_acq = data.signals{2}(1, :);    % input motor 1
u_2_acq = data.signals{2}(2, :);    % input motor 2

% NOTE: Set step amplitude for each motor respectively for the
%       selected .mat file [V]

PWM1_volt = 5;
PWM2_volt = 3;

%% Filter acquired signals

fc = 1;         % cut off frequency
Ts = time(1);   % sampling period

% Filter angular speed signals
w_1 = filter_signal('lpf', fc, Ts, w_1_acq);
w_2 = filter_signal('lpf', fc, Ts, w_2_acq);
u_1 = u_1_acq;
u_2 = u_2_acq;

% Remove irrelevant data from the acquisition buffer
[w_1, u_1] = remove_final_nan(w_1, u_1);
[w_2, u_2] = remove_final_nan(w_2, u_2);
[w_2, time] = remove_final_nan(w_2, time);

%% Compute derivative of angular speeds and related tangents

% Compute derivatives
[dw_1, t_dw_1, max_dw_1, t_w1_max] = derivative(w_1, time);
[dw_2, t_dw_2, max_dw_2, t_w2_max] = derivative(w_2, time);

% Compute tangents
w1_tan = max_dw_1*(t_dw_1 - time(t_w1_max)) + w_1(t_w1_max);
w2_tan = max_dw_2*(t_dw_2 - time(t_w2_max)) + w_1(t_w2_max);

% Adjust tangents wrt the full time array 
w1_tan_full = max_dw_1*(time - time(t_w1_max)) + w_1(t_w1_max);
w2_tan_full = max_dw_2*(time - time(t_w2_max)) + w_2(t_w2_max);

%% Compute motor parameters with Tangent Method

N = 100;        % Number of samples to average over for steady-state value (ie.: last acquired second)
[t0_1, t1_1, mu1, T1, tau1, w1_inf, idx_step1] = tangent_method(time, u_1, w_1, max_dw_1, t_w1_max, N);
[t0_2, t1_2, mu2, T2, tau2, w2_inf, idx_step2] = tangent_method(time, u_2, w_2, max_dw_2, t_w2_max, N);

%% Identification plots

identification_plot(time, w_1, w1_inf, w1_tan_full, t0_1, t1_1, tau1, T1, 0.02, '1');
identification_plot(time, w_2, w2_inf, w2_tan_full, t0_2, t1_2, tau2, T2, 0.02, '2');

%% Compute motor parameters by hand
% We assume tau as the time within the response assumes the
% 'perc_rise' percent of the steady state value.
% Then we find the instant in which the response assumes the 63.2% of the
% steady state value, and find T as the difference between this time
% instant and tau.

% NOTE: set the desired percentage (default 2%)
perc_rise = 0.02;
[tau1_1, T1_1] = hand_parameters(time, perc_rise, w_1, w1_inf, idx_step1);
[tau2_1, T2_1] = hand_parameters(time, perc_rise, w_2, w2_inf, idx_step2);

%% Print to console parameters found with tangent method

fprintf('------------------ MOTOR 1 -----------------\n');
fprintf('-- TANGENT METHOD ESTIMATED CONSTANTS --\n');
fprintf('Estimated mu1: %.4f s\n', mu1);
fprintf('Estimated τ1: %.4f s\n', tau1);
fprintf('Estimated T1: %.4f s\n', T1);
fprintf('Estimated w1: %.4f s\n', w1_inf);
fprintf('\n---- MANUAL ESTIMATED TIME CONSTANTS ----\n');
fprintf('Manual estimated tau1: %.4f s \n', tau1_1);
fprintf('Manual estimated T1: %.4f s \n', T1_1);

fprintf('\n------------------ MOTOR 2 -----------------\n');
fprintf('-- TANGENT METHOD ESTIMATED CONSTANTS --\n');
fprintf('Estimated mu2: %.4f s\n', mu2);
fprintf('Estimated τ2: %.4f s\n', tau2);
fprintf('Estimated T2: %.4f s\n', T2);
fprintf('Estimated w2: %.4f s\n', w2_inf);
fprintf('\n---- MANUAL ESTIMATED TIME CONSTANTS ----\n');
fprintf('Manual estimated tau2: %.4f s \n', tau2_1);
fprintf('Manual estimated T2: %.4f s \n', T2_1);

% Plot open-loop responses of the motors
open_loop_response(PWM1_volt, mu1, T1_1, tau1, idx_step1, time, w_1, u_1, '1');
open_loop_response(PWM2_volt, mu2, T2_1, tau2, idx_step2, time, w_2, u_2, '2');

%% Export file parameters in a .txt file

file_name = 'motors_params.txt';
f_param = fopen(file_name, 'w');

if f_param == -1
    error('Could not write file.');
end

fprintf(f_param, '------------------ MOTOR 1 -----------------\n');
fprintf(f_param, '-- TANGENT METHOD ESTIMATED CONSTANTS --\n');
fprintf(f_param, 'Estimated mu1: %.4f s\n', mu1);
fprintf(f_param, 'Estimated τ1: %.4f s\n', tau1);
fprintf(f_param, 'Estimated T1: %.4f s\n', T1);
fprintf(f_param, 'Estimated w1: %.4f s\n', w1_inf);
fprintf(f_param, '\n---- MANUAL ESTIMATED TIME CONSTANTS ----\n');
fprintf(f_param, 'Manual estimated tau1: %.4f s \n', tau1_1);
fprintf(f_param, 'Manual estimated T1: %.4f s \n', T1_1);
fprintf(f_param, '\n------------------ MOTOR 2 -----------------\n');
fprintf(f_param, '-- TANGENT METHOD ESTIMATED CONSTANTS --\n');
fprintf(f_param, 'Estimated mu2: %.4f s\n', mu2);
fprintf(f_param, 'Estimated τ2: %.4f s\n', tau2);
fprintf(f_param, 'Estimated T2: %.4f s\n', T2);
fprintf(f_param, 'Estimated w2: %.4f s\n', w2_inf);
fprintf(f_param, '\n---- MANUAL ESTIMATED TIME CONSTANTS ----\n');
fprintf(f_param, 'Manual estimated tau2: %.4f s \n', tau2_1);
fprintf(f_param, 'Manual estimated T2: %.4f s \n', T2_1);
fclose(f_param);

fprintf('\n\n');
disp(['Motors parameters successfully exported in ', file_name]);
