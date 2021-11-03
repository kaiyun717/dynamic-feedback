% ME 132 Discussion 1 :: MATLAB Session

time = 4;

if time == 4
    disp("wake up")
else
    disp("don't wake up")
end


t = 0:0.1:10;
y = sin(t);

plot(t, y)
xlabel("time (s)")
ylabel("sin")
title("Trig Waves")
hold on;

y2 = cos(t);
plot(t,y2)