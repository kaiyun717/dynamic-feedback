function zdot = hw2Q4_ode45(t, z, c)
% 
mass = 0.3;                         % Mass of ball (kg)
g = 9.81;                   % Gravitational Acceleration (m/s^2)

xdot = z(2);                % Given xdot value
ydot = z(4);                % Given ydot value

v = sqrt(xdot^2 + ydot^2);  % Current velocity

zdot = zeros(4, 1);

zdot(1) = z(2);                     % xdot = z(2)
zdot(2) = -c*v*xdot / mass;         % xddot = (from question)
zdot(3) = z(4);                     % ydot = z(4)
zdot(4) = -c*v*ydot / mass - g;     % yddot = (from question)

end