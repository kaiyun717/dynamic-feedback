%% %% ME 132 Homework 6 - Question 2
alpha = 60;
E = 40;
m = 1000;
G = 100;
omega_n = [0.4, 1];
zeta = [0.2, 0.7, 1];

K_p_list = zeros(1, 6);
K_i_list = zeros(1, 6);

time_end = 80;

legends = cell(6, 1);
index = 1;

for ww = 1:length(omega_n)
    for zz = 1:length(zeta)
        K_i_list(index) = omega_n(ww)^2 / E;
        K_p_list(index) = (2 * zeta(zz) * omega_n(ww) - alpha) / E;
        index = index + 1;
    end
end


for kk = 1:length(K_p_list)
    K_p = K_p_list(kk);
    K_i = K_i_list(kk);

    simOut = sim("hw6Q2_model");

    legends{kk} = ['K_p = ', num2str(K_p), ', K_i = ', num2str(K_i)];

    figure(1);
    plot(simOut.v.Time, simOut.v.Data, "LineWidth", 1.0)
    hold on;
end

figure(1)
title("Homework 6 Question 2", "FontSize", 20)
xlabel("time ($sec$)", "Interpreter", "latex")
ylabel("Car Velocity ($\frac{mile}{hr}$)", "Interpreter", "latex")

lgd = legend(legends, "Interpreter", "tex", "NumColumns", 6);
lgd.FontSize = 8;
