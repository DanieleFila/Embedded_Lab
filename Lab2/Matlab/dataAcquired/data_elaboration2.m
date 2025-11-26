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

file_data = load('dataM1_40M2_0.mat');
data = file_data.data;

% Split acquired data
time = data.time;

% verify indexing to split data correctly!
w_1_acq = data.signals{1}(1, :);    % angular speed motor 1
w_2_acq = data.signals{2}(1, :);    % angular speed motor 1
u_1_acq = data.signals{1}(2, :);    % input motor 1
u_2_acq = data.signals{2}(2, :);    % input motor 2

%% Filter acquired signals

fc = 1;                         % cut off frequency
Ts = time(1);                   % sampling period

w_1 = lpf(fc, Ts, w_1_acq);
w_2 = lpf(fc, Ts, w_2_acq);
u_1 = lpf(fc, Ts, u_1_acq);
u_2 = lpf(fc, Ts, u_2_acq);

%% Plot graphs

% MOTOR 1
figure('Name', 'Motor_1_Plot'); 
plot(time, w_1,  time, u_1, time, w_1_acq);
title('Motor 1', 'FontSize', 14);
xlabel('Time [s]', 'FontSize', 10);
legend('Angular speed [rad/s]', 'Input step [V]','nonFilteredW');
grid on;

% MOTOR 2
figure('Name', 'Motor_2_Plot');
plot(time, w_2,  time, u_2,  time, w_2_acq);
title('Motor 2', 'FontSize', 14);
xlabel('Time [s]', 'FontSize', 10);
legend('Angular speed [rad/s]', 'Input step [V]','nonFilteredW');
grid on;


%trovare il sistema 
% Creazione oggetto iddata
data_motor1 = iddata(w_2', u_2', Ts);  % y = uscita, u = ingresso
find(isnan(data_motor1.OutputData))
data_motor1 = misdata(data_motor1);% si inventa i dati mancanti

%% Step 1: stimare modello primo ordine + ritardo
% Numero poli = 1, zeri = 0
np = 1;  
nz = 0;  

% Stima funzione di trasferimento con ritardo
% idT0 è l'intervallo massimo di ritardo da stimare (in campioni)
max_delay = 20;  % ad esempio 20 campioni
sys1 = tfest(data_motor1, np, nz, max_delay);

%% Step 2: visualizzare il modello stimato
disp('Modello stimato primo ordine + ritardo:');
sys1

% Mostra il ritardo stimato
Td_est = sys1.InputDelay;
fprintf('Ritardo stimato Td = %.4f s\n', Td_est);

%% Step 3: confrontare la risposta del modello con i dati
figure;
compare(data_motor1, sys1);
title('Confronto risposta motore 1: dati vs modello stimato');