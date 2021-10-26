%% Homework 6 Question 3
K_p = 1;
K_i = 0.5;
T_L = 0;
time_end = 20;

simOut = sim("hw6Q3_model");

%% Part (a)
figure(1)
plot(simOut.theta_a.Time, simOut.theta_a.Data, "LineWidth", 1.0)
hold on;
plot(simOut.u_a.Time, simOut.u_a.Data, "LineWidth", 1.0)
hold on;

title("Homework 6 Question 3(a)", "FontSize", 20)
xlabel("time ($sec$)", "Interpreter", "latex")
ylabel("Angle (rad)")

legend("Angular Position", "Input u")

%% Part (b)
figure(2)
plot(simOut.theta_b.Time, simOut.theta_b.Data, "LineWidth", 1.0)
hold on;
plot(simOut.u_b.Time, simOut.u_b.Data, "LineWidth", 1.0)
hold on;

title("Homework 6 Question 3(b)", "FontSize", 20)
xlabel("time ($sec$)", "Interpreter", "latex")
ylabel("Angle (rad)")

legend("Angular Position", "Saturated Input u")

%% Part (c)
figure (3)
plot(simOut.theta_c.Time, simOut.theta_c.Data, "LineWidth", 1.0)
hold on;
plot(simOut.u_c.Time, simOut.u_c.Data, "LineWidth", 1.0)
hold on;

title("Homework 6 Question 3(c)", "FontSize", 20)
xlabel("time ($sec$)", "Interpreter", "latex")
ylabel("Angle (rad)")

legend("Angular Position", "Saturated Input u")
