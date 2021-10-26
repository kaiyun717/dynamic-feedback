%% ME 132 Homework 6 - Question 1
K_i_list = linspace(0.0, 1.0, 6);
K_p = 1;
time_end = 100;

T_L_a = 0.0;
legends_a = cell(6, 1);

for i = 1:length(K_i_list)
    K_i = K_i_list(i);
    
    legends_a{i} = sprintf("$K_i = $ %0.2f", K_i);
    
    simOut = sim("hw6Q1_model");
    
    % Part (a)
    figure(1);
    plot(simOut.theta_a.Time, simOut.theta_a.Data, "LineWidth", 1.0)
    hold on;
    
    % Part (b)
    figure(2);
    plot(simOut.theta_b.Time, simOut.theta_b.Data, "LineWidth", 1.0)
    hold on;
end

figure(1)
title("Homework 6 Question 1(a)", "FontSize", 20)
xlabel("time ($sec$)", "Interpreter", "latex")
ylabel("Angular Position (degree)")

lgd = legend(legends_a, "Interpreter", "latex");
lgd.FontSize = 12;

figure(2)
title("Homework 6 Question 1(b)", "FontSize", 20)
xlabel("time ($sec$)", "Interpreter", "latex")
ylabel("Angular Position (degree)")

lgd = legend(legends_a, "Interpreter", "latex");
lgd.FontSize = 12;

%% Part (e)
figure(3)
for i = 1:length(K_i_list)
    K_i = K_i_list(i);
    char_eqn_roots = roots([1 0.97 1.9*K_p 1.9*K_i]);
    plot(char_eqn_roots, "x", "MarkerSize", 20);
    hold on;
end

title("Homework 6 Question 1(e)", "FontSize", 20)
xlabel("Real")
ylabel("Imaginary")
xline(0)
yline(0)
lgd = legend(legends_a, "Interpreter", "latex");
lgd.FontSize = 12;