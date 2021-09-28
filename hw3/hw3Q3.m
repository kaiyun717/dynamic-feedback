%% ME 132 Homework 3
% Question 3(f)

k1_list = linspace(3.5, 4.0, 10);    % K1
k2_list = linspace(0.5, 1.0, 10);    % K2
legends = cell(10, 1);

for i = 1:10
    k1 = k1_list(i);
    k2 = k2_list(i);
    simOut = sim("hw3Q3_model");
    legends{i} = sprintf("$k_1 = $%0.3f, $k_2 = $%0.3f", k1, k2);
    
    figure(1);
    plot(simOut.y.Time, simOut.y.Data);
    hold on;
    
    figure(2);
    plot(simOut.u.Time, simOut.u.Data);
    hold on;
end

figure(1)
legend(legends, "Interpreter", "latex", "Location", "southeast");
title("$y$ versus $t$", "Interpreter", "latex", "FontSize", 20)
xlabel("$t$", "Interpreter", "latex", "FontSize", 15)
ylabel("$u$", "Interpreter", "latex", "FontSize", 15)


figure(2)
legend(legends, "Interpreter", "latex");
title("$u$ versus $t$", "Interpreter", "latex", "FontSize", 20)
xlabel("$t$", "Interpreter", "latex", "FontSize", 15)
ylabel("$u$", "Interpreter", "latex", "FontSize", 15)
