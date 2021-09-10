clear;
clc;

% Variables
g = -9.81;                  % Gravitational Acceleration (m/s^2)
v0 = 35;                    % Initial velocity (m/s)
v0_x = 35 * cosd(65);       % Initial velocity in x-direction (m/s)
v0_y = 35 * sind(65);       % Initial velocity in y-direction (m/s)
mass = 0.3;                 % Mass of the ball (kg)
time_end = 7.0;             % Total trajectory time (sec)
wind_constant = 0.028;      % Wind Resistance constant

simOut = sim('me132Hw1Q5_BallTrajectoryDrag');

xOut = simOut.xOut;
yOut = simOut.yOut;

plot(xOut.Data, yOut.Data)
title("HW1 Q5: Trajectory of the Ball (with Drag)")
xlabel("x-position (m)")
ylabel("y-position (m)")
