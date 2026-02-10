%% REMOVE FINAL NaN

function [w_clean, t_clean] = remove_final_nan(w, t)
%
% REMOVE FINAL NaN
%
% This function removes all NaNs from the given arrays, preserving only the
% useful data.
%
% === Input parameters ===
% w = (Array) Angular speed vector [rad/s]
% t = (Array) Time vector [s]
%
% === Output parameters ===
% w_clean = (Array) Clean angular speed, with no values equal to NaN [rad/s]
% t_clean = (Array) Clean time instants, with no values equal to NaN [s]

    last_valid = find(~isnan(w), 1, 'last');    % find index of last valid value
    
    % Remove final NaNs
    w_clean = w(1:last_valid);
    t_clean = t(1:last_valid);

end