clear;
clc;

%% Homework 10
%% Question 5

A = [0 1; 0 0];
B = [0; 1];
C = [1 0];
D = [0];

obs_poles_list = {[-2; -2.0000001], [-5; -5.0000001], [-15; -15.0000001]};
titles_list = ["Observer Poles -2, -2", "Observer Poles -5, -5", "Observer Poles -15, -15"];

for i = 1:length(obs_poles_list)
    obs_poles = obs_poles_list{i};
    K = place(A', -C', obs_poles)';
    disp(K)

    observer = ss(A + K*C, [B -K], eye(2, 2), zeros(2, 2));

    simOut = sim("hw10Q5_model");

    figure(i)
    subplot(1, 2, 1)
    plot(simOut.x1hat.Time, simOut.x1hat.Data)
    hold on
    plot(simOut.x1.Time, simOut.x1.Data)
    hold off
    title(titles_list{i} + "  x1hat VS x1")
    legend("x1hat", "x1")
    xlabel("time (s)")
    ylabel("Signal")

    subplot(1, 2, 2)
    plot(simOut.x2hat.Time, simOut.x2hat.Data)
    hold on
    plot(simOut.x2.Time, simOut.x2.Data)
    title(titles_list{i} + "  x2hat VS x2")
    legend("x1hat", "x1");
    xlabel("time (s)")
    ylabel("Signal")

end
