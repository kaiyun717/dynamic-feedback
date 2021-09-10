clear;
clc;

what = myFunction("running my function!", 5);
display(what);

anotherFunction = @(input) 5 * input .^ 2 + input - 5;
what2 = anotherFunction(5);
display(what2);

anotherFunction2 = @(input1, input2) 5 * input1 .^ 2 + input2 - 5;
what3 = anotherFunction2(5, 10);
display(what3); 


%% ODE45

xdot = @(t, x) 1;   % differential equation
x0 = -5;            % initial condition
tspan = [0 10];     % time of simulation

% simulate
[tout, xout] = ode45(xdot, tspan, x0);

% plot ode45 results
figure();
plot(tout, xout, 'k', 'Linewidth', 3);
xlabel('time (s)');
ylabel('ODE45 Simulation');
title("ODE45"); 