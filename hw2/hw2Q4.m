clc;
clear;

%% (a) Plot `TrajectoryData.xls` as x(t) versus y(t).
data = xlsread("TrajectoryData.xls");
time = data(:, 1);
x_t = data(:, 2);
y_t = data(:, 3);

plot(x_t, y_t)
title("HW2 Q4(a): Observed Trajectory Data")
xlabel("x-position")
ylabel("y-position")

%% Function J(x_c, y_c, x_d, y_d) that calculates how close
% the simulated trajectory with drag coefficient c is with
% the measured trajectory from `TrajectoryData.xls`.


%% (c)

mass = 0.3;              % Mass of ball (kg)
theta_0 = 65;            % Release angel (degrees)
v_0 = 35;                % Initial velocity (m/s)

c_vals = [0:0.001:0.1];  % Drag coefficient candidates
L = length(c_vals);
cost = zeros(L);         % Array of costs to save for comparison
