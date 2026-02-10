%% FILTERED SIGNAL

function filtered_signal = filter_signal(filter_type, fc, Ts, signal)
%
% FILTERED SIGNAL
%
% This function returns the filtered signal of the given
% noise signal.
%
% === Input parameters ===
% filter_type = (String) Type of filter
% fc          = (Scalar) Cut off frequency [Hz]
% Ts          = (Scalar) Sampling period   [s]
% signal      = (Array) Input signal to be filtered
%
% === Output parameters ===
% filtered signal = (Array) Filtered signal


    if strcmp('lpf', filter_type)
        sysF = tf(2*pi*fc, [1, 2*pi*fc]);
        sysF_d = c2d(sysF, Ts, 'tustin');
        [numF, denF] = tfdata(sysF_d, 'v');
    end
    
    filtered_signal = filter(numF, denF, signal);

end