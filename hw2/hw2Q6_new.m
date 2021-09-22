clear;
clc;

%% Homework 2 Question 6
time_end = 10;           % seconds

%% Plot the outputs for each input

simOut = sim("hw2Q6_model");

tiledlayout(2, 3)

%% Part (a) Plot
ax_a = nexttile;
plot(ax_a, simOut.yOut_a1.Time, simOut.yOut_a1.Data)
hold on;
plot(ax_a, simOut.yOut_a2.Time, simOut.yOut_a2.Data)
title("Q.6(a)")
xlabel("time")
ylabel("y")
legend("yDot", "yDotDot")

%% Part (b) Plot
ax_b = nexttile;
plot(ax_b, simOut.yOut_b1.Time, simOut.yOut_b1.Data)
hold on;
plot(ax_b, simOut.yOut_b2.Time, simOut.yOut_b2.Data)
title("Q.6(b)")
xlabel("time")
ylabel("y")
legend("yDot", "yDotDot")

%% Part (c) Plot
ax_c = nexttile;
plot(ax_c, simOut.yOut_c1.Time, simOut.yOut_c1.Data)
hold on;
plot(ax_c, simOut.yOut_c2.Time, simOut.yOut_c2.Data)
title("Q.6(c)")
xlabel("time")
ylabel("y")
legend("yDot", "yDotDot")

%% Part (d) Plot
ax_d = nexttile;
plot(ax_d, simOut.yOut_d1.Time, simOut.yOut_d1.Data)
hold on;
plot(ax_d, simOut.yOut_d2.Time, simOut.yOut_d2.Data)
title("Q.6(d)")
xlabel("time")
ylabel("y")
legend("yDot", "yDotDot")

%% Part (e) Plot
ax_e = nexttile;
plot(ax_e, simOut.yOut_e1.Time, simOut.yOut_e1.Data)
hold on;
plot(ax_e, simOut.yOut_e2.Time, simOut.yOut_e2.Data)
title("Q.6(e)")
xlabel("time")
ylabel("y")
legend("yDot", "yDotDot")

%% Part (f) Plot
ax_f = nexttile;
plot(ax_f, simOut.yOut_f1.Time, simOut.yOut_f1.Data)
hold on;
plot(ax_f, simOut.yOut_f2.Time, simOut.yOut_f2.Data)
title("Q.6(f)")
xlabel("time")
ylabel("y")
legend("yDot", "yDotDot")
