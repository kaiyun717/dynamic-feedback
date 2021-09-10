Kfb = 4;
Kff = 3;

sim('me132LabPartG')

plot(out.yRocket.time, out.yRocket.signals.values)
xlabel("Input (Step Function)")
ylabel("Output Signal")
