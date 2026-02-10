% ------------------------------------------------------------------------
%
% THE FOLLOWING SCRIPT CAN BE USED TO PLOT CHE CLOSED LOOP RESPONSES
% IN ORDER TO COMPARE THE RESPONSE COMPUTED BY MATLAB AND THE REAL
% RESPONSE ACQUIRED FROM THE TURTLEBOT
%
% ------------------------------------------------------------------------

clear; close all; clc;

addpath('extra_functions\');    % add the custom functions path
data_folder = 'data';

% import data file .mat - Forward&Brake, no Antiwindup

file_name = 'dataM1_10M2_10FB_NOWINDUP.mat';
data_path = fullfile(data_folder, file_name);
file_data = load(data_path);
data = file_data.data;
time = data.time;          % extract time vector
Ts = time(2) - time(1);    % sampling period

% Simulation parameters
speed_reference = 10;   % reference speed (rad/s)
sim_time = 3;           % simulation time (seconds)


%% ========================================================================
% Motor Parameters (FOPDT Model)
% ========================================================================

% MOTOR 1 PARAMETERS
mu1 = 2.668;    % DC gain (K)
T1 = 0.47;      % Time constant [s] (Tau)
tau1 = 0.0636;  % Input delay [s] (L)

% MOTOR 2 PARAMETERS
mu2 = 3.9845;   % DC gain (K)
T2 = 0.58;      % Time constant [s] (Tau)
tau2 = 0.0747;  % Input delay [s] (L)

%% ========================================================================
% Transfer Function Definition: G(s) = K * exp(-L*s) / (Tau*s + 1)
% ========================================================================

motor1_tf = tf(mu1, [T1 1], 'InputDelay', tau1);
motor2_tf = tf(mu2, [T2 1], 'InputDelay', tau2);
disp('Motor 1 Transfer Function:');
motor1_tf
disp('Motor 2 Transfer Function:');
motor2_tf

%% ========================================================================
% PI Controller Definition: C(s) = Kp + Ki/s
% ========================================================================
%% Ziegler Nichols PI tune

[Kp1, Ki1] = zig_nic_PI(mu1, T1, tau1);
[Kp2, Ki2] = zig_nic_PI(mu2, T2, tau2);

% Show PI gains on the cmd
fprintf('\n---- Ziegler Nichols PI Gains for Motor 1 ----\n');
fprintf('Kp1 = %.2f\nKi1 = %.2f\n', Kp1, Ki1);
fprintf('\n---- Ziegler Nichols PI Gains for Motor 2 ----\n');
fprintf('Kp2 = %.2f\nKi2 = %.2f\n', Kp2, Ki2);

%% Matlab PI tune

C1_tuned = pidtune(motor1_tf, 'PI');
Kp1 = C1_tuned.Kp;
Ki1 = C1_tuned.Ki;
C2_tuned = pidtune(motor2_tf, 'PI');
Kp2 = C2_tuned.Kp;
Ki2 = C2_tuned.Ki;

% Show PI gains on the cmd
fprintf('\n---- Matlab pidtune PI Gains for Motor 1 ----\n');
fprintf('Kp1 = %.2f\nKi1 = %.2f\n', Kp1, Ki1);
fprintf('\n---- Matlab pidtune PI Gains for Motor 2 ----\n');
fprintf('Kp2 = %.2f\nKi2 = %.2f\n', Kp2, Ki2);

%% PI implementation

Kd1 = 0;
Kd2 = 0;

% Manual PI gains tune
% NO MODIFY!!!
Kp2 = 0.5;
Ki2 = 1.3;

C1 = pid(Kp1, Ki1, Kd1);
C2 = pid(Kp2, Ki2, Kd2);

%% ========================================================================
% Closed-loop Speed Control Response
% System: R(s) -> [C(s)] -> [G(s)] -> Y(s)
% Closed-loop Transfer Function: G_cl = C*G / (1 + C*G)
% ========================================================================

% MATLAB CLOSED-LOOP RESPONSE
G_cl1 = feedback(C1 * motor1_tf, 1);
G_cl2 = feedback(C2 * motor2_tf, 1);

%% REAL CLOSED-LOOP RESPONSE

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

%% COMPARISON PLOT CLOSED-LOOP RESPONSE - REAL VS MATLAB

comparison_plot('real_vs_sim', time, sim_time, Ts, speed_reference, w_1, NaN, G_cl1, '1');
comparison_plot('real_vs_sim', time, sim_time, Ts, speed_reference, w_2, NaN, G_cl2, '2');
