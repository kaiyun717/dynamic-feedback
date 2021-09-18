%% Homework 2 Question 5 (b)
clc;
clear;

log_w_b = logspace(-1, 2, 100);
H_b1 = 1 ./ (1j * log_w_b + 3);    % a = 1, b = 3
H_b2 = 1 ./ (1j * log_w_b - 3);    % a = 1, b = -3
H_b3 = -1 ./ (1j * log_w_b + 3);    % a = -1, b = 3
H_b4 = -1 ./ (1j * log_w_b - 3);    % a = -1, b = -3

% Plot
tiledlayout(2, 4)

ax_11 = nexttile;
loglog(ax_11, log_w_b, abs(H_b1))
title("Mag: a=1, b=3")

ax_12 = nexttile;
loglog(ax_12, log_w_b, abs(H_b2))
title("Mag: a=1, b=-3")

ax_13 = nexttile;
loglog(ax_13, log_w_b, abs(H_b3))
title("Mag: a=-1, b=3")

ax_14 = nexttile;
loglog(ax_14, log_w_b, abs(H_b4))
title("Mag: a=-1, b=-3")

ax_21 = nexttile;
semilogx(ax_21, log_w_b, angle(H_b1))
title("Phase; a=1, b=3")

ax_22 = nexttile;
semilogx(ax_22, log_w_b, angle(H_b2))
title("Phase; a=1, b=-3")

ax_23 = nexttile;
semilogx(ax_23, log_w_b, angle(H_b3))
title("Phase; a=-1, b=3")

ax_24 = nexttile;
semilogx(ax_24, log_w_b, angle(H_b4))
title("Phase; a=-1, b=-3")

sgtitle("Homework 2 Question 5(b)")

figure()

%% Homework 2 Question 5 (c)
clc;
clear;

log_w_c = logspace(-2, 0, 100);

T_1 = 1;
T_2 = 10;

H_c1 = exp(-1j * log_w_c * T_1);
H_c2 = exp(-1j * log_w_c * T_2);

tiledlayout(2, 2)

cx_11 = nexttile;
loglog(cx_11, log_w_c, abs(H_c1))
title("Mag: T = 1")

cx_12 = nexttile;
loglog(cx_12, log_w_c, abs(H_c2))
title("Mag: T = 10")

cx_21 = nexttile;
semilogx(cx_21, log_w_c, angle(H_c1))
title("Angle: T = 1")

cx_22 = nexttile;
semilogx(cx_22, log_w_c, angle(H_c2))
title("Angle: T = 10")

sgtitle("Homework 2 Question 5(c)")
