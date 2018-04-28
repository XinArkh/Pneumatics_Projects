function [p1, p2] = pressure_cal(q, p1max)
global pi phi d rho kappa R T1 k x0 A A2
N = 1e5;
p1 = linspace(1e5, p1max, N);
p2 = zeros([1, N]);
for i=1:N
    Se = rho * q / ( p1(i) * ...
        sqrt( kappa/(R*T1)*(2/(kappa+1))^((kappa+1)/(kappa-1)) ) );
    A0 = Se / 0.9;
    delta_x = (pi*d*sin(phi/2)-sqrt(pi^2*d^2*(sin(phi/2))^2-2*pi*sin(phi)*sin(phi/2)*A0)) / ...
        (pi*sin(phi)*sin(phi/2));
    p2(i) = (k*(x0-delta_x)-p1(i)*A2)/(A-A2);
    flag = 0;
    while p2(i)/p1(i) > 0.5283 && p2(i)/p1(i) <= 1 && flag < 10
        Se = rho * q / ( p1(i)* ...
            sqrt(  2*kappa/(kappa-1) * 1/(R*T1) * ...
            ( (p2(i)/p1(i))^(2/kappa) - (p2(i)/p1(i))^((kappa+1)/kappa) ) ) );
        A0 = Se / 0.9;
        delta_x = (pi*d*sin(phi/2)-sqrt(pi^2*d^2*(sin(phi/2))^2-2*pi*sin(phi)*sin(phi/2)*A0)) / ...
            (pi*sin(phi)*sin(phi/2));
        p2(i) = (k*(x0-delta_x)-p1(i)*A2)/(A-A2);
        flag = flag + 1;
    end
    if p2(i) < 0
        p2(i) = nan;
    end
end 
