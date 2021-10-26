%% %% ME 132 Homework 6 - Question 2
alpha = 60;
E = 40;
m = 1000;
G = 100;
K_p_list = linspace(0.1, 1.0, 6);
K_i_list = linspace(0.1, 1.0, 6);

r_0 = 20 / 1609 * 3600;     % From meters/sec to miles/hr

time_end = 80;

legends = cell(36, 1);
index = 1;

for pp = 1:length(K_p_list)
    for ii = 1:length(K_i_list)
        K_p = K_p_list(pp);
        K_i = K_i_list(ii);
        z_0 = r_0 / (E / alpha * K_i) + K_p * r_0 / K_i;
        
        simOut = sim("hw6Q2_model");
        
        legends{index} = ['K_p = ', num2str(K_p), ', K_i = ', num2str(K_i)];
        index = index + 1;
        
        figure(1);
        plot(simOut.v.Time, simOut.v.Data, "LineWidth", 1.0)
        hold on;
    end
end

figure(1)
title("Homework 6 Question 2", "FontSize", 20)
xlabel("time ($sec$)", "Interpreter", "latex")
ylabel("Car Velocity ($\frac{mile}{hr}$)", "Interpreter", "latex")

lgd = legend(legends, "Interpreter", "tex", "NumColumns", 6);
lgd.FontSize = 8;
