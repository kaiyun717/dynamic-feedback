%% Homework 7 Question 1
originalTF = tf([1 -5], [1 3 10]) * tf([1], [0.01 1]);
approxTF = tf([1 -5], [1 3 10]);

figure(1)
step(originalTF)
hold on;
step(approxTF, "r--")
lgd = legend("Original System", "Approximation");
lgd.FontSize = 14;

%% Homework 7 Question 2
% Part (a)
C_a = tf([2.4 1], [1 0]);
P_a = tf([1], [1 -1]);
L_a = P_a * C_a;
allmargin(L_a)

% Part (b)
C_b = tf([0.4 1], [1 0]);
P_b = tf([1], [1 1]);
L_b = P_b * C_b;
allmargin(L_b)

% Part (c)
C_c = tf([10 30], [1 0]);
P_c = tf([1 0 -2500], [1 50 1000]) * tf([-0.5], [1 -3]);
L_c = P_c * C_c;
allmargin(L_c)

%% Homework 7 Question 3
T_d = pi / 16;
candidates = [0, 1/10, 3/10, 6/10, 9/10, 9.9/10];
legends = cell(6, 1);

for i = 1:length(candidates)
    T_i = candidates(i) * T_d;
    simOut = sim("hw7Q3_model");
    figure(2)
    plot(simOut.outE.Time, simOut.outE.Data)
    legends{i} = sprintf("$T = $ %0.3f $T_d$", candidates(i));
    hold on;
end

figure(2)
title("Homework 7 Question 3(e)", "FontSize", 20)

lgd = legend(legends, "Interpreter", "latex");
