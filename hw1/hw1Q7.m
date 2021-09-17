clear;
clc;

% Variables
m = 1;              % Mass (kg)
c = 1;              % (N*s/m)
k = 1;              % Spring constant (N/m)
time_end = 12.0;    % Total control time (sec)

% Simulate and Plot
simOut = sim('me132Hw1Q7_ClosedLoopControl');

tOut = simOut.yOut.Time;
yOut = simOut.yOut.Data;

plot(tOut, yOut)

% title("HW1 Q7(a): Closed Loop Control")
% xlabel("time (seconds)")
% ylabel("y-position (m)")

hold on

% Error Introduced
k = 1.1;
simErrorOut = sim('me132Hw1Q7_ClosedLoopControl');
tErrorOut = simErrorOut.yOut.Time;
yErrorOut = simErrorOut.yOut.Data;

plot(tErrorOut, yErrorOut)

title("HW1 Q7(b): Closed Loop Control (with Error)")
xlabel("time (seconds)")
ylabel("y-position (m)")

hold off

legend("$\textit{k} = 1 \frac{N}{m}$", ...
       "$\textit{k} = 1.1 \frac{N}{m}$", ...
       "Interpreter", "latex")
