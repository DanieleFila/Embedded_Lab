clear;
close all;
clc;

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


file_data = load('dataM1_45M2_25.mat');
data = file_data.data;

% Split acquired data
time = data.time;

% verify indexing to split data correctly!
w_1_acq = data.signals{1}(1, :);    % angular speed motor 1
w_2_acq = data.signals{1}(2, :);    % angular speed motor 1
u_1_acq = data.signals{2}(1, :);    % input motor 1
u_2_acq = data.signals{2}(2, :);    % input motor 2

%% Filter acquired signals

fc = 1;                         % cut off frequency
Ts = time(2)-time(1);                   % sampling period

w_1 = lpf(fc, Ts, w_1_acq);
w_2 = lpf(fc, Ts, w_2_acq);
u_1 = u_1_acq;
u_2 = u_2_acq;
[w_1, u_1] = remove_final_nan(w_1, u_1);
[w_2, u_2] = remove_final_nan(w_2, u_2);
[w_2, time] = remove_final_nan(w_2, time);

%% Derivative of speeds
% Supponiamo di avere i vettori t e y (stessa lunghezza)
% t = ... ;   % vettore tempi

function [dw_1, t_dw, max_dw, t_max] = derivative(w_1, time)

dw_1 = (w_1(2:end) - w_1(1:end-1)) ./ (time(2:end) - time(1:end-1));
t_dw = time(1:end-1);   % time vector
[max_dw, t_max] = max(dw_1);    % find max w'

end

%% Calcolo derivata

[dw_1, t_dw_1, max_dw_1, t_w1_max] = derivative(w_1, time);
[dw_2, t_dw_2, max_dw_2, t_w2_max] = derivative(w_2, time);

y1_tan = max_dw_1*(t_dw_1 - time(t_w1_max)) + w_1(t_w1_max);
y1_tan_full = max_dw_1*(time - time(t_w1_max)) + w_1(t_w1_max); %cosi è uno in piu, tanto non cambia nud
y2_tan_full = max_dw_2*(time - time(t_w2_max)) + w_2(t_w2_max); %cosi è uno in piu, tanto non cambia nud

figure(3);
plot(t_dw_1, y1_tan, 'r-', 'LineWidth', 2); hold on;
plot(time, w_1, 'b-');
title('Motor 1: Tangent and Original Response', 'FontSize', 14);
xlabel('Time [s]', 'FontSize', 10);
ylabel('Angular Speed [rad/s]', 'FontSize', 10);
legend('Tangent Line', 'Original Response');
grid on;

%% Plot graphs
%aggiungere
% MOTOR 1
figure('Name', 'Motor_1_Plot');
plot(time, w_1,  time, u_1, time, y1_tan_full); %fare fimzopmare qiesta
title('Motor 1', 'FontSize', 14);
xlabel('Time [s]', 'FontSize', 10);
legend('Angular speed [rad/s]', 'Input step [V]');
grid on;

% MOTOR 2
figure('Name', 'Motor_2_Plot');
plot(time, w_2,  time, u_2,time, y2_tan_full);
title('Motor 2', 'FontSize', 14);
xlabel('Time [s]', 'FontSize', 10);
legend('Angular speed [rad/s]', 'Input step [V]');
grid on;

N = 100; % L'ultimo secondo Number of samples to average over for steady-state value %oscillano piomeno in questo ordine di grandezza
y1_inf = mean(w_1(end-N+1:end)); % Mean of the last N samples
y2_inf = mean(w_2(end-N+1:end)); % Mean of the last N samples

% mu: system gain (change in output / change in input)
%delta_y = y_inf ;
%delta_u = max(u_1) ;

u1_step_threshold = max(u_1) * 0.5;
idx_step1 = find(u_1 > u1_step_threshold, 1, 'first');
t1_step = time(idx_step1);

u2_step_threshold = max(u_2) * 0.5;
idx_step2 = find(u_2 > u2_step_threshold, 1, 'first');
t2_step = time(idx_step2);

mu1 = y1_inf / max(u_1);  
% Find t0 and t1
t0_1 = time(t_w1_max) - (w_1(t_w1_max) / max_dw_1); % time of intersection with time axis
t1_1 = time(t_w1_max) + (y1_inf - w_1(t_w1_max)) / max_dw_1; % time of intersection with steady state

tau1 = t0_1- t1_step; % time constant τ va tolto l'inizio del gradino
T1 = t1_1 - t0_1; % time delay T
mu2 = y2_inf / max(u_2);  
% Find t0 and t1
t0_2 = time(t_w2_max) - (w_2(t_w2_max) / max_dw_2); % time of intersection with time axis
t1_2 = time(t_w2_max) + (y2_inf - w_2(t_w2_max)) / max_dw_2; % time of intersection with steady state

tau2 = t0_2- t2_step; % time constant τ va tolto l'inizio del gradino
T2 = t1_2 - t0_2; % time delay T
%trovare shift dopo il gradino




function [w_clean,t_clean] = remove_final_nan(w,t)
    % Rimuove solo i NaN alla fine del vettore y (e t di conseguenza)

    % Trova ultimo indice NON NaN
    last_valid = find(~isnan(w), 1, 'last');

    % Taglia i NaN finali
    w_clean = w(1:last_valid);
    t_clean = t(1:last_valid);
end


%plot finale gradino, funzione non filtrata, funzione filtrata, tangente,
%segnale ricostruito, tao T e basta direi
fprintf('Estimated mu1: %.4f s\n', mu1);
fprintf('Estimated τ1: %.4f s\n', tau1);
fprintf('Estimated T1: %.4f s\n', T1);
fprintf('Estimated w1: %.4f s\n', y1_inf);
fprintf('Estimated mu2: %.4f s\n', mu2);
fprintf('Estimated τ2: %.4f s\n', tau2);
fprintf('Estimated T2: %.4f s\n', T2);
fprintf('Estimated w2: %.4f s\n', y2_inf);

%% ================== PLOT FINALE DI IDENTIFICAZIONE ====================

figure('Name', 'Identification_Motor_1');
hold on; grid on;

% --- Plot risposta e ingresso ---
plot(time, w_1, 'b', 'LineWidth', 1.3);    % risposta
plot(time, u_1, 'k--', 'LineWidth', 1.3);  % gradino

% --- Plot tangente ---
plot(time, y1_tan_full, 'r', 'LineWidth', 1.2);

% --- Marker t_step ---
plot(t1_step, 0, 'ko', 'MarkerFaceColor','k');
text(t1_step, 0, '  t_{step}', 'Color','k', 'FontSize', 10, 'FontWeight', 'bold');

% --- Marker tau ---
plot(t1_step + tau1, w_1(idx_step1), 'ro', 'MarkerFaceColor','r');
text(t1_step + tau1, w_1(idx_step1), ['  \tau = ' num2str(tau1,3) ' s'], ...
     'Color','r', 'FontSize',10, 'FontWeight', 'bold');

% --- Marker T ---
plot(t0_1 + T1, y1_inf, 'go', 'MarkerFaceColor','g');
text(t0_1 + T1, y1_inf, ['  T = ' num2str(T1,3) ' s'], ...
     'Color','g', 'FontSize',10, 'FontWeight', 'bold');

% --- Livello di regime e guadagno ---
yline(y1_inf, 'm--', 'LineWidth', 1);
text(time(end)*0.7, y1_inf, [' \leftarrow y_{\infty}   \mu = ' num2str(mu1,3)], ...
     'Color','m', 'FontSize',10, 'FontWeight','bold');

% --- Titoli e legenda ---
title('Identification of Motor 1 Response', 'FontSize', 14, 'FontWeight','bold');
xlabel('Time [s]', 'FontSize', 12);
ylabel('Angular Speed [rad/s]', 'FontSize', 12);

legend('Filtered Response \omega_1', ...
       'Input Step u_1', ...
       'Tangent at max slope', ...
       'Location','southeast');