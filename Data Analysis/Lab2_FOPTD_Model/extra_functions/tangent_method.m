%% TANGENT METHOD

function [t0, t1, mu, T, tau, w_inf, idx_step] = tangent_method(time, u, w, max_dw, t_w_max, N)
%
% TANGENT METHOD
%
% This function applies the tangent method to find all the necessary
% parameters of the motor we want to analyze
%
% === Input parameters ===
% time    = (Array) Time vector [s]
% u       = (Array) Input step [V]
% w       = (Array) Angular speed [rad/s]
% max_dw  = (Scalar) Maximum value of w'
% t_w_max = (Integer) Time instant corresponding to max_dw
% N       = (Integer) Last samples of w within compute the steady-state value
%
% === Output parameters ===
% t0       = (Scalar) Time instant in which the tangent crosses the zero
% t1       = (Scalar) Time instant in which the tangent crosses the steady-state
%               value
% mu       = (Scalar) DC static gain [rad/sV]
% T        = (Scalar) Time constant [s]
% tau      = (Scalar) Time delay [s]
% w_inf    = (Scalar) Steady-state value [rad/s]
% idx_step = (Integer) Time instant from which the input step started

    % Compute steady state value of angular speed
    w_inf = mean(w(end-N+1:end));
    
    % Find starting instant of the input step
    u_step_threshold = max(u) * 0.5;
    idx_step = find(u > u_step_threshold, 1, 'first');
    t_step = time(idx_step);
    
    % Compute necessary parameters
    t0 = time(t_w_max) - (w(t_w_max) / max_dw);         % time of intersection with time axis
    t1 = time(t_w_max) + (w_inf - w(t_w_max)) / max_dw; % time of intersection with steady state
    mu = w_inf / max(u);                                % system gain
    T = t1 - t0;                                        % time delay T
    tau = t0 - t_step;                                  % time constant

end
