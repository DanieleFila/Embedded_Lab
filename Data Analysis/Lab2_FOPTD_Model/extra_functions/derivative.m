%% SPEED DERIVATIVE

function [dw, t_dw, max_dw, t_max] = derivative(w, time)
%
% DERIVATIVE
%
% This function computes the derivative of the given
% angular speed.
%
% === Input parameters ===
% w    = (Array) Angular speed of which compute the derivative
% time = (Array) Time vector
%
% === Output parameters ===
% dw     = (Array) Derivative of the given input w
% t_dw   = (Array) Time associated with dw
% max_dw = (Scalar) Maximum value of dw
% t_max  = (Integer) Correspondent index of max_dw

    dw = (w(2:end) - w(1:end-1)) ./ (time(2:end) - time(1:end-1));
    t_dw = time(1:end-1);       % time vector
    [max_dw, t_max] = max(dw);  % find max w'

end