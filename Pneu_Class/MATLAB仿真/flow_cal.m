function [q, p2] = flow_cal(p1, p2max)
global pi phi d rho kappa R T1 k x0 A A2
N = 1e5;
p2 = linspace(1e1, p2max, N);
q = zeros([1, N]);
for i=1:N
    delta_x =  x0 - ((A-A2)*p2(i) + p1*A2) / k;
    A0 = pi * d * delta_x * sin(phi/2) *(1-delta_x/(2*d)*sin(phi));
    Se = 0.9*A0;
    if p2(i)/p1 <= 0.5283
        q(i) = Se*p1/rho*sqrt(kappa/(R*T1)*(2/(kappa+1))^((kappa+1)/(kappa-1)));
    else
        q(i) = Se*p1/rho*sqrt( 2*kappa/(kappa-1) * 1/(R*T1) * ...
            ( (p2(i)/p1)^(2/kappa) - (p2(i)/p1)^((kappa+1)/kappa) ) );
    end
end
