clear;
clc;

%% Homework 2 Question 6
time_end = 10;           % seconds

%% Define all the inputs
time = linspace(0, time_end, 1000);
zeroArray = zeros(1000, 2);
zeroArray(:, 1) = time;

% (a)
u_a = zeroArray;
u_a(:, 2) = 1;

% (b)
u_b = zeroArray;
u_b(:, 2) = sind(time);

% (c)
u_c = zeroArray;
u_c(:, 2) = cosd(5 * time);

% (d)
u_d = zeroArray;
u_d(:, 2) = 25 * cosd(10 * time);

% (e)
u_e = zeroArray;
u_e = 25 * cosd(20 * time);

% (f)
u_f = zeroArray;
for t = 1:length(time)
    if (0 <= time(t)) && (time(t) < 3)
        u_f(t, 2) = time(t);
    end
    
    if (3 <= time(t)) && (time(t) < 5)
        u_f(t, 2) = time(t);
    end
    
    if (5 <= time(t)) && (time(t) < 7)
        u_f(t, 2) = -3;
    end
    
    if (7 <= time(t)) && (time(t) < 10)
        u_f(t, 2) = 2*time(t) -17;
    end
end

%% Plot the outputs for each input
u_list = {u_a, u_b, u_c, u_d, u_e, u_f};
u_name = ["(a)", "(b)", "(c)", "(d)", "(e)", "(f)"];

for i = 1:length(u_list)
    u = u_list{i};
    
    simOut_a = sim("hw2Q6_model");
    plot(simOut_a.yOut_1.Time, simOut_a.yOut_1.Data)
    
    hold on;
    
    plot(simOut_a.yOut_2.Time, simOut_a.yOut_2.Data)
    
    legend("yDot", "yDotDot")
    title(sprintf("Response Simulation %s", u_name(i)))
    xlabel("Time")
    ylabel("Output")
    figure()
end
    
