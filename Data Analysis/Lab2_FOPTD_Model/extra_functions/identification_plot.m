%% IDENTIFICATION PLOT

function identification_plot(time, w, w_inf, tan_full, t0, t1, tau, T, label_offset, motor_ID)
%
% IDENTIFICATION PLOT
% 
% This function plots the tangent method applied directly to the open-loop
% response, highlighting the most important features.
%
% === Input parameters ===
% time     = (Array) Time vector [s]
% w        = (Array) Angular speed [rad/s]
% w_inf    = (Scalar) Steady-state value [rad/s]
% tan_full = (Array) Vector of the tangent function
% t0       = (Scalar) Time instant in which the tangent crosses the zero
% t1       = (Scalar) Time instant in which the tangent crosses the steady-state
% tau      = (Scalar) Time delay [s]
% T        = (Scalar) Time constant [s]
% label_offset = (Scalar) Offset for the plot labels
% motor_ID = (String) Reference name of the considered motor
%
% === Output parameters ===
% (Void)

    tau_str = ['$\tau = ' num2str(tau, '%.4f') '\:s$']; 
    T_str = ['$T = ' num2str(T, '%.4f') '\:s$'];
    w_inf_str = ['$\omega_{\infty} = ' num2str(w_inf, '%.4f') '\:rad/s$'];
    
    figure('Name', ['Motor_', motor_ID, '_Tangent_Method']);
    hold on;
    grid on;
    
    h_w = plot(time, w, 'b', 'LineWidth', 1.5, 'DisplayName', 'Open Loop Step Response'); 
    h_tan = plot(time, tan_full, 'r', 'LineWidth', 1.5, 'DisplayName', 'Tangent Function'); 
    
    yline(0, 'k--', 'Label', '$\omega (t = 0)', 'LabelColor', 'k', 'LineWidth', 1,'LabelHorizontalAlignment', 'left', 'FontSize', 15, 'FontWeight', 'bold', 'Interpreter', 'latex');
    yline(w_inf, 'k--', 'Label', '$\omega (t \rightarrow \infty)', 'LabelColor', 'k', 'LineWidth', 1, 'FontSize', 15,'FontWeight', 'bold', 'Interpreter', 'latex');
    
    plot(t0, 0, 'ko', 'MarkerFaceColor','k', 'MarkerSize', 5, 'LineWidth', 1.0);
    plot(t1, w_inf, 'ko', 'MarkerFaceColor','k', 'MarkerSize', 5, 'LineWidth', 1.0);
    
    text(t0 + label_offset, 0 - label_offset*10, ['$t_0 = ' num2str(t0, '%.4f') '\:s$'], ...
         'Color','k', 'FontSize',15, 'FontWeight', 'bold', 'VerticalAlignment', 'top', Interpreter='latex');
    text(t1 + label_offset, w_inf  - label_offset*10, ['$t_1 = ' num2str(t1, '%.4f') '\:s$'], ...
         'Color','k', 'FontSize',15, 'FontWeight', 'bold', 'VerticalAlignment', 'top', Interpreter='latex');
    
    xlim([4.9 6.5]);
    ylim([-2, 15]);
    
    % Invisibile plot for legend
    h_tau = plot(NaN, NaN, 'w', 'Marker', 'none', 'LineWidth', 0.001); 
    h_T = plot(NaN, NaN, 'w', 'Marker', 'none', 'LineWidth', 0.001);
    h_winf = plot(NaN, NaN, 'w', 'Marker', 'none', 'LineWidth', 0.001);
    
    legend_handles = [h_w, h_tan, h_tau, h_T, h_winf];
    legend_strings = {h_w.DisplayName, h_tan.DisplayName, tau_str, T_str, w_inf_str};
    
    legend(legend_handles, legend_strings, ...
            'FontSize', 18, ...
            'Location', 'southeast', ...
            'Interpreter', 'latex');
            
    title(['Motor ', motor_ID, ' - Tangent Method'], 'FontSize', 20, 'FontWeight', 'bold', 'Interpreter', 'latex');
    xlabel('Time [s]', 'FontSize', 18, 'Interpreter','latex');
    ylabel('Angular Speed [rad/s]', 'FontSize', 18, 'Interpreter','latex');
    hold off;

end