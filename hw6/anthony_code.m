alpha = 60;
E = 40;
m = 1000;
G = 100;
Ki_temp = [];
Kp_temp = [];
wn = [0.4 1];
zeta = [0.2 0.7 1];

for i = 1:length(wn)
    for j = 1:length(zeta)
        Ki_temp = [Ki_temp (wn(i)^2 / E)];
        Kp_temp = [Kp_temp ((2 * zeta(j) * wn(i) - alpha) / E)];
    end
end

hold on
for k = 1:length(Kp_temp)
    Kp = Kp_temp(k);
    Ki = Ki_temp(k);
    sim3 = sim('simQ2');
    v = sim3.simout.Data;
    t = sim3.tout;
    plot(t,v);
end

title('(2) Cruise Control');
xlabel('time [s]');
ylabel('velocity [m/s]');
disp(Kp_temp);
disp(Ki_temp);
