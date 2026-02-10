%% ========================================================================
%
% THIS CODE IS RUN AUTOMATICALLY BEFORE STARTING THE SIMULATION WITH 
% SIMULINK IN ORDER TO INITIALIZE ALL THE NECESSARY VARIABLES.
%
% =========================================================================

clc; close all; clear;

Ts = 0.01;  % simulation sampling time

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

%% Matlab PI tune

C1_tuned = pidtune(motor1_tf, 'PI');
Kp1 = C1_tuned.Kp;
Ki1 = C1_tuned.Ki;
C2_tuned = pidtune(motor2_tf, 'PI');
Kp2 = C2_tuned.Kp;
Ki2 = C2_tuned.Ki;
Kd1 = 0;
Kd2 = 0;

% Manual PI gains tune
% NO MODIFY!!!
Kp2 = 0.5;
Ki2 = 1.3;
