%% (b) 
log_w = logspace(-1, 2, 1000);
H_1 = 1 ./ (1j * log_w + 3);    % a = 1, b = 3
H_2 = 1 ./ (1j * log_w - 3);    % a = 1, b = -3
H_3 = -1 ./ (1j * log_w + 3);    % a = -1, b = 3
H_4 = -1 ./ (1j * log_w - 3);    % a = -1, b = -3

% Plot
tiledlayout(4, 2)

ax_11 = nexttile;
loglog(ax_11, log_w, abs(H_1))

ax_12 = nexttile;
semilogx(ax_12, log_w, angle(abs(H_1)))

ax_21 = nexttile;
loglog(ax_21, log_w, abs(H_2))

ax_22 = nexttile;
semilogx(ax_22, log_w, angle(abs(H_2)))


ax_31 = nexttile;
loglog(ax_31, log_w, abs(H_3))

ax_32 = nexttile;
semilogx(ax_32, log_w, angle(abs(H_3)))

ax_41 = nexttile;
loglog(ax_41, log_w, abs(H_4))

ax_42 = nexttile;
semilogx(ax_42, log_w, angle(abs(H_4)))

