clear;
clc;

%% (a) Plot `TrajectoryData.xls` as x(t) versus y(t).
data = xlsread("TrajectoryData.xls");
time = data(:, 1);
xMeas = data(:, 2);
yMeas = data(:, 3);

plot(xMeas, yMeas)
title("HW2 Q4(a): Observed Trajectory Data")
xlabel("x-position")
ylabel("y-position")

figure()

%% (b) Function J(x_c, y_c, x_d, y_d) that calculates how close
% the simulated trajectory with drag coefficient c is with
% the measured trajectory from `TrajectoryData.xls`.
% Simply the norm of the difference between two vectors.

%% (c)

g = 9.81;                       % Gravitational Force (m/s^2)
mass = 0.3;                     % Mass of ball (kg)
theta_0 = 65;                   % Release angel (degrees)
v_0 = 35;                       % Initial velocity (m/s)

L = 101;
c_vals = linspace(0, 0.1, L);   % Drag coefficient candidates
cost = zeros(L, 1);             % Array of costs to save for comparison
legends = cell(L, 1);         % Cell for legends

z = [0;
     v_0 * cosd(theta_0);
     0;
     v_0 * sind(theta_0)];
 

for i = 1:L
    c = c_vals(i);
    [t, zOut] = ode45 (@(t,z) hw2Q4_ode45(t, z, c), time, z);
    
    x = zOut(:, 1);
    y = zOut(:, 3);
    
    cost(i) = norm([x; y] - [xMeas; yMeas]);
    legends{i} = sprintf("c = %0.3f", c);
    
    plot(x, y)
    hold on;
end

plot(xMeas, yMeas)
title("HW2 Q4(c): Simulation for various values of c")
xlabel("x-position")
ylabel("y-position")
legend(legends, 'Location', 'Best')

hold off;

%% Best c = 0.004
