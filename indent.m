function RMS = indent(X)
global systemPodstawowy;

a = X(1);
T = X(2);

kompensator = tf([a*T,1],[T,1]);

systemSkompensowany = series(kompensator, systemPodstawowy);
S = stepinfo(feedback(systemSkompensowany,1));
P = S.Overshoot;

RMS = abs(P-20);