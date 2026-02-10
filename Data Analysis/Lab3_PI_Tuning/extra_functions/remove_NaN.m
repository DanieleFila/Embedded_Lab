function [w_padded, t_padded] = remove_NaN(w, t, target_length)
%
% PAD OR TRUNCATE
%
% This function first removes final NaNs and then ensures the arrays 
% have exactly the target_length, padding with zeros or truncating.
%
% === Input parameters ===
% w             = (Array) Angular speed (may contain trailing NaNs) [rad/s]
% t             = (Array) Time instants associated with w [s]
% target_length = (Integer) Desired length of the output arrays
%
% === Output parameters ===
% w_padded = (Array) Angular speed array of size target_length [rad/s]
% t_padded = (Array) Time array of size target_length [rad/s]

    last_valid = find(~isnan(w), 1, 'last'); 
    if isempty(last_valid)
        w_clean = [];
        t_clean = [];
    else
        w_clean = w(1:last_valid);
        t_clean = t(1:last_valid);
    end
    
    current_length = length(w_clean);
    
    if current_length > target_length
        w_padded = w_clean(1:target_length);
        t_padded = t_clean(1:target_length);
        
    elseif current_length < target_length
        num_zeros_to_add = target_length - current_length;
        zero_pad = zeros(1, num_zeros_to_add);
        
        w_padded = [w_clean, zero_pad];
        t_padded = [t_clean, zero_pad];
        
    else
        w_padded = w_clean;
        t_padded = t_clean;
    end

end