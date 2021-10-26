w_A = 45;   % lb
w_B = 8;    % lb
g = 32.2;   % ft/s^2
m_A = w_A / g;
m_B = w_B / g;
r_A = 3;    % inch
r_B = 2;    % inch
theta = asind(r_A / (r_A + r_B));   % initial angle

e = 0.4;
v_A = 12;
v_B = 36;

% syms x
% n_eqn = m_A * v_A * cosd(theta) - m_B * v_B * cosd(theta) == m_A * (abs(v_A * cosd(theta) + v_B * cosd(theta)) * e - x) - m_B * x;
% v_B_prime_cosThetaB = solve(n_eqn, x);
% v_A_prime_cosThetaA = abs(v_A * cosd(theta) + v_B * cosd(theta)) * e - v_B_prime_cosThetaB;
% 
% v_A_prime_sinThetaA = v_A * sind(theta);
% v_B_prime_sinThetaB = v_B * sind(theta);
% 
% Theta_A = (atand(v_A_prime_sinThetaA / v_A_prime_cosThetaA));
% Theta_B = (atand(v_B_prime_sinThetaB / v_B_prime_cosThetaB));

syms theta_A theta_B v_A_prime v_B_prime
b_eqn = m_A*v_A*cosd(theta) - m_B*v_B*cosd(theta) == m_A*((v_A*cosd(theta)+v_B*cosd(theta))*e - v_B_prime*cosd(theta_B)) - m_B*v_B_prime*cos(theta_B);
v_B_prime = solve(b_eqn, v_B_prime)

a_eqn = (v_A*cosd(theta) + v_B*cosd(theta)) * e == v_A_prime*cosd(theta_A) + v_B_prime*cosd(theta_B);
v_A_prime = solve(a_eqn, v_A_prime)

tb_eqn = v_B*sind(theta) == v_B_prime*sind(theta_B);
theta_B = solve(tb_eqn, theta_B)
ta_eqn = v_A*sind(theta) == v_A_prime*sind(theta_A);
theta_A = solve(ta_eqn, theta_A)

% 
% v_A_prime = v_A*sind(theta) / sind(theta_A)
% v_B_prime = v_B*sind(theta) / sind(theta_B)

