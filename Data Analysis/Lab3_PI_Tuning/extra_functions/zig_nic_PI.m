%% ZIEGLER NICHOLS PI TUNE

function [Kp, Ki, Ti] = zig_nic_PI(mu, T, tau)
%
% ZIEGLER NICHOLS PI TUNE (OPEN-LOOP METHOD)
%
% For FOPDT models, PI controller parameters based on K, L, and Tau:
% Kp = 0.9 * Tau / (K * L)
% Ti = 3 * L
% Ki = Kp / Ti
% 
% === Input parameters ===
% mu  = (Scalar) DC static gain [rad/sV]
% T   = (Scalar) Time constant [s]
% tau = (Scalar) Time delay [s]
%
% === Output parameters ===
% Kp = (Scalar) Proportional gain
% Ki = (Scalar) Integral gain
% Ti = (Scalar) Integral time constant

    Kp = 0.9 * T / (mu * tau);
    Ti = 3 * tau;
    Ki = Kp / Ti;

end