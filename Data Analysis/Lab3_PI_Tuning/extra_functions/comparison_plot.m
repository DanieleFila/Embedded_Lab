%% COMPARISON PLOT

function comparison_plot(type, time, plot_time, Ts, speed_reference, w, w_aw, G_cl, motor_id)
%
% COMPARISON PLOT
%
% This function is useful to compare different step responses. In
% particular you can decide if compare the closed-loop responses between
% the real one and the other computed by matlab by choosing 'real_vs_sim';
% otherwise you can evaluate the effect of having an antiwindup technique
% or not implemented by choosing 'noaw_aw'.
%
% === Input parameters ===
% type            = (String) Type of comparison plot (real_vs_sim OR noaw_aw)
% time            = (Array) Time vector [s]
% plot_time       = (Scalar) Time duration of the plots [s]
% Ts              = (Scalar) Sampling time [s]
% speed_reference = (Scalar) Target speed to reach [rad/s]
% w               = (Array) Angular speed vector [rad/s]
% w_aw            = (Array) Angular speed vector with antiwindup [rad/s]
% G_cl            = (Object) Transfer function of the closed-loop system
% motor_id        = (String) Reference name of the considered motor
%
% === Output parameters ===
% (Void)


    figure('Name', 'Closed_Loop_Response');
    
    % set max simulation time
    max_time_idx = round(plot_time / Ts) + 1;
    max_time_idx = min(max_time_idx, length(time));
    t_plot = time(1:max_time_idx);                  % simultaion time vector
    r_ref = speed_reference * ones(size(t_plot));   %reference speed vector
    
    %% COMPARISON PLOTS BETWEEN REAL ACQUIRED STEP RESPONSE AND MATLAB RESPONSE
    
    if strcmp(type, 'real_vs_sim')
        w = w(1:max_time_idx);
    
        r = lsim(G_cl, r_ref, t_plot);
        
        % Step info of matlab response
        s_sim = stepinfo(speed_reference * G_cl); 
        rt_str_sim = sprintf('%.2f', s_sim.RiseTime);
        st_str_sim = sprintf('%.2f', s_sim.SettlingTime);
        os_str_sim = sprintf('%.2f', s_sim.Overshoot);
        legend_str_sim = ['Matlab Simulated Response (RT: ', rt_str_sim, 's, ST: ', st_str_sim, 's, OS: ', os_str_sim, '\%)'];
        
        % Step info of real response
        S_real = stepinfo(w, t_plot);
        rt_str_real = sprintf('%.2f', S_real.RiseTime);
        st_str_real = sprintf('%.2f', S_real.SettlingTime);
        os_str_real = sprintf('%.2f', S_real.Overshoot);
        legend_str_real = ['Real Response (RT: ', rt_str_real, 's, ST: ', st_str_real, 's, OS: ', os_str_real, '\%)'];
        
        % Plot real response
        h_real = plot(t_plot, w, 'Color', 'r', 'LineWidth', 1.5, 'DisplayName', legend_str_real);
        hold on;
            
        % Plot matlab response
        h_sim = plot(t_plot, r, 'Color', 'b', 'LineWidth', 1.5, 'DisplayName', legend_str_sim);
        % reference speed
        plot(t_plot, r_ref, 'k--', 'LineWidth', 1.5, 'DisplayName', 'Reference'); 
        
        % bound x-axis
        xlim([0.0 2.0]);
    
        % Set title, axis, legend
        title(['Closed-Loop Step Response - Motor ', motor_id], ...
              'FontSize', 20, ... 
              'FontWeight', 'bold', 'Interpreter', 'latex');
    
        xlabel('Time [s]', 'FontSize', 18, 'Interpreter', 'latex');
        ylabel('Speed [rad/s]', 'FontSize', 18, 'Interpreter', 'latex');
    
        legend([h_real, h_sim], 'Location', 'southeast', 'FontSize', 18, 'Interpreter', 'latex');
    
        grid on;
        box on;
        hold off;
    
    end
    
    %% COMPARISON PLOT TO ANALYZE THE EFFECT OF ANTIWINDUP
    
    if strcmp(type, 'noaw_aw')
        w = w(1:max_time_idx);          % input signal [V]
        w_aw = w_aw(1:max_time_idx);    % angular speed [rad/s]
    
        legend_str_real_aw = 'Real Response [rad/s]';
        legend_str_input = 'Computed Input signal [V]';
        
        % Plot input signal
        h_real = plot(t_plot, w, 'Color', 'r', 'LineWidth', 1.5, 'DisplayName', legend_str_input);
        hold on;
        
        % Plot real response with anti-windup
        h_real_aw = plot(t_plot, w_aw, 'Color', 'b', 'LineWidth', 1.5, 'DisplayName', legend_str_real_aw);
        
        % Plot reference speed
        plot(t_plot, r_ref, 'k--', 'LineWidth', 0.8, 'DisplayName', 'Reference');
        
        % bound x-axis
        xlim([0.0 2.0]);
    
        % set title, axis, legend
        title(['Step Response with Antiwindup - Motor ', motor_id], ...
              'FontSize', 20, ... 
              'FontWeight', 'bold', 'Interpreter', 'latex');
        
        xlabel('Time [s]', 'FontSize', 18, 'Interpreter', 'latex');
        
        legend([h_real, h_real_aw], 'Location', 'southeast', 'FontSize', 18, 'Interpreter', 'latex');
        
        grid on;
        box on;
        hold off;
    end

end