%% Form of continuous-time, DC-motor model
% We will do some simple modeling of a DC-motor in class.  For now, you can
% take the equations as given below.  The variables are
%
% * applied voltage, $V$, volts
% * current in windings, $I$, amperes
% * angular velocity of motor, $\omega$, rads/sec
% * Winding resistance, $R$, ohms
% * External applied torque, $T_e$, N-m
% * Viscous bearing friction, $\alpha$
% * Load moment of inertia, $J$, kg-m^2
% * motor back-EMF constant, $K_v$, Volt-Secs
% * Motor torque constant, $K_a$, N-m/ampere
%
% The governing equations are
%
% $V(t) - I (t) R - K_v \omega (t) = 0$
%
% $J \dot \omega (t) = K_a I(t) + T_{e}(t) - \alpha \omega(t)$
%

%% Eliminate $I$ from model
% Solving for $I$ gives
%
% $I(t) = \frac{1}{R} \left( V(t) - K_v \omega(t) \right)$
%
% Substituting this into the governing equation for $\dot \omega$ gives
%
% $J \dot \omega (t) = \frac{K_a}{R} \left( V(t) - K_v \omega(t) \right) -
% \alpha \omega (t)$
%
% giving
%
% $\dot \omega (t) = \frac{\alpha R - K_a K_v}{JR}  \omega(t) +
% \frac{K_a}{JR} V(t)$
%
% This is a first-order system, with a specific time-constant ($tau$), and
% steady-state gain ($\gamma$), so rewritten as
%
% $\dot \omega (t) = \frac{1}{\tau} \left( -\omega(t) + \gamma V(t) \right)$
%
% We will determine these two parameters, approximately, from several
% simple experiments.  Unfortunately, since there are 5 physical
% parameters, our limited experiments will only allow us to infer the
% time-constant and steady-state gain, and not the individual physical
% parameters themselves.

%% Experiment description
% We can easily apply a constant input $V(t) = \bar V$, and zero external
% torque, $T_e (t) = 0$.   With the built-in angle encoder, we measure the
% resultant angle $\theta(t)$.  The crude angle encoder that has a
% quantization level of 1 degree.  The measurement is sampled (at 50
% measurements/second).

%% Converting experimental output
% The experimental setup easily allows you to apply a contant voltage to the
% system with initial condition $\omega(0) = 0$ and $\theta(0) = 0$.  The
% only output that is available is the angular displacement, sampled at 50
% samples/second, and quantized at 1-degree.  We need to convert this
% $\theta$ measurement to $\omega$, through some form of numerical
% differentiation.
%
% Instead of radians for the angular displacement, we will use degrees, as
% that is the units of the encoder.  We will work on identifying $\tau$ and
% $\gamma$ in these units (note that $\tau$ is unaffected by a unit-change
% in $\omega$ or $\theta$, but the steady=state gain is affected by unit
% choices there, and in $V$ as well).
%
% Let's pretend like the system has $\tau = 0.1$ and $\gamma = 14$, so the
% response to $V(t) = \bar V$ is $\omega(t) = 14 \bar V (1-e^{-10 t})$.
% Integrating this, and getting the initial conditions right means we will
% observe
%
% $\theta(t) = 14 \bar V \left( t - \frac{1}{10} \left( 1 - e^{-10t}
% \right) \right)$
%
% But the measurement is sampled, at time-interval $T = 0.02$ so the
% value at the k'th measurement, $k=0,1,...$ is
%
% $\theta^k := \theta (t = kT)$
%
% Furthermore the measurement is quantized, with quantization level 1, so
%
% $\theta_{\rm meas}^k := {\rm round}(\theta^k)$
%
barV = 30;
DeltaT = 0.02;
nSamples = 50;
OmegaTrue = @(t) 14*barV*(1-exp(-10*t));
ThetaTrue = @(t) 14*barV*(t-(1/10).*(1-exp(-10*t)));
tMeas = (0:nSamples-1)*DeltaT;
ThetaSampled = ThetaTrue(tMeas);
ThetaSampledQuantized = round(ThetaSampled);
plot(tMeas,ThetaSampledQuantized,'+')

%% Estimating the derivative using least-squares polynomial fits
wEst = zeros(1,numel(tMeas));
% We will use 5 points, centered at |tMeas(i)| to fit a quadratic function
% through the data, using POLYFIT.  The means we use |tMeas(i-2:i+2)|, so
% our estimate needs to start at tMeas(3) and end at tMeas(end-2).  The
% "estimates" at |tMeas(1)|, |tMeas(2)|, |tMeas(end-1)|, |tMeas(end)| are
% simply zero, since we don't have all of the necessary points, and will be
% ignored (even though they are plotted).
for i=(1+2):(numel(tMeas)-2)
   % Take 5 points, centered at tMeas(i), fit with quadratic
   P = polyfit(tMeas(i-2:i+2),ThetaSampledQuantized(i-2:i+2),2);
   % Take derivative of quadratic
   W = polyder(P);
   % Evaluate derivative at tMeas(i), to get estimate of angular velocity
   wEst(i) = polyval(W,tMeas(i));
end
plot(tMeas,wEst,'o',tMeas,wEst,'r',tMeas,OmegaTrue(tMeas),'k--');
legend('Discrete Estimate','Estimate as Line','True (unknown in experiment)',...
   'location','southeast')
grid minor

%% Estimate the steady-state value
% Take the mean of the last 9 estimates, and call that the steady-state for
% $\omega$.   Divide that by |barV| to get an estimate of the steady-state
% gain.  Plot the estimated response, and the 3 values associated with one,
% two and 3 time constants (ie., $e^{-1}, e^{-2}, e^{-3}$ times the final
% value, so that you can estimate the time-constant by examining the graph.
steadyStateValue = mean(wEst(end-10:end-2));
steadyStateGain = steadyStateValue/barV;
disp(['Estimate of Steady-State Gain = ' num2str(steadyStateGain)]);
plot(tMeas,wEst,'o',tMeas,wEst,'r',...
   tMeas,repmat(steadyStateValue,[1 numel(tMeas)]),'g',...
   tMeas,repmat((1-exp(-1))*steadyStateValue,[1 numel(tMeas)]),...
   tMeas,repmat((1-exp(-2))*steadyStateValue,[1 numel(tMeas)]),...
   tMeas,repmat((1-exp(-3))*steadyStateValue,[1 numel(tMeas)]))
hold off
grid minor
ylabel('\omega (deg/s)');
xlabel('time (s)');
   
%% Task #1
% Apply these ideas to the p-coded file |SyntheticMotor.p|.  The syntax is
% |[ThetaSampledQuantized,tVec] = syntheticMotor(barV)|.   The outout is the
% sampled (at 0.02 seconds), quantized (at 1-degree) measurement for 50
% samples, starting at t=0.  Both arguments are returned as row-vectors.
% Apply the ideas we used above, using 6 values for |barV|, namely 5, 10,
% 20, 40, 60, 80.  *At which input-levels does the quantization cause the
% most difficulty?*  In each case, estimate the steady-state gain, and the
% time-constant.  Collect all of your estimates into a single estimate for
% the time-constant, and a single estimate for the steady-state gain, along
% with an assessment of the uncertainty you are observing.
%
% *Turn in (as a group) your answer to the question above, your 6 plots 
% ($\omega$ vs $t$), and table of time constants, $\tau$, and steady state 
% gain constants, $\gamma$.*

inputs = [5, 10, 20, 40, 60, 80];

for i = 1:length(inputs)
    barV = inputs(i);
    [tTheta, tVec] = SyntheticMotor(barV);
    
    for j=(1+2):(numel(tMeas)-2)
       % Take 5 points, centered at tMeas(i), fit with quadratic
       P = polyfit(tMeas(j-2:j+2),ThetaSampledQuantized(j-2:j+2),2);
       % Take derivative of quadratic
       W = polyder(P);
       % Evaluate derivative at tMeas(i), to get estimate of angular velocity
       wEst(j) = polyval(W,tMeas(j));
    end
    plot(tMeas,wEst,'o',tMeas,wEst,'r',tMeas,OmegaTrue(tMeas),'k--');
end

plot(tMeas,wEst,'o',tMeas,wEst,'r',tMeas,OmegaTrue(tMeas),'k--');
legend('Discrete Estimate','Estimate as Line','True (unknown in experiment)',...
   'location','southeast')
grid minor


%% Attribution
% UC Berkeley, ME 132