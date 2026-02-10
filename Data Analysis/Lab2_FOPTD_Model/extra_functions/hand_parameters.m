%% MANUALLY ESTIMATION OF PARAMETERS

function [tau, T] = hand_parameters(time, perc_rise, w, w_inf, idx_step)
%
% HAND PARAMETERS
%
% This function estimates the time constants tau and T of a motor
% (first-order approximation) from its open-loop step response.
%
% === Input parameters ===
% time      = (Array) Time vector
% perc_rise = (Scalar) Percentage of steady state to define tau
% w         = (Array) Angular speed vector (open loop response)
% w_inf     = (Scalar) Steady-state value of the angular speed
% idx_step  = (Integer) Index of the step start (reference time 0)
%
% === Output parameters ===
% tau = (Scalar) Dead time to reach perc_rise % of w_inf
% T   = (Scalar) Time constant (time to reach 63.2% of w_inf minus tau)

    y_tau = w_inf * perc_rise;
    y_T = w_inf * 0.632;
    valid_indeces_tau = find(w >= y_tau);
    valid_indeces_T = find(w >= y_T);
    
    if isempty(valid_indeces_tau) | isempty(valid_indeces_T)
        idx_tau = NaN;
        idx_T = NaN;
        disp('Warning: desired value not encountered in the vector');
    else
        idx_tau = valid_indeces_tau(1);
        idx_T = valid_indeces_T(1);
    end
    
    tau = time(idx_tau) - time(idx_step);
    T = time(idx_T) - tau - time(idx_step);

end