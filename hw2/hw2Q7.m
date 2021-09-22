%% Homework 2 Question 7
m = 1000;
alpha = 60;
E = 720;
F = 180;

G = E / alpha;
H = F / alpha;

K2_a = 0.05;
K2_b = 0.1;
K2_c = 1;

time_end = 70;

K2_list = {K2_a, K2_b, K2_c};
legends = cell(4, 1);


for i=1:length(K2_list)
    K2 = K2_list{i};
    K1 = (1 + G * K2) / G;
    
    legends{i} = sprintf("$K_2 = $ %0.2f", K2);
    
    simOut = sim("hw2Q7_model");
    
    figure(1);
    plot(simOut.y.Time, simOut.y.Data, 'LineWidth', 2.0)
    hold on;
    
    figure(2);
    plot(simOut.yDot.Time, simOut.yDot.Data, 'LineWidth', 2.0)
    hold on;
    
end 

figure(1)
plot(simOut.command.Time, simOut.command.Data)
title("Homework 2 Question 7(d)", "FontSize", 20)
xlabel("time ($sec$)", "Interpreter", "latex")
ylabel("Velocity (meters/$sec$)", "Interpreter", "latex")

legends{4} = "Reference";
lgd = legend(legends, "Interpreter", "latex");
lgd.FontSize = 16;

figure(2)
title("Homework 2 Question 7(f)", "FontSize", 20)
xlabel("time ($sec$)", "Interpreter", "latex")
ylabel("Acceleration (meters/$sec^2$)", "Interpreter", "latex")

lgd = legend(legends, "Interpreter", "latex");
lgd.FontSize = 16;

