%% LOW PASS FILTER

function filtered_signal = lpf(fc, Ts, signal)
%
% LOW PASS FILTER
%
% This function returns the filtered signal of the given
% noise signal.
%
% === Input parameters ===
% fc = Cut off frequency [Hz]
% Ts = Sampling period   [s]
% signal = Input signal to be filtered
%
% === Output parameters ===
% filtered signal = filtered signal

sysF = tf(2*pi*fc, [1, 2*pi*fc]);
sysF_d = c2d(sysF, Ts, 'tustin');
[numF, denF] = tfdata(sysF_d, 'v');

filtered_signal = filter(numF, denF, signal);

end 

%% Data elaboration
clc;
clear;
close all;

% Import data file

%file_data = load('data_noisy.mat');     % debug file

file_data = load('dataM1_5M2_3.mat');
data = file_data.data;

% Split acquired data
time = data.time;

% verify indexing to split data correctly!
w_1_acq = data.signals{1}(1, :);    % angular speed motor 1
w_2_acq = data.signals{2}(1, :);    % step m1 1
u_1_acq = data.signals{1}(2, :);    % angular speed motor 2
u_2_acq = data.signals{2}(2, :);    % step m2 2

%% Filter acquired signals

fc = 1;                         % cut off frequency
Ts = time(1);                   % sampling period

%w_1 = lpf(fc, Ts, w_1_acq);
%w_2 = lpf(fc, Ts, w_2_acq);
%u_1 = lpf(fc, Ts, u_1_acq);
%u_2 = lpf(fc, Ts, u_2_acq);
step_1 = w_2_acq;
step_2 = u_2_acq; 
w_1 = lpf(fc, Ts, w_1_acq);
w_2 = lpf(fc, Ts, u_1_acq);
%% Plot graphs

% MOTOR 1
figure('Name', 'Motor_1_Plot'); 
plot(time, w_1,  time, step_1, time, w_1_acq);
title('Motor 1', 'FontSize', 14);
xlabel('Time [s]', 'FontSize', 10);
legend('Angular speed [rad/s]', 'Input step [V]','nonFilteredW');
grid on;

% MOTOR 2
figure('Name', 'Motor_2_Plot');
plot(time, w_2,  time, step_2,  time,  u_1_acq);
title('Motor 2', 'FontSize', 14);
xlabel('Time [s]', 'FontSize', 10);
legend('Angular speed [rad/s]', 'Input step [V]','nonFilteredW');
grid on;


